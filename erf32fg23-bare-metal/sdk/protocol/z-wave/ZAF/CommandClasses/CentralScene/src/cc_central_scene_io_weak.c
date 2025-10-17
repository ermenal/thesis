/**
 * @file
 * Command Class Central Scene I/O handling
 * @copyright 2022 Silicon Laboratories Inc.
 */

#include "cc_central_scene_io.h"
#include <ZW_typedefs.h>
//#define DEBUGPRINT
#include "DebugPrint.h"

ZW_WEAK bool cc_central_scene_read(__attribute__((unused)) central_scene_configuration_t* pConfig)
{
  return true;
}

ZW_WEAK bool cc_central_scene_write(__attribute__((unused)) const central_scene_configuration_t* pConfig)
{
  return true;
}

ZW_WEAK void
cc_central_scene_migrate(void)
{

}