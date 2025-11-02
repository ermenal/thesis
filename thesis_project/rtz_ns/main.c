/***************************************************************************//**
 * @file main.c
 * @brief The main() function.
 *******************************************************************************
 * # License
 * <b>Copyright 2020 Silicon Laboratories Inc. www.silabs.com</b>
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

// -----------------------------------------------------------------------------
//                                   Includes
// -----------------------------------------------------------------------------
#include "cmsis_nvic_virtual.h"
#include "efr32fg23b010f512im48.h"
#include "sl_component_catalog.h"
#include "sl_system_init.h"
#include "system_efr32fg23.h"
#include <string.h>
#if defined(SL_CATALOG_POWER_MANAGER_PRESENT)
#include "sl_power_manager.h"
#endif
#if defined(SL_CATALOG_KERNEL_PRESENT)
#include "sl_system_kernel.h"
#else // SL_CATALOG_KERNEL_PRESENT
#include "sl_system_process_action.h"
#endif // SL_CATALOG_KERNEL_PRESENT
#include "app_init.h"
#include "app_process.h"
#include "sli_tz_s_interface.h"

#define PAYLOAD_LENGTH 16
static uint8_t payload[PAYLOAD_LENGTH] =
    {PAYLOAD_LENGTH - 1, 0x01, 0x02, 0x03, 0x04,
  0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x00 };

static volatile bool send_packet = false;
static volatile bool packet_received = false;

/*
* Handler voor packet RX forward van SW
* Bij RX event: zet packet_received flag om in main loop packet te downloaden
*/
void SW0_IRQHandler(void) 
{
  // print_nsc("SW0 HANDLER\n", sizeof("SW0 HANDLER\n") - 1);
  packet_received = true;
  NVIC_ClearPendingIRQ(SW0_IRQn);
}

/*
* Handler voor button pressed forward van SW
* Bij button press: zet send_packet flag om in main loop een packet te sturen
* + toggle LED
*/
void SW1_IRQHandler(void)
{
  send_packet = true;
  toggle_led_nsc();
  NVIC_ClearPendingIRQ(SW1_IRQn);
}

int main(void)
{
  NVIC_EnableIRQ(SW0_IRQn); // Radio RX event 
  NVIC_EnableIRQ(SW1_IRQn); // Button press event
  while (1) {
    if (send_packet) {
      send_packet = false;
      print_nsc("Transmitting in NS\n", sizeof("Transmitting in NS\n") - 1);
      
      transmit_nsc(payload, PAYLOAD_LENGTH);  
      payload[PAYLOAD_LENGTH - 1]++;
    }
    if (packet_received) {
      packet_received = false;
      char rx_buf[PAYLOAD_LENGTH*2];
      uint16_t packet_bytes = download_packet_nsc(rx_buf, PAYLOAD_LENGTH*2);

      char to_print[200] = "RX PACKET RECEIVED: ";
      for (int i=0; i<packet_bytes; i++) {
        snprintf(to_print + strlen(to_print), 200 - strlen(to_print), "0x%02X ", rx_buf[i]);
      }
      snprintf(to_print + strlen(to_print), 200 - strlen(to_print), "\n");
      print_nsc(to_print, strlen(to_print));
    }
  }
}
