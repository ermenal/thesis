/***************************************************************************//**
 * @file
 * @brief Implementation of the interface described in serial-interface.h
 * using the ASH UART protocol.
 *******************************************************************************
 * # License
 * <b>Copyright 2018 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * The licensor of this software is Silicon Laboratories Inc. Your use of this
 * software is governed by the terms of Silicon Labs Master Software License
 * Agreement (MSLA) available at
 * www.silabs.com/about-us/legal/master-software-license-agreement. This
 * software is distributed to you in Source Code format and is governed by the
 * sections of the MSLA applicable to Source Code.
 *
 ******************************************************************************/

#include PLATFORM_HEADER

#include "stack/include/ember-types.h"
#include "app/util/ezsp/ezsp-protocol.h"
#include "app/util/ezsp/ezsp-enum.h"
#include "app/util/ezsp/ezsp.h"
#include "app/ezsp-host/cpc/cpc-host.h"
#include "app/util/ezsp/serial-interface.h"
#include "app/ezsp-host/ezsp-host-queues.h"
#include "app/ezsp-host/ezsp-host-io.h"
#include "sl_cpc.h"
#include <sys/time.h>
#include <errno.h>
#include <stdio.h>
#include <time.h>
#include <signal.h>
#include <unistd.h>
#define elapsedTimeInt16u(oldTime, newTime) \
  ((uint16_t) ((uint16_t)(newTime) - (uint16_t)(oldTime)))

#define ZIGBEE_CPC_TRANSMIT_WINDOW 1
#define WAIT_FOR_RESPONSE_TIMEOUT_S 5

static uint8_t ezspFrameLength;
uint8_t *ezspFrameLengthLocation = &ezspFrameLength;
static uint8_t ezspFrameContentsStorage[EZSP_MAX_FRAME_LENGTH];
uint8_t *ezspFrameContents = ezspFrameContentsStorage;
static bool waitingForResponse = false;

static cpc_handle_t zigbee_cpc_handle;
static bool cpc_initialized = false;
volatile sig_atomic_t cpc_secondary_has_reset = false;
char *zigbee_cpc_instance_name = NULL;
static cpc_endpoint_t zigbee_cpc_endpoint;
static uint8_t zigbee_cpc_rx_buffer[SL_CPC_READ_MINIMUM_SIZE];
static int zigbee_cpc_fd = NULL_FILE_DESCRIPTOR;

//#define CPC_TEST_CODE

#ifdef CPC_TEST_CODE
 #define test_print printf
#else // CPC_TEST_CODE
 #define test_print(...)
#endif // CPC_TEST_CODE
bool endpoint_was_opened = false;
static int max_restart_attempts = 3;
bool in_ncp_reset(void);
/******************************************************************************
 * Callback to register reset from other end.
 *****************************************************************************/
bool in_ncp_reset(void)
{
  return cpc_secondary_has_reset;
}

static void reset_crash_callback(void)
{
  // This code is invoked from within a signal handler
  // do not call functions here
  cpc_secondary_has_reset = true;
}

EzspStatus ezspInit(void)
{
  int ret;
  int attempts;

  // 1A. Init or restart CPC
  if ( !cpc_initialized ) {
    // INITIALIZE CPC - Once per reset
    attempts = 0;
    do {
      ret = cpc_init(&zigbee_cpc_handle,
                     zigbee_cpc_instance_name, // if NULL, uses default instance name (cpcd_0)
                     false, // no debug traces in stderr
                     reset_crash_callback);

      attempts++;
      if ( ret != 0 ) {
        sleep(1);
      }
    } while ((ret != 0) && (attempts < max_restart_attempts));

    if (ret) {
      printf("Failed to connect to %s\n",
             zigbee_cpc_instance_name
             ? zigbee_cpc_instance_name
             : "default CPCd instance");
      return EZSP_CPC_ERROR_INIT;
    }
  } else {
    // 1B. RESTART CPC -CPC was previously initialized, comm failure/ NCP reset called ezsp reset
    attempts = 0;
    cpc_secondary_has_reset = false;

    if (endpoint_was_opened) {
      ret =  cpc_close_endpoint(&zigbee_cpc_endpoint);
      assert(ret == 0);
      endpoint_was_opened = false;
    }
    do {
      ret = cpc_restart(&zigbee_cpc_handle);
      attempts++;
      if (ret < 0) {
        sleep(1);
      }
    } while ((ret < 0) && (attempts < max_restart_attempts));

    if (ret < 0) {
      printf("cpc_restart error: 0x%0X", ret);
      return EZSP_CPC_ERROR_INIT;
    }
  }

  // 2. Open end point
  attempts = 0;
  do {
    zigbee_cpc_fd = cpc_open_endpoint(zigbee_cpc_handle,
                                      &zigbee_cpc_endpoint,
                                      SL_CPC_ENDPOINT_ZIGBEE,
                                      ZIGBEE_CPC_TRANSMIT_WINDOW);
    attempts++;
    if ( zigbee_cpc_fd <= 0 ) {
      sleep(1);
    }
  } while ((zigbee_cpc_fd <= 0) && (attempts < max_restart_attempts));

  printf("Connected to CPC daemon, endpoint %d: %s\n",
         SL_CPC_ENDPOINT_ZIGBEE,
         zigbee_cpc_fd > 0 ? "OK" : "ERROR");

  if (zigbee_cpc_fd <= 0) {
    return EZSP_CPC_ERROR_INIT;
  }
  endpoint_was_opened = true;
  ezspInitQueues();
  cpc_initialized = true;

  return EZSP_SUCCESS;
}

void ezspClose(void)
{
  int retVal =  cpc_close_endpoint(&zigbee_cpc_endpoint);
  if (retVal == -1) {
    printf("Unable to close endpoint. Shutting down host\n");
    exit(-1);
  } else {
    printf("Use cpcd to bootload NCP. Refer to the cpcd user guide. Closing CPC connection and shutting down host\n");
    exit(0);
  }
}

bool ezspCallbackPending(void)
{
  return (ncpSleepEnabled && ncpHasCallbacks);
}

uint8_t serialPendingResponseCount(void)
{
  return ezspQueueLength(&rxQueue);
}

WEAK_TEST EzspStatus serialResponseReceived(void)
{
  if (!cpc_initialized || cpc_secondary_has_reset) {
    return EZSP_NOT_CONNECTED;
  }
  int  ret = 0;
  // Do a blocking read depending on if we're waiting for a response
  ret = cpc_set_endpoint_option(zigbee_cpc_endpoint,
                                CPC_OPTION_BLOCKING,
                                &waitingForResponse,
                                sizeof(waitingForResponse));
  assert(ret == 0);

  if (waitingForResponse) {
    cpc_timeval_t timeout = { WAIT_FOR_RESPONSE_TIMEOUT_S, 0 };
    ret = cpc_set_endpoint_option(zigbee_cpc_endpoint,
                                  CPC_OPTION_RX_TIMEOUT,
                                  &timeout,
                                  sizeof(timeout));
    assert(ret == 0);
  }

  ssize_t read_out = cpc_read_endpoint(zigbee_cpc_endpoint,
                                       zigbee_cpc_rx_buffer,
                                       sizeof(zigbee_cpc_rx_buffer),
                                       CPC_ENDPOINT_READ_FLAG_NONE);

  if (read_out > 0) {
    test_print("CPC RX %d bytes\n", read_out);

    EzspBuffer *rx_data = ezspAllocBuffer(&rxFree);
    if (rx_data == NULL) {
      // flag if we don't have buffers to queue rx
      return EZSP_NO_RX_SPACE;
    }
    // TODO trace buffer allocation
    memcpy(rx_data->data, zigbee_cpc_rx_buffer, read_out);
    rx_data->len = (size_t) read_out;
    ezspAddQueueTail(&rxQueue, rx_data);
    // TODO trace debug for enqueueing
  } else {
    // TODO read errno
    // TODO trace output error
    if (waitingForResponse) {
      test_print("[cpc error while waiting]\n");
      waitingForResponse = false;
      return EZSP_ERROR_NO_RESPONSE;
    }
  }

  EzspStatus ezsp_status = EZSP_NO_RX_DATA;
  EzspBuffer *q_buffer;
  EzspBuffer *drop_buffer = NULL;
  q_buffer = ezspQueuePrecedingEntry(&rxQueue, NULL);
  while (q_buffer != NULL) {
    // NOTE if we are waiting for a response and the buffer is async, skip over the entry
    // While we are waiting for a response to a command, we use the asynch
    // callback flag to ignore asynchronous callbacks. This allows our caller
    // to assume that no callbacks will appear between sending a command and
    // receiving its response.
    if (waitingForResponse
        && (q_buffer->data[EZSP_FRAME_CONTROL_INDEX] & EZSP_FRAME_CONTROL_ASYNCH_CB_MASK)) {
      // if there are no free buffers, drop the current buffer
      if (ezspFreeListLength(&rxFree) == 0) {
        drop_buffer = q_buffer;
      }
      q_buffer = ezspQueuePrecedingEntry(&rxQueue, q_buffer);
    } else {
      // NOTE either we are not waiting for a response, or this is the response we are waiting for
      // TODO trace the response has been received
      // remove the buffer from the queue
      ezspRemoveQueueEntry(&rxQueue, q_buffer);
      memcpy(ezspFrameContents, q_buffer->data, q_buffer->len);
      // TODO trace the received frame id
      ezspFrameLength = q_buffer->len;
      ezspFreeBuffer(&rxFree, q_buffer);
      // TODO trace output bytes
      ezsp_status = EZSP_SUCCESS;
      // NOTE while loop break condition
      q_buffer = NULL;
      waitingForResponse = false;
    }
  }
  if (drop_buffer != NULL) {
    ezspRemoveQueueEntry(&rxQueue, drop_buffer);
    ezspFreeBuffer(&rxFree, drop_buffer);
    // TODO debug traces
    // ezspTraceEzspFrameId("dropping", drop_buffer->data);
    // ezspTraceEzspVerbose("serialResponseReceived(): ezspFreeBuffer(): drop %u", dropBuffer);
    // ezspTraceEzspVerbose("serialResponseReceived(): ezspErrorHandler(): EZSP_ERROR_QUEUE_FULL");
    ezspErrorHandler(EZSP_ERROR_QUEUE_FULL);
  }
  return ezsp_status;
}

WEAK_TEST EzspStatus serialSendCommand(void)
{
  if (!cpc_initialized || cpc_secondary_has_reset) {
    return EZSP_NOT_CONNECTED;
  }

  // TODO debug trace apis aren't configured yet - use printfs for debug
  // ezspTraceEzspFrameId("send command", ezspFrameContents);
  size_t write_out = cpc_write_endpoint(zigbee_cpc_endpoint,
                                        ezspFrameContents,
                                        serialGetCommandLength(),
                                        CPC_ENDPOINT_WRITE_FLAG_NON_BLOCKING);

  // NOTE most errors that occur during endpoint writing are handled by the generic error handler
  // so many of the error cases are going to be caught there on cb rather than locally here
  if (write_out != serialGetCommandLength()) {
    // ezspTraceEzspVerbose("cpc bytes sent do not match expected %d != %d", write_out, serialGetCommandLength());
    return EZSP_HOST_FATAL_ERROR;
  }

  test_print("CPC TX %d bytes\n", write_out);

  // ezspTraceEzspVerbose("serialSendCommand(): ID=0x%x Seq=0x%x",
  //                      ezspFrameContents[EZSP_FRAME_ID_INDEX],
  //                      ezspFrameContents[EZSP_SEQUENCE_INDEX]);
  // TODO check for error status...
  // wait for response
  waitingForResponse = true;
  // TODO get current time for debug / response timeout
  return EZSP_SUCCESS;
}

uint8_t serialGetCommandLength(void)
{
  return *ezspFrameLengthLocation;
}

int sli_zigbee_get_cpc_fd(void)
{
  return zigbee_cpc_fd;
}

// Stub for legacy HAL code
void halNcpSerialInit(void)
{
}
