/***************************************************************************//**
 * @file
 * @brief Silicon Labs TrustZone secure NVM3 service (secure side).
 *******************************************************************************
 * # License
 * <b>Copyright 2022 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * SPDX-License-Identifier: Zlib
 *
 * The licensor of this software is Silicon Laboratories Inc.
 *
 * This software is provided 'as-is', without any express or implied
 * warranty. In no event will the authors be held liable for any damages
 * arising from the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software. If you use this software
 *    in a product, an acknowledgment in the product documentation would be
 *    appreciated but is not required.
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 *
 ******************************************************************************/

#include <stddef.h>
#include <stdint.h>

#include "mbedtls/platform.h"

#include "sli_tz_service_nvm3.h"
#include "sli_tz_iovec_check.h"

//------------------------------------------------------------------------------
// Macros

/**
 * \brief Validate the number of IOVECs passed.
 */
#define _TZ_NVM3_ASSERT_N_IOVECS(expected_invecs, expected_outvecs) \
  SLI_TZ_IOVEC_ASSERT_N_IOVECS(expected_invecs, expected_outvecs, ECODE_NVM3_ERR_PARAMETER)

/**
 * \brief Validate the number of IOVECs passed.
 */
#define _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(iovec, expected_struct_type) \
  SLI_TZ_IOVEC_ASSERT_STRUCT_SIZE(iovec, expected_struct_type, ECODE_NVM3_ERR_PARAMETER)

//------------------------------------------------------------------------------
// Global variables

nvm3_Handle_t  nvm3_defaultHandleData;
nvm3_Handle_t *nvm3_defaultHandle = &nvm3_defaultHandleData;

// Pointers to caches allocated for different NVM3 instances. Index 0 is used by
// the default instance -- SLI_TZ_SERVICE_NVM3_INSTANCE_CACHE_START_INDEX.
nvm3_CacheEntry_t *sli_tz_nvm3_caches[SLI_TZ_SERVICE_NVM3_MAX_INSTANCES] = { 0 };

//------------------------------------------------------------------------------
// Common (ITS and NVM3) service functions

Ecode_t sli_tz_nvm3_init_default(sli_tz_invec in_vec[],
                                 size_t in_len,
                                 sli_tz_outvec out_vec[],
                                 size_t out_len)
{
  (void) out_vec;
  _TZ_NVM3_ASSERT_N_IOVECS(2, 0);

  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[1], nvm3_Init_t);

  // Copy the provided init data into a new struct, such that the original
  // remains untouched (which is expected since it's a const parameter).
  nvm3_Init_t init_data = *((nvm3_Init_t *)in_vec[1].base);

  if (init_data.halHandle != NULL
      || init_data.cachePtr != NULL) {
    // The flash handle- and cache pointers must explicitly be set to NULL by NS
    // to make it clear that it allow the secure application to manage these
    // aspects of NVM3. We don't want to make the NS side believe it can provide
    // its own pointers for these parameters.
    return ECODE_NVM3_ERR_NOT_OPENED;
  }

  // Overwrite NULL pointer with actual flash handle defined in nvm3_hal_flash.c.
  extern const nvm3_HalHandle_t nvm3_halFlashHandle;
  init_data.halHandle = &nvm3_halFlashHandle;

  // Install a pointer to the cache (either a newly allocated one, or the
  // existing one if we're reopening the instance).
  if (nvm3_defaultHandle->hasBeenOpened) {
    if (sli_tz_nvm3_caches[0] == NULL) {
      return ECODE_NVM3_ERR_NOT_OPENED;
    }
  } else {
    // Allocate a new cache for the default instance.
    sli_tz_nvm3_caches[0] =
      (nvm3_CacheEntry_t *)mbedtls_calloc(init_data.cacheEntryCount,
                                          sizeof(nvm3_CacheEntry_t));
    if (sli_tz_nvm3_caches[0] == NULL) {
      return ECODE_NVM3_ERR_NOT_OPENED;
    }
  }
  init_data.cachePtr = sli_tz_nvm3_caches[0];

  Ecode_t nvm3_status;

  // We use nvm3_open() instead of nvm3_initDefault() in order to be able to
  // provide the updated default init data.
  nvm3_status = nvm3_open(nvm3_defaultHandle, &init_data);

  if (nvm3_status != ECODE_NVM3_OK
      && nvm3_status != ECODE_NVM3_ERR_OPENED_WITH_OTHER_PARAMETERS) {
    mbedtls_free(sli_tz_nvm3_caches[0]);
    sli_tz_nvm3_caches[0] = NULL;
  }

  return nvm3_status;
}

Ecode_t sli_tz_nvm3_deinit_default(sli_tz_invec in_vec[],
                                   size_t in_len,
                                   sli_tz_outvec out_vec[],
                                   size_t out_len)
{
  _TZ_NVM3_ASSERT_N_IOVECS(1, 0);
  (void)in_vec;
  (void)out_vec;

  Ecode_t nvm3_status = nvm3_close(nvm3_defaultHandle);

  mbedtls_free(sli_tz_nvm3_caches[0]);
  sli_tz_nvm3_caches[0] = NULL;

  return nvm3_status;
}

//------------------------------------------------------------------------------
// NVM3-exclusive service functions

#if defined(TZ_SERVICE_NVM3_PRESENT)

Ecode_t sli_tz_nvm3_read_partial_data(sli_tz_invec in_vec[],
                                      size_t in_len,
                                      sli_tz_outvec out_vec[],
                                      size_t out_len)
{
  _TZ_NVM3_ASSERT_N_IOVECS(4, 1);

  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[1], nvm3_Handle_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[2], nvm3_ObjectKey_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[3], size_t);

  // Input arguments
  nvm3_Handle_t *h = (nvm3_Handle_t *)in_vec[1].base;
  nvm3_ObjectKey_t key = *((nvm3_ObjectKey_t *)in_vec[2].base);
  size_t ofs = *((size_t *)in_vec[3].base);

  // Output arguments
  void *value = out_vec[0].base;
  size_t len = out_vec[0].len;

  return nvm3_readPartialData(h, key, value, ofs, len);
}

Ecode_t sli_tz_nvm3_read_data(sli_tz_invec in_vec[],
                              size_t in_len,
                              sli_tz_outvec out_vec[],
                              size_t out_len)
{
  _TZ_NVM3_ASSERT_N_IOVECS(3, 1);

  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[1], nvm3_Handle_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[2], nvm3_ObjectKey_t);

  // Input arguments
  nvm3_Handle_t *h = (nvm3_Handle_t *)in_vec[1].base;
  nvm3_ObjectKey_t key = *((nvm3_ObjectKey_t *)in_vec[2].base);

  // Output arguments
  void *value = out_vec[0].base;
  size_t len = out_vec[0].len;

  return nvm3_readData(h, key, value, len);
}

Ecode_t sli_tz_nvm3_write_data(sli_tz_invec in_vec[],
                               size_t in_len,
                               sli_tz_outvec out_vec[],
                               size_t out_len)
{
  (void) out_vec;
  _TZ_NVM3_ASSERT_N_IOVECS(4, 0);

  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[1], nvm3_Handle_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[2], nvm3_ObjectKey_t);

  // Input arguments
  nvm3_Handle_t *h = (nvm3_Handle_t *)in_vec[1].base;
  nvm3_ObjectKey_t key = *((nvm3_ObjectKey_t *)in_vec[2].base);
  const void *value = in_vec[3].base;
  size_t len = in_vec[3].len;

  return nvm3_writeData(h, key, value, len);
}

Ecode_t sli_tz_nvm3_delete_object(sli_tz_invec in_vec[],
                                  size_t in_len,
                                  sli_tz_outvec out_vec[],
                                  size_t out_len)
{
  (void) out_vec;
  _TZ_NVM3_ASSERT_N_IOVECS(3, 0);

  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[1], nvm3_Handle_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[2], nvm3_ObjectKey_t);

  // Input arguments
  nvm3_Handle_t *h = (nvm3_Handle_t *)in_vec[1].base;
  nvm3_ObjectKey_t key = *((nvm3_ObjectKey_t *)in_vec[2].base);

  return nvm3_deleteObject(h, key);
}

Ecode_t sli_tz_nvm3_open(sli_tz_invec in_vec[],
                         size_t in_len,
                         sli_tz_outvec out_vec[],
                         size_t out_len)
{
  _TZ_NVM3_ASSERT_N_IOVECS(2, 1);

  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[1], nvm3_Init_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(out_vec[0], nvm3_Handle_t);

  // Input arguments
  // Copy the provided init data into a new struct, such that the original
  // remains untouched (which is expected since it's a const parameter).
  nvm3_Init_t init_data = *((nvm3_Init_t *)in_vec[1].base);

  // Output arguments
  nvm3_Handle_t *handle = (nvm3_Handle_t *)out_vec[0].base;

  if (init_data.halHandle != NULL
      || init_data.cachePtr != NULL) {
    // The flash handle- and cache pointers must explicitly be set to NULL by NS
    // to make it clear that it allow the secure application to manage these
    // aspects of NVM3. We don't want to make the NS side believe it can provide
    // its own pointers for these parameters.
    return ECODE_NVM3_ERR_NOT_OPENED;
  }

  // Overwrite NULL pointer with actual flash handle defined in nvm3_hal_flash.c.
  extern const nvm3_HalHandle_t nvm3_halFlashHandle;
  init_data.halHandle = &nvm3_halFlashHandle;

  // Install a pointer to the cache (either a newly allocated one, or the
  // existing one if we're reopening the instance).
  nvm3_CacheEntry_t **cache = NULL;
  if (handle->hasBeenOpened) {
    for (size_t i = SLI_TZ_SERVICE_NVM3_NON_DEFAULT_INSTANCE_CACHE_START_INDEX;
         i < SLI_TZ_SERVICE_NVM3_MAX_INSTANCES;
         ++i) {
      if (sli_tz_nvm3_caches[i] == handle->cache.entryPtr) {
        init_data.cachePtr = sli_tz_nvm3_caches[i];
        cache = &sli_tz_nvm3_caches[i];
        break;
      }
    }
  } else {
    for (size_t i = SLI_TZ_SERVICE_NVM3_NON_DEFAULT_INSTANCE_CACHE_START_INDEX;
         i < SLI_TZ_SERVICE_NVM3_MAX_INSTANCES;
         ++i) {
      if (sli_tz_nvm3_caches[i] == NULL) {
        init_data.cachePtr =
          (nvm3_CacheEntry_t *)mbedtls_calloc(init_data.cacheEntryCount,
                                              sizeof(nvm3_CacheEntry_t));
        if (init_data.cachePtr == NULL) {
          return ECODE_NVM3_ERR_NOT_OPENED;
        }
        sli_tz_nvm3_caches[i] = init_data.cachePtr;
        cache = &sli_tz_nvm3_caches[i];
        break;
      }
    }
  }
  if (init_data.cachePtr == NULL) {
    return ECODE_NVM3_ERR_NOT_OPENED;
  }

  Ecode_t nvm3_status = nvm3_open(handle, &init_data);

  if (nvm3_status != ECODE_NVM3_OK
      && nvm3_status != ECODE_NVM3_ERR_OPENED_WITH_OTHER_PARAMETERS) {
    mbedtls_free(*cache);
    *cache = NULL;
  }

  return nvm3_status;
}

Ecode_t sli_tz_nvm3_close(sli_tz_invec in_vec[],
                          size_t in_len,
                          sli_tz_outvec out_vec[],
                          size_t out_len)
{
  (void)out_vec;
  _TZ_NVM3_ASSERT_N_IOVECS(2, 0);

  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[1], nvm3_Handle_t);

  // Input arguments
  nvm3_Handle_t *h = (nvm3_Handle_t *)in_vec[1].base;

  nvm3_CacheEntry_t **cache = NULL;
  for (size_t i = SLI_TZ_SERVICE_NVM3_NON_DEFAULT_INSTANCE_CACHE_START_INDEX;
       i < SLI_TZ_SERVICE_NVM3_MAX_INSTANCES;
       ++i) {
    if (sli_tz_nvm3_caches[i] == h->cache.entryPtr) {
      cache = &sli_tz_nvm3_caches[i];
      break;
    }
  }

  Ecode_t nvm3_status = nvm3_close(h);

  mbedtls_free(*cache);
  *cache = NULL;

  return nvm3_status;
}

Ecode_t sli_tz_nvm3_get_object_info(sli_tz_invec in_vec[],
                                    size_t in_len,
                                    sli_tz_outvec out_vec[],
                                    size_t out_len)
{
  _TZ_NVM3_ASSERT_N_IOVECS(3, 2);

  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[1], nvm3_Handle_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[2], nvm3_ObjectKey_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(out_vec[0], uint32_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(out_vec[1], size_t);

  // Input arguments
  nvm3_Handle_t *h = (nvm3_Handle_t *)in_vec[1].base;
  nvm3_ObjectKey_t key = *((nvm3_ObjectKey_t *)in_vec[2].base);

  // Output arguments
  uint32_t *type = (uint32_t *)out_vec[0].base;
  size_t *len = (size_t *)out_vec[1].base;

  return nvm3_getObjectInfo(h, key, type, len);
}

Ecode_t sli_tz_nvm3_write_counter(sli_tz_invec in_vec[],
                                  size_t in_len,
                                  sli_tz_outvec out_vec[],
                                  size_t out_len)
{
  (void)out_vec;
  _TZ_NVM3_ASSERT_N_IOVECS(4, 0);

  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[1], nvm3_Handle_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[2], nvm3_ObjectKey_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[3], uint32_t);

  // Input arguments
  nvm3_Handle_t *h = (nvm3_Handle_t *)in_vec[1].base;
  nvm3_ObjectKey_t key = *((nvm3_ObjectKey_t *)in_vec[2].base);
  uint32_t value = *((uint32_t *)in_vec[3].base);

  return nvm3_writeCounter(h, key, value);
}

Ecode_t sli_tz_nvm3_read_counter(sli_tz_invec in_vec[],
                                 size_t in_len,
                                 sli_tz_outvec out_vec[],
                                 size_t out_len)
{
  _TZ_NVM3_ASSERT_N_IOVECS(3, 1);

  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[1], nvm3_Handle_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[2], nvm3_ObjectKey_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(out_vec[0], uint32_t);

  // Input arguments
  nvm3_Handle_t *h = (nvm3_Handle_t *)in_vec[1].base;
  nvm3_ObjectKey_t key = *((nvm3_ObjectKey_t *)in_vec[2].base);

  // Output arguments
  uint32_t *value = (uint32_t *)out_vec[0].base;

  return nvm3_readCounter(h, key, value);
}

Ecode_t sli_tz_nvm3_increment_counter(sli_tz_invec in_vec[],
                                      size_t in_len,
                                      sli_tz_outvec out_vec[],
                                      size_t out_len)
{
  _TZ_NVM3_ASSERT_N_IOVECS(3, 1);

  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[1], nvm3_Handle_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[2], nvm3_ObjectKey_t);

  // The size of this parameter is allowed to be 0 if the pointer is null.
  if (out_vec[0].base == NULL) {
    EFM_ASSERT(out_vec[0].len == 0);
  } else {
    EFM_ASSERT(out_vec[0].len == sizeof(uint32_t));
  }

  // Input arguments
  nvm3_Handle_t *h = (nvm3_Handle_t *)in_vec[1].base;
  nvm3_ObjectKey_t key = *((nvm3_ObjectKey_t *)in_vec[2].base);

  // Output arguments
  uint32_t *new_value = (uint32_t *)out_vec[0].base;

  return nvm3_incrementCounter(h, key, new_value);
}

Ecode_t sli_tz_nvm3_erase_all(sli_tz_invec in_vec[],
                              size_t in_len,
                              sli_tz_outvec out_vec[],
                              size_t out_len)
{
  (void)out_vec;
  _TZ_NVM3_ASSERT_N_IOVECS(2, 0);

  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[1], nvm3_Handle_t);

  // Input arguments
  nvm3_Handle_t *h = (nvm3_Handle_t *)in_vec[1].base;

  return nvm3_eraseAll(h);
}

Ecode_t sli_tz_nvm3_get_erase_count(sli_tz_invec in_vec[],
                                    size_t in_len,
                                    sli_tz_outvec out_vec[],
                                    size_t out_len)
{
  _TZ_NVM3_ASSERT_N_IOVECS(2, 1);

  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[1], nvm3_Handle_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(out_vec[0], uint32_t);

  // Input arguments
  nvm3_Handle_t *h = (nvm3_Handle_t *)in_vec[1].base;

  // Output arguments
  uint32_t *erase_cnt = (uint32_t *)out_vec[0].base;

  return nvm3_getEraseCount(h, erase_cnt);
}

Ecode_t sli_tz_nvm3_set_erase_count(sli_tz_invec in_vec[],
                                    size_t in_len,
                                    sli_tz_outvec out_vec[],
                                    size_t out_len)
{
  (void)out_vec;
  _TZ_NVM3_ASSERT_N_IOVECS(2, 0);

  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[1], uint32_t);

  // Input arguments
  uint32_t erase_cnt = *((uint32_t *)in_vec[1].base);

  nvm3_setEraseCount(erase_cnt);

  return ECODE_NVM3_OK;
}

Ecode_t sli_tz_nvm3_repack(sli_tz_invec in_vec[],
                           size_t in_len,
                           sli_tz_outvec out_vec[],
                           size_t out_len)
{
  (void) out_vec;
  _TZ_NVM3_ASSERT_N_IOVECS(2, 0);

  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[1], nvm3_Handle_t);

  // Input arguments
  nvm3_Handle_t *h = (nvm3_Handle_t *)in_vec[1].base;

  return nvm3_repack(h);
}

Ecode_t sli_tz_nvm3_repack_needed(sli_tz_invec in_vec[],
                                  size_t in_len,
                                  sli_tz_outvec out_vec[],
                                  size_t out_len)
{
  _TZ_NVM3_ASSERT_N_IOVECS(2, 1);

  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[1], nvm3_Handle_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(out_vec[0], bool);

  // Input arguments
  nvm3_Handle_t *h = (nvm3_Handle_t *)in_vec[1].base;

  // Output arguments
  bool *ret_val = out_vec[0].base;

  *ret_val = nvm3_repackNeeded(h);

  return ECODE_NVM3_OK;
}

Ecode_t sli_tz_nvm3_resize(sli_tz_invec in_vec[],
                           size_t in_len,
                           sli_tz_outvec out_vec[],
                           size_t out_len)
{
  (void) out_vec;
  _TZ_NVM3_ASSERT_N_IOVECS(4, 0);

  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[1], nvm3_Handle_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[2], nvm3_HalPtr_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[3], size_t);

  // Input arguments
  nvm3_Handle_t *h = (nvm3_Handle_t *)in_vec[1].base;
  nvm3_HalPtr_t new_addr = *((nvm3_HalPtr_t *)in_vec[2].base);
  size_t new_size = *((size_t *)in_vec[3].base);

  return nvm3_resize(h, new_addr, new_size);
}

Ecode_t sli_tz_nvm3_enum_objects(sli_tz_invec in_vec[],
                                 size_t in_len,
                                 sli_tz_outvec out_vec[],
                                 size_t out_len)
{
  _TZ_NVM3_ASSERT_N_IOVECS(5, 2);

  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[1], nvm3_Handle_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[2], size_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[3], nvm3_ObjectKey_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[4], nvm3_ObjectKey_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(out_vec[0], size_t);

  // The size of this parameter is allowed to be 0 if the pointer is null.
  if (out_vec[1].base == NULL) {
    EFM_ASSERT(out_vec[1].len == 0);
  } else {
    EFM_ASSERT(out_vec[1].len == sizeof(nvm3_ObjectKey_t));
  }

  // Input arguments
  nvm3_Handle_t *h = (nvm3_Handle_t *)in_vec[1].base;
  size_t key_list_size = *((size_t *)in_vec[2].base);
  nvm3_ObjectKey_t key_min = *((nvm3_ObjectKey_t *)in_vec[3].base);
  nvm3_ObjectKey_t key_max = *((nvm3_ObjectKey_t *)in_vec[4].base);

  // Output arguments
  size_t *ret_val = out_vec[0].base;
  nvm3_ObjectKey_t *key_list_ptr = (nvm3_ObjectKey_t *)out_vec[1].base;

  *ret_val = nvm3_enumObjects(h, key_list_ptr, key_list_size, key_min, key_max);

  return ECODE_NVM3_OK;
}

Ecode_t sli_tz_nvm3_enum_deleted_objects(sli_tz_invec in_vec[],
                                         size_t in_len,
                                         sli_tz_outvec out_vec[],
                                         size_t out_len)
{
  _TZ_NVM3_ASSERT_N_IOVECS(5, 2);

  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[1], nvm3_Handle_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[2], size_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[3], nvm3_ObjectKey_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(in_vec[4], nvm3_ObjectKey_t);
  _TZ_NVM3_ASSERT_IOVEC_STRUCT_SIZE(out_vec[0], size_t);

  // The size of this parameter is allowed to be 0 if the pointer is null.
  if (out_vec[1].base == NULL) {
    EFM_ASSERT(out_vec[1].len == 0);
  } else {
    EFM_ASSERT(out_vec[1].len == sizeof(nvm3_ObjectKey_t));
  }

  // Input arguments
  nvm3_Handle_t *h = (nvm3_Handle_t *)in_vec[1].base;
  size_t key_list_size = *((size_t *)in_vec[2].base);
  nvm3_ObjectKey_t key_min = *((nvm3_ObjectKey_t *)in_vec[3].base);
  nvm3_ObjectKey_t key_max = *((nvm3_ObjectKey_t *)in_vec[4].base);

  // Output arguments
  size_t *ret_val = out_vec[0].base;
  nvm3_ObjectKey_t *key_list_ptr = (nvm3_ObjectKey_t *)out_vec[1].base;

  *ret_val = nvm3_enumDeletedObjects(h, key_list_ptr, key_list_size, key_min, key_max);

  return ECODE_NVM3_OK;
}

#endif // TZ_SERVICE_NVM3_PRESENT
