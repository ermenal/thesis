/***************************************************************************//**
 * @file
 * @brief EZSP SPI Host user interface functions
 *
 * This includes command option parsing, trace and counter functions.
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
#include <string.h>
#ifndef WIN32
  #define __USE_POSIX2
  #include <unistd.h>
  #include <time.h>
  #include <sys/types.h>
  #include <sys/stat.h>
  #include <unistd.h>
#endif
#include <stdlib.h>
#include <stdio.h>
#include "stack/include/ember-types.h"
#include "app/util/ezsp/ezsp-protocol.h"
#include "app/ezsp-host/ezsp-host-common.h"
#include "app/ezsp-host/spi/spi-host.h"
#include "app/ezsp-host/ezsp-host-priv.h"
#include "app/ezsp-host/ezsp-host-io.h"
#include "app/ezsp-host/ezsp-host-queues.h"
#include "app/ezsp-host/ezsp-host-ui.h"
#include "app/ezsp-host/spi/spi-host-ui.h"
#ifdef SL_COMPONENT_CATALOG_PRESENT
#include "sl_component_catalog.h"
#endif  // SL_COMPONENT_CATALOG_PRESENT
#ifdef SL_CATALOG_ZIGBEE_OTA_STORAGE_POSIX_FILESYSTEM_PRESENT
#include "ota-storage-linux-config.h"
#endif  // SL_CATALOG_ZIGBEE_OTA_STORAGE_POSIX_FILESYSTEM_PRESENT

//------------------------------------------------------------------------------
// Preprocessor definitions

#define ERR_LEN               128   // max length error message

#define txControl (txBuffer[0])     // more descriptive aliases
#define rxControl (rxBuffer[0])

static const char options[] = "h::t:v::d:";

extern int optind, opterr, optopt;
extern char *optarg;
#ifdef SL_CATALOG_ZIGBEE_OTA_STORAGE_POSIX_FILESYSTEM_PRESENT
// To set the OTA file storage directory in runtime.
extern char defaultStorageDirectory[OTA_FILE_STORAGE_DIR_LENGTH];
#endif  // SL_CATALOG_ZIGBEE_OTA_STORAGE_POSIX_FILESYSTEM_PRESENT

bool ezspInternalProcessCommandOptions(int argc, char *argv[], char *errStr)
{
  int c;
  uint8_t trace;

  while (true) {
    c = getopt(argc, argv, options);
    if (c == -1) {
      if (optind != argc ) {
        snprintf(errStr, ERR_LEN, "Invalid option %s.\n", argv[optind]);
      }
      break;
    }

    switch (c) {
      case 'h':
      case '?':
        snprintf(errStr, ERR_LEN, "\n");
        break;
      case 't':
        if (sscanf(optarg, "%hhu", &trace) != 1) {
          snprintf(errStr, ERR_LEN, "Invalid trace flag value %s.\n", optarg);
        } else {
          spiWriteConfig(traceFlags, trace);
        }
        break;
      case 'd': {
  #ifdef SL_CATALOG_ZIGBEE_OTA_STORAGE_POSIX_FILESYSTEM_PRESENT
        char otaStorageDir[128];
        int ret = 0;
        if (!optarg || (sscanf(optarg, "%127s", otaStorageDir) <= 0)) {
          ret = snprintf(errStr, ERR_LEN, "Invalid OTA files storage directory name %s.\n",
                         optarg ? optarg : "NULL");
        } else if (strlen(otaStorageDir) >= OTA_FILE_STORAGE_DIR_LENGTH) {
          ret = snprintf(errStr, ERR_LEN, "OTA files storage directory %s too long.\n",
                         otaStorageDir);
        } else {
          otaStorageDir[OTA_FILE_STORAGE_DIR_LENGTH - 1] = '\0';
          strncpy(defaultStorageDirectory, otaStorageDir, OTA_FILE_STORAGE_DIR_LENGTH);
        }
        if (ret < 0) {
          snprintf(errStr, ERR_LEN, "Error with OTA files storage directory.\n");
        }
  #endif  // SL_CATALOG_ZIGBEE_OTA_STORAGE_POSIX_FILESYSTEM_PRESENT
      }
      break;
      default:
        assert(1);
        break;
    }   // end of switch (c)
  } //end while
  return true;
}
