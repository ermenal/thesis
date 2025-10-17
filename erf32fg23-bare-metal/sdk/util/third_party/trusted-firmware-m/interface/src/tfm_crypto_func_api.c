/*
 * Copyright (c) 2018-2021, Arm Limited. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 */

#if defined(TFM_CONFIG_SL_SECURE_LIBRARY)

#include "tfm_crypto_defs.h"
#include "tfm_ns_interface.h"

#include "sli_tz_s_interface.h"

#define API_DISPATCH(sfn_name, sfn_id)                                              \
        tfm_ns_interface_dispatch((veneer_fn)sli_tz_s_interface_dispatch_crypto,    \
        (uint32_t)in_vec, IOVEC_LEN(in_vec),                                        \
        (uint32_t)out_vec, IOVEC_LEN(out_vec))

#define API_DISPATCH_NO_OUTVEC(sfn_name, sfn_id)                                    \
        tfm_ns_interface_dispatch((veneer_fn)sli_tz_s_interface_dispatch_crypto,    \
        (uint32_t)in_vec, IOVEC_LEN(in_vec),                                        \
        (uint32_t)NULL, 0)

#else

#include "psa/client.h"
#include "tfm_veneers.h"
#include "tfm_crypto_defs.h"
#include "psa/crypto.h"
#include "tfm_ns_interface.h"

#define API_DISPATCH(sfn_name, sfn_id)                               \
        tfm_ns_interface_dispatch((veneer_fn)sfn_name##_veneer,      \
        (uint32_t)in_vec, IOVEC_LEN(in_vec),                         \
        (uint32_t)out_vec, IOVEC_LEN(out_vec))

#define API_DISPATCH_NO_OUTVEC(sfn_name, sfn_id)                     \
        tfm_ns_interface_dispatch((veneer_fn)sfn_name##_veneer,      \
        (uint32_t)in_vec, IOVEC_LEN(in_vec),                         \
        (uint32_t)NULL, 0)

#endif

#if !defined(MBEDTLS_ERR_ENTROPY_SOURCE_FAILED)
/* Repeat declaration of MBEDTLS_ERR_ENTROPY_SOURCE_FAILED since the full entropy.h
 * header is not always a clean include. I.e. when mbedtls_hardware_poll is used
 * without having the full entropy module (with collector) present, the header will
 * potentially complain about missing a SHA256/SHA512 context structure definition. */
#define MBEDTLS_ERR_ENTROPY_SOURCE_FAILED -0x003C
#endif

psa_status_t psa_crypto_init(void)
{
    /* Service init is performed during TFM boot up,
     * so application level initialisation is empty
     */
    return PSA_SUCCESS;
}

void mbedtls_psa_crypto_free( void )
{
    /* The TFM does not support deinitialization
     * so application level deinitialisation is empty.
     */
}

#if defined (MBEDTLS_PSA_CRYPTO_EXTERNAL_RNG) && defined(SL_TRUSTZONE_NONSECURE)
/* Wrapper function allowing the classic API to use the PSA RNG.
 *
 * `mbedtls_psa_get_random(MBEDTLS_PSA_RANDOM_STATE, ...)` calls
 * `psa_generate_random(...)`. The state parameter is ignored since the
 * PSA API doesn't support passing an explicit state.
 *
 * In the non-external case, psa_generate_random() calls an
 * `mbedtls_xxx_drbg_random` function which has exactly the same signature
 * and semantics as mbedtls_psa_get_random(). As an optimization,
 * instead of doing this back-and-forth between the PSA API and the
 * classic API, psa_crypto_random_impl.h defines `mbedtls_psa_get_random`
 * as a constant function pointer to `mbedtls_xxx_drbg_random`.
 */
int mbedtls_psa_get_random(void *p_rng,
                           unsigned char *output,
                           size_t output_size)
{
  /* This function takes a pointer to the RNG state because that's what
   * classic mbedtls functions using an RNG expect. The PSA RNG manages
   * its own state internally and doesn't let the caller access that state.
   * So we just ignore the state parameter, and in practice we'll pass
   * NULL. */
  (void) p_rng;
  psa_status_t status = psa_generate_random(output, output_size);
  if ( status == PSA_SUCCESS ) {
    return(0);
  } else {
    return(MBEDTLS_ERR_ENTROPY_SOURCE_FAILED);
  }
}
#endif // defined (MBEDTLS_PSA_CRYPTO_EXTERNAL_RNG) && defined(SL_TRUSTZONE_NONSECURE)

psa_status_t psa_open_key(psa_key_id_t id,
                          psa_key_id_t *key)
{
#if defined(TFM_CRYPTO_KEY_MODULE_DISABLED)
    (void)id;
    (void)key;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    const struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_OPEN_KEY_SID,
    };
    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = &id, .len = sizeof(psa_key_id_t)},
    };
    psa_outvec out_vec[] = {
        {.base = key, .len = sizeof(psa_key_id_t)},
    };

    return API_DISPATCH(tfm_crypto_open_key,
                        TFM_CRYPTO_OPEN_KEY);
#endif
}

psa_status_t psa_close_key(psa_key_id_t key)
{
#if defined(TFM_CRYPTO_KEY_MODULE_DISABLED)
    (void)key;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    const struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_CLOSE_KEY_SID,
        .key_id = key,
    };
    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };

    return API_DISPATCH_NO_OUTVEC(tfm_crypto_close_key,
                                  TFM_CRYPTO_CLOSE_KEY);
#endif
}

psa_status_t psa_import_key(const psa_key_attributes_t *attributes,
                            const uint8_t *data,
                            size_t data_length,
                            psa_key_id_t *key)
{
#if defined(TFM_CRYPTO_KEY_MODULE_DISABLED)
    (void)attributes;
    (void)data;
    (void)data_length;
    (void)key;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_IMPORT_KEY_SID,
    };
    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = attributes, .len = sizeof(psa_key_attributes_t)},
        {.base = data, .len = data_length}
    };
    psa_outvec out_vec[] = {
        {.base = key, .len = sizeof(psa_key_id_t)}
    };

    status = API_DISPATCH(tfm_crypto_import_key,
                          TFM_CRYPTO_IMPORT_KEY);

    return status;
#endif
}

psa_status_t psa_destroy_key(psa_key_id_t key)
{
#if defined(TFM_CRYPTO_KEY_MODULE_DISABLED)
    (void)key;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_DESTROY_KEY_SID,
        .key_id = key,
    };
    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };

    status = API_DISPATCH_NO_OUTVEC(tfm_crypto_destroy_key,
                                    TFM_CRYPTO_DESTROY_KEY);

    return status;
#endif
}

psa_status_t psa_get_key_attributes(psa_key_id_t key,
                                    psa_key_attributes_t *attributes)
{
#if defined(TFM_CRYPTO_KEY_MODULE_DISABLED)
    (void)key;
    (void)attributes;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_GET_KEY_ATTRIBUTES_SID,
        .key_id = key,
    };
    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = attributes, .len = sizeof(psa_key_attributes_t)},
    };

    status = API_DISPATCH(tfm_crypto_get_key_attributes,
                          TFM_CRYPTO_GET_KEY_ATTRIBUTES);
    return status;
#endif
}

void psa_reset_key_attributes(psa_key_attributes_t *attributes)
{
#if defined(TFM_CRYPTO_KEY_MODULE_DISABLED)
    (void)attributes;

    return;
#else
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_RESET_KEY_ATTRIBUTES_SID,
    };
    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = attributes, .len = sizeof(psa_key_attributes_t)},
    };

    (void)API_DISPATCH(tfm_crypto_reset_key_attributes,
                          TFM_CRYPTO_RESET_KEY_ATTRIBUTES);
    return;
#endif
}

psa_status_t psa_export_key(psa_key_id_t key,
                            uint8_t *data,
                            size_t data_size,
                            size_t *data_length)
{
#if defined(TFM_CRYPTO_KEY_MODULE_DISABLED)
    (void)key;
    (void)data;
    (void)data_size;
    (void)data_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_EXPORT_KEY_SID,
        .key_id = key,
    };
    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = data, .len = data_size}
    };

    status = API_DISPATCH(tfm_crypto_export_key,
                          TFM_CRYPTO_EXPORT_KEY);

    *data_length = out_vec[0].len;

    return status;
#endif
}

psa_status_t psa_export_public_key(psa_key_id_t key,
                                   uint8_t *data,
                                   size_t data_size,
                                   size_t *data_length)
{
#if defined(TFM_CRYPTO_KEY_MODULE_DISABLED)
    (void)key;
    (void)data;
    (void)data_size;
    (void)data_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_EXPORT_PUBLIC_KEY_SID,
        .key_id = key,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = data, .len = data_size}
    };

    status = API_DISPATCH(tfm_crypto_export_public_key,
                          TFM_CRYPTO_EXPORT_PUBLIC_KEY);

    *data_length = out_vec[0].len;

    return status;
#endif
}

psa_status_t psa_purge_key(psa_key_id_t key)
{
#if defined(TFM_CRYPTO_KEY_MODULE_DISABLED)
    (void)key;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_PURGE_KEY_SID,
        .key_id = key,
    };
    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };

    status = API_DISPATCH_NO_OUTVEC(tfm_crypto_purge_key,
                                    TFM_CRYPTO_PURGE_KEY);
    return status;
#endif
}

psa_status_t psa_copy_key(psa_key_id_t source_key,
                          const psa_key_attributes_t *attributes,
                          psa_key_id_t *target_key)
{
#if defined(TFM_CRYPTO_KEY_MODULE_DISABLED)
    (void)source_key;
    (void)attributes;
    (void)target_key;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_COPY_KEY_SID,
        .key_id = source_key,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = attributes, .len = sizeof(psa_key_attributes_t)},
    };

    psa_outvec out_vec[] = {
        {.base = target_key, .len = sizeof(psa_key_id_t)},
    };

    status = API_DISPATCH(tfm_crypto_copy_key,
                          TFM_CRYPTO_COPY_KEY);

    return status;
#endif
}

psa_status_t psa_cipher_generate_iv(psa_cipher_operation_t *operation,
                                    unsigned char *iv,
                                    size_t iv_size,
                                    size_t *iv_length)
{
#if defined(TFM_CRYPTO_CIPHER_MODULE_DISABLED)
    (void)operation;
    (void)iv;
    (void)iv_size;
    (void)iv_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_CIPHER_GENERATE_IV_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
        {.base = iv, .len = iv_size},
    };

    status = API_DISPATCH(tfm_crypto_cipher_generate_iv,
                          TFM_CRYPTO_CIPHER_GENERATE_IV);

    *iv_length = out_vec[1].len;

    return status;
#endif
}

psa_status_t psa_cipher_set_iv(psa_cipher_operation_t *operation,
                               const unsigned char *iv,
                               size_t iv_length)
{
#if defined(TFM_CRYPTO_CIPHER_MODULE_DISABLED)
    (void)operation;
    (void)iv;
    (void)iv_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_CIPHER_SET_IV_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = iv, .len = iv_length},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_cipher_set_iv,
                          TFM_CRYPTO_CIPHER_SET_IV);

    return status;
#endif
}

psa_status_t psa_cipher_encrypt_setup(psa_cipher_operation_t *operation,
                                      psa_key_id_t key,
                                      psa_algorithm_t alg)
{
#if defined(TFM_CRYPTO_CIPHER_MODULE_DISABLED)
    (void)operation;
    (void)key;
    (void)alg;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_CIPHER_ENCRYPT_SETUP_SID,
        .key_id = key,
        .alg = alg,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_cipher_encrypt_setup,
                          TFM_CRYPTO_CIPHER_ENCRYPT_SETUP);

    return status;
#endif
}

psa_status_t psa_cipher_decrypt_setup(psa_cipher_operation_t *operation,
                                      psa_key_id_t key,
                                      psa_algorithm_t alg)
{
#if defined(TFM_CRYPTO_CIPHER_MODULE_DISABLED)
    (void)operation;
    (void)key;
    (void)alg;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_CIPHER_DECRYPT_SETUP_SID,
        .key_id = key,
        .alg = alg,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_cipher_decrypt_setup,
                          TFM_CRYPTO_CIPHER_DECRYPT_SETUP);

    return status;
#endif
}

psa_status_t psa_cipher_update(psa_cipher_operation_t *operation,
                               const uint8_t *input,
                               size_t input_length,
                               unsigned char *output,
                               size_t output_size,
                               size_t *output_length)
{
#if defined(TFM_CRYPTO_CIPHER_MODULE_DISABLED)
    (void)operation;
    (void)input;
    (void)input_length;
    (void)output;
    (void)output_size;
    (void)output_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_CIPHER_UPDATE_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = input, .len = input_length},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
        {.base = output, .len = output_size}
    };

    status = API_DISPATCH(tfm_crypto_cipher_update,
                          TFM_CRYPTO_CIPHER_UPDATE);

    *output_length = out_vec[1].len;

    return status;
#endif
}

psa_status_t psa_cipher_abort(psa_cipher_operation_t *operation)
{
#if defined(TFM_CRYPTO_CIPHER_MODULE_DISABLED)
    (void)operation;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_CIPHER_ABORT_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_cipher_abort,
                          TFM_CRYPTO_CIPHER_ABORT);

    return status;
#endif
}

psa_status_t psa_cipher_finish(psa_cipher_operation_t *operation,
                               uint8_t *output,
                               size_t output_size,
                               size_t *output_length)
{
#if defined(TFM_CRYPTO_CIPHER_MODULE_DISABLED)
    (void)operation;
    (void)output;
    (void)output_size;
    (void)output_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
   psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_CIPHER_FINISH_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
        {.base = output, .len = output_size},
    };

    status = API_DISPATCH(tfm_crypto_cipher_finish,
                          TFM_CRYPTO_CIPHER_FINISH);

    *output_length = out_vec[1].len;

    return status;
#endif
}

psa_status_t psa_hash_setup(psa_hash_operation_t *operation,
                            psa_algorithm_t alg)
{
#if defined(TFM_CRYPTO_HASH_MODULE_DISABLED)
    (void)operation;
    (void)alg;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_HASH_SETUP_SID,
        .alg = alg,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_hash_setup,
                          TFM_CRYPTO_HASH_SETUP);

    return status;
#endif
}

psa_status_t psa_hash_update(psa_hash_operation_t *operation,
                             const uint8_t *input,
                             size_t input_length)
{
#if defined(TFM_CRYPTO_HASH_MODULE_DISABLED)
    (void)operation;
    (void)input;
    (void)input_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_HASH_UPDATE_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = input, .len = input_length},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_hash_update,
                          TFM_CRYPTO_HASH_UPDATE);

    return status;
#endif
}

psa_status_t psa_hash_finish(psa_hash_operation_t *operation,
                             uint8_t *hash,
                             size_t hash_size,
                             size_t *hash_length)
{
#if defined(TFM_CRYPTO_HASH_MODULE_DISABLED)
    (void)operation;
    (void)hash;
    (void)hash_size;
    (void)hash_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_HASH_FINISH_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
        {.base = hash, .len = hash_size},
    };

    status = API_DISPATCH(tfm_crypto_hash_finish,
                          TFM_CRYPTO_HASH_FINISH);

    *hash_length = out_vec[1].len;

    return status;
#endif
}

psa_status_t psa_hash_verify(psa_hash_operation_t *operation,
                             const uint8_t *hash,
                             size_t hash_length)
{
#if defined(TFM_CRYPTO_HASH_MODULE_DISABLED)
    (void)operation;
    (void)hash;
    (void)hash_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_HASH_VERIFY_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = hash, .len = hash_length},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_hash_verify,
                          TFM_CRYPTO_HASH_VERIFY);

    return status;
#endif
}

psa_status_t psa_hash_abort(psa_hash_operation_t *operation)
{
#if defined(TFM_CRYPTO_HASH_MODULE_DISABLED)
    (void)operation;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_HASH_ABORT_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_hash_abort,
                          TFM_CRYPTO_HASH_ABORT);

    return status;
#endif
}

psa_status_t psa_hash_clone(const psa_hash_operation_t *source_operation,
                            psa_hash_operation_t *target_operation)
{
#if defined(TFM_CRYPTO_HASH_MODULE_DISABLED)
    (void)source_operation;
    (void)target_operation;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_HASH_CLONE_SID,
        .op_handle = source_operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = target_operation, .len = sizeof(psa_hash_operation_t)},
    };

    if (target_operation && (target_operation->handle != 0)) {
        return PSA_ERROR_BAD_STATE;
    }

    status = API_DISPATCH(tfm_crypto_hash_clone,
                          TFM_CRYPTO_HASH_CLONE);

    return status;
#endif
}

psa_status_t psa_hash_compute(psa_algorithm_t alg,
                              const uint8_t *input,
                              size_t input_length,
                              uint8_t *hash,
                              size_t hash_size,
                              size_t *hash_length)
{
#if defined(TFM_CRYPTO_HASH_MODULE_DISABLED)
    (void)alg;
    (void)input;
    (void)input_length;
    (void)hash;
    (void)hash_size;
    (void)hash_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_HASH_COMPUTE_SID,
        .alg = alg,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = input, .len = input_length},
    };

    psa_outvec out_vec[] = {
        {.base = hash, .len = hash_size}
    };

    status = API_DISPATCH(tfm_crypto_hash_compute,
                          TFM_CRYPTO_HASH_COMPUTE);

    *hash_length = out_vec[0].len;

    return status;
#endif
}

psa_status_t psa_hash_compare(psa_algorithm_t alg,
                              const uint8_t *input,
                              size_t input_length,
                              const uint8_t *hash,
                              size_t hash_length)
{
#if defined(TFM_CRYPTO_HASH_MODULE_DISABLED)
    (void)alg;
    (void)input;
    (void)input_length;
    (void)hash;
    (void)hash_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_HASH_COMPARE_SID,
        .alg = alg,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = input, .len = input_length},
        {.base = hash, .len = hash_length},
    };

    status = API_DISPATCH_NO_OUTVEC(tfm_crypto_hash_compare,
                          TFM_CRYPTO_HASH_COMPARE);

    return status;
#endif
}

psa_status_t psa_mac_sign_setup(psa_mac_operation_t *operation,
                                psa_key_id_t key,
                                psa_algorithm_t alg)
{
#if defined(TFM_CRYPTO_MAC_MODULE_DISABLED)
    (void)operation;
    (void)key;
    (void)alg;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_MAC_SIGN_SETUP_SID,
        .key_id = key,
        .alg = alg,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_mac_sign_setup,
                          TFM_CRYPTO_MAC_SIGN_SETUP);

    return status;
#endif
}

psa_status_t psa_mac_verify_setup(psa_mac_operation_t *operation,
                                  psa_key_id_t key,
                                  psa_algorithm_t alg)
{
#if defined(TFM_CRYPTO_MAC_MODULE_DISABLED)
    (void)operation;
    (void)key;
    (void)alg;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_MAC_VERIFY_SETUP_SID,
        .key_id = key,
        .alg = alg,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_mac_verify_setup,
                          TFM_CRYPTO_MAC_VERIFY_SETUP);

    return status;
#endif
}

psa_status_t psa_mac_update(psa_mac_operation_t *operation,
                            const uint8_t *input,
                            size_t input_length)
{
#if defined(TFM_CRYPTO_MAC_MODULE_DISABLED)
    (void)operation;
    (void)input;
    (void)input_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_MAC_UPDATE_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = input, .len = input_length},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_mac_update,
                          TFM_CRYPTO_MAC_UPDATE);

    return status;
#endif
}

psa_status_t psa_mac_sign_finish(psa_mac_operation_t *operation,
                                 uint8_t *mac,
                                 size_t mac_size,
                                 size_t *mac_length)
{
#if defined(TFM_CRYPTO_MAC_MODULE_DISABLED)
    (void)operation;
    (void)mac;
    (void)mac_size;
    (void)mac_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_MAC_SIGN_FINISH_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
        {.base = mac, .len = mac_size},
    };

    status = API_DISPATCH(tfm_crypto_mac_sign_finish,
                          TFM_CRYPTO_MAC_SIGN_FINISH);

    *mac_length = out_vec[1].len;

    return status;
#endif
}

psa_status_t psa_mac_verify_finish(psa_mac_operation_t *operation,
                                   const uint8_t *mac,
                                   size_t mac_length)
{
#if defined(TFM_CRYPTO_MAC_MODULE_DISABLED)
    (void)operation;
    (void)mac;
    (void)mac_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_MAC_VERIFY_FINISH_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = mac, .len = mac_length},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_mac_verify_finish,
                          TFM_CRYPTO_MAC_VERIFY_FINISH);

    return status;
#endif
}

psa_status_t psa_mac_abort(psa_mac_operation_t *operation)
{
#if defined(TFM_CRYPTO_MAC_MODULE_DISABLED)
    (void)operation;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_MAC_ABORT_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_mac_abort,
                          TFM_CRYPTO_MAC_ABORT);

    return status;
#endif
}

psa_status_t psa_aead_encrypt(psa_key_id_t key,
                              psa_algorithm_t alg,
                              const uint8_t *nonce,
                              size_t nonce_length,
                              const uint8_t *additional_data,
                              size_t additional_data_length,
                              const uint8_t *plaintext,
                              size_t plaintext_length,
                              uint8_t *ciphertext,
                              size_t ciphertext_size,
                              size_t *ciphertext_length)
{
#if defined(TFM_CRYPTO_AEAD_MODULE_DISABLED)
    (void)key;
    (void)alg;
    (void)nonce;
    (void)nonce_length;
    (void)additional_data;
    (void)additional_data_length;
    (void)plaintext;
    (void)plaintext_length;
    (void)ciphertext;
    (void)ciphertext_size;
    (void)ciphertext_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_AEAD_ENCRYPT_SID,
        .key_id = key,
        .alg = alg,
        .aead_in = {.nonce = {0}, .nonce_length = nonce_length}
    };

    /* Sanitize the optional input */
    if ((additional_data == NULL) && (additional_data_length != 0)) {
        return PSA_ERROR_INVALID_ARGUMENT;
    }

    size_t idx = 0;
    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = plaintext, .len = plaintext_length},
        {.base = additional_data, .len = additional_data_length},
    };
    psa_outvec out_vec[] = {
        {.base = ciphertext, .len = ciphertext_size},
    };

    if (nonce_length > TFM_CRYPTO_MAX_NONCE_LENGTH) {
        return PSA_ERROR_INVALID_ARGUMENT;
    }

    if (nonce != NULL) {
        for (idx = 0; idx < nonce_length; idx++) {
            iov.aead_in.nonce[idx] = nonce[idx];
        }
    }

    status = API_DISPATCH(tfm_crypto_aead_encrypt,
                          TFM_CRYPTO_AEAD_ENCRYPT);

    *ciphertext_length = out_vec[0].len;

    return status;
#endif
}

psa_status_t psa_aead_decrypt(psa_key_id_t key,
                              psa_algorithm_t alg,
                              const uint8_t *nonce,
                              size_t nonce_length,
                              const uint8_t *additional_data,
                              size_t additional_data_length,
                              const uint8_t *ciphertext,
                              size_t ciphertext_length,
                              uint8_t *plaintext,
                              size_t plaintext_size,
                              size_t *plaintext_length)
{
#if defined(TFM_CRYPTO_AEAD_MODULE_DISABLED)
    (void)key;
    (void)alg;
    (void)nonce;
    (void)nonce_length;
    (void)additional_data;
    (void)additional_data_length;
    (void)ciphertext;
    (void)ciphertext_length;
    (void)plaintext;
    (void)plaintext_size;
    (void)plaintext_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_AEAD_DECRYPT_SID,
        .key_id = key,
        .alg = alg,
        .aead_in = {.nonce = {0}, .nonce_length = nonce_length}
    };

    /* Sanitize the optional input */
    if ((additional_data == NULL) && (additional_data_length != 0)) {
        return PSA_ERROR_INVALID_ARGUMENT;
    }

    size_t idx = 0;
    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = ciphertext, .len = ciphertext_length},
        {.base = additional_data, .len = additional_data_length},
    };
    psa_outvec out_vec[] = {
        {.base = plaintext, .len = plaintext_size},
    };

    if (nonce_length > TFM_CRYPTO_MAX_NONCE_LENGTH) {
        return PSA_ERROR_INVALID_ARGUMENT;
    }

    if (nonce != NULL) {
        for (idx = 0; idx < nonce_length; idx++) {
            iov.aead_in.nonce[idx] = nonce[idx];
        }
    }

    status = API_DISPATCH(tfm_crypto_aead_decrypt,
                          TFM_CRYPTO_AEAD_DECRYPT);

    *plaintext_length = out_vec[0].len;

    return status;
#endif
}

psa_status_t psa_sign_message(psa_key_id_t key,
                              psa_algorithm_t alg,
                              const uint8_t *input,
                              size_t input_length,
                              uint8_t *signature,
                              size_t signature_size,
                              size_t *signature_length)
{
#if defined(TFM_CRYPTO_ASYM_SIGN_MODULE_DISABLED)
    (void)key;
    (void)alg;
    (void)input;
    (void)input_length;
    (void)signature;
    (void)signature_size;
    (void)signature_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_SIGN_MESSAGE_SID,
        .key_id = key,
        .alg = alg,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = input, .len = input_length},
    };
    psa_outvec out_vec[] = {
        {.base = signature, .len = signature_size},
    };

    status = API_DISPATCH(tfm_crypto_sign_message,
                          TFM_CRYPTO_SIGN_MESSAGE);

#if !defined(TFM_CONFIG_SL_SECURE_LIBRARY)
    if (status == PSA_SUCCESS)
#endif
    {
        *signature_length = out_vec[0].len;
    }

    return status;
#endif
}

psa_status_t psa_verify_message(psa_key_id_t key,
                                psa_algorithm_t alg,
                                const uint8_t *input,
                                size_t input_length,
                                const uint8_t *signature,
                                size_t signature_length)
{
#if defined(TFM_CRYPTO_ASYM_SIGN_MODULE_DISABLED)
    (void)key;
    (void)alg;
    (void)input;
    (void)input_length;
    (void)signature;
    (void)signature_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_VERIFY_MESSAGE_SID,
        .key_id = key,
        .alg = alg
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = input, .len = input_length},
        {.base = signature, .len = signature_length}
    };

    status = API_DISPATCH_NO_OUTVEC(tfm_crypto_verify_message,
                                    TFM_CRYPTO_VERIFY_MESSAGE);

    return status;
#endif
}

psa_status_t psa_sign_hash(psa_key_id_t key,
                           psa_algorithm_t alg,
                           const uint8_t *hash,
                           size_t hash_length,
                           uint8_t *signature,
                           size_t signature_size,
                           size_t *signature_length)
{
#if defined(TFM_CRYPTO_ASYM_SIGN_MODULE_DISABLED)
    (void)key;
    (void)alg;
    (void)hash;
    (void)hash_length;
    (void)signature;
    (void)signature_size;
    (void)signature_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_SIGN_HASH_SID,
        .key_id = key,
        .alg = alg,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = hash, .len = hash_length},
    };
    psa_outvec out_vec[] = {
        {.base = signature, .len = signature_size},
    };

    status = API_DISPATCH(tfm_crypto_sign_hash,
                          TFM_CRYPTO_SIGN_HASH);

    *signature_length = out_vec[0].len;

    return status;
#endif
}

psa_status_t psa_verify_hash(psa_key_id_t key,
                             psa_algorithm_t alg,
                             const uint8_t *hash,
                             size_t hash_length,
                             const uint8_t *signature,
                             size_t signature_length)
{
#if defined(TFM_CRYPTO_ASYM_SIGN_MODULE_DISABLED)
    (void)key;
    (void)alg;
    (void)hash;
    (void)hash_length;
    (void)signature;
    (void)signature_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_VERIFY_HASH_SID,
        .key_id = key,
        .alg = alg
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = hash, .len = hash_length},
        {.base = signature, .len = signature_length}
    };

    status = API_DISPATCH_NO_OUTVEC(tfm_crypto_verify_hash,
                                    TFM_CRYPTO_VERIFY_HASH);

    return status;
#endif
}

psa_status_t psa_asymmetric_encrypt(psa_key_id_t key,
                                    psa_algorithm_t alg,
                                    const uint8_t *input,
                                    size_t input_length,
                                    const uint8_t *salt,
                                    size_t salt_length,
                                    uint8_t *output,
                                    size_t output_size,
                                    size_t *output_length)
{
#if defined(TFM_CRYPTO_ASYM_ENCRYPT_MODULE_DISABLED)
    (void)key;
    (void)alg;
    (void)input;
    (void)input_length;
    (void)salt;
    (void)salt_length;
    (void)output;
    (void)output_size;
    (void)output_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_ASYMMETRIC_ENCRYPT_SID,
        .key_id = key,
        .alg = alg
    };

    /* Sanitize the optional input */
    if ((salt == NULL) && (salt_length != 0)) {
        return PSA_ERROR_INVALID_ARGUMENT;
    }

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = input, .len = input_length},
        {.base = salt, .len = salt_length}
    };

    psa_outvec out_vec[] = {
        {.base = output, .len = output_size},
    };

    status = API_DISPATCH(tfm_crypto_asymmetric_encrypt,
                          TFM_CRYPTO_ASYMMETRIC_ENCRYPT);

    *output_length = out_vec[0].len;

    return status;
#endif
}

psa_status_t psa_asymmetric_decrypt(psa_key_id_t key,
                                    psa_algorithm_t alg,
                                    const uint8_t *input,
                                    size_t input_length,
                                    const uint8_t *salt,
                                    size_t salt_length,
                                    uint8_t *output,
                                    size_t output_size,
                                    size_t *output_length)
{
#if defined(TFM_CRYPTO_ASYM_ENCRYPT_MODULE_DISABLED)
    (void)key;
    (void)alg;
    (void)input;
    (void)input_length;
    (void)salt;
    (void)salt_length;
    (void)output;
    (void)output_size;
    (void)output_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_ASYMMETRIC_DECRYPT_SID,
        .key_id = key,
        .alg = alg
    };

    /* Sanitize the optional input */
    if ((salt == NULL) && (salt_length != 0)) {
        return PSA_ERROR_INVALID_ARGUMENT;
    }

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = input, .len = input_length},
        {.base = salt, .len = salt_length}
    };

    psa_outvec out_vec[] = {
        {.base = output, .len = output_size},
    };

    status = API_DISPATCH(tfm_crypto_asymmetric_decrypt,
                          TFM_CRYPTO_ASYMMETRIC_DECRYPT);

    *output_length = out_vec[0].len;

    return status;
#endif
}

psa_status_t psa_key_derivation_get_capacity(
                                const psa_key_derivation_operation_t *operation,
                                size_t *capacity)
{
#if defined(TFM_CRYPTO_KEY_DERIVATION_MODULE_DISABLED)
    (void)operation;
    (void)capacity;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_KEY_DERIVATION_GET_CAPACITY_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };

    psa_outvec out_vec[] = {
        {.base = capacity, .len = sizeof(size_t)},
    };

    status = API_DISPATCH(tfm_crypto_key_derivation_get_capacity,
                          TFM_CRYPTO_KEY_DERIVATION_GET_CAPACITY);

    return status;
#endif
}

psa_status_t psa_key_derivation_output_bytes(
                                      psa_key_derivation_operation_t *operation,
                                      uint8_t *output,
                                      size_t output_length)
{
#if defined(TFM_CRYPTO_KEY_DERIVATION_MODULE_DISABLED)
    (void)operation;
    (void)output;
    (void)output_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_KEY_DERIVATION_OUTPUT_BYTES_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };

    psa_outvec out_vec[] = {
        {.base = output, .len = output_length},
    };

    status = API_DISPATCH(tfm_crypto_key_derivation_output_bytes,
                          TFM_CRYPTO_KEY_DERIVATION_OUTPUT_BYTES);

    return status;
#endif
}

psa_status_t psa_key_derivation_input_key(
                                      psa_key_derivation_operation_t *operation,
                                      psa_key_derivation_step_t step,
                                      psa_key_id_t key)
{
#if defined(TFM_CRYPTO_KEY_DERIVATION_MODULE_DISABLED)
    (void)operation;
    (void)step;
    (void)key;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_KEY_DERIVATION_INPUT_KEY_SID,
        .key_id = key,
        .step = step,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };

    status = API_DISPATCH_NO_OUTVEC(tfm_crypto_key_derivation_input_key,
                                    TFM_CRYPTO_KEY_DERIVATION_INPUT_KEY);

    return status;
#endif
}

psa_status_t psa_key_derivation_abort(psa_key_derivation_operation_t *operation)
{
#if defined(TFM_CRYPTO_KEY_DERIVATION_MODULE_DISABLED)
    (void)operation;
    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_KEY_DERIVATION_ABORT_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };

    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_key_derivation_abort,
                          TFM_CRYPTO_KEY_DERIVATION_ABORT);

    return status;
#endif
}

psa_status_t sl_psa_key_derivation_single_shot(
    psa_algorithm_t alg,
    psa_key_id_t key_in,
    const uint8_t *info,
    size_t info_length,
    const uint8_t *salt,
    size_t salt_length,
    size_t iterations,
    const psa_key_attributes_t *key_out_attributes,
    psa_key_id_t *key_out)
{
#if defined(TFM_CRYPTO_KEY_DERIVATION_MODULE_DISABLED)
    (void)alg;
    (void)key_in;
    (void)key_out;
    (void)info;
    (void)info_length;
    (void)salt;
    (void)salt_length;
    (void)iterations;
    (void)key_out_attributes;
    (void)key_out;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_SL_PSA_KEY_DERIVATION_SINGLE_SHOT_SID,
        .alg = alg,
        .key_id = key_in
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = info, .len = info_length},
        {.base = salt, .len = salt_length},
        {.base = &iterations, .len = sizeof(iterations)},
        {.base = key_out_attributes, .len = sizeof(psa_key_attributes_t)},
    };

    psa_outvec out_vec[] = {
        {.base = key_out, .len = sizeof(psa_key_id_t)},
    };

    status = API_DISPATCH(tfm_sl_psa_key_derivation_single_shot,
                          TFM_SL_PSA_KEY_DERIVATION_SINGLE_SHOT);

    return status;
#endif
}

psa_status_t psa_key_derivation_key_agreement(
                                      psa_key_derivation_operation_t *operation,
                                      psa_key_derivation_step_t step,
                                      psa_key_id_t private_key,
                                      const uint8_t *peer_key,
                                      size_t peer_key_length)
{
#if defined(TFM_CRYPTO_KEY_DERIVATION_MODULE_DISABLED)
    (void)operation;
    (void)step;
    (void)private_key;
    (void)peer_key;
    (void)peer_key_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_KEY_DERIVATION_KEY_AGREEMENT_SID,
        .key_id = private_key,
        .step = step,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = peer_key, .len = peer_key_length},
    };

    status = API_DISPATCH_NO_OUTVEC(tfm_crypto_key_derivation_key_agreement,
                                    TFM_CRYPTO_KEY_DERIVATION_KEY_AGREEMENT);

    return status;
#endif
}

psa_status_t psa_generate_random(uint8_t *output,
                                 size_t output_size)
{
#if defined(TFM_CRYPTO_RNG_MODULE_DISABLED)
    (void)output;
    (void)output_size;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_GENERATE_RANDOM_SID,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };

    psa_outvec out_vec[] = {
        {.base = output, .len = output_size},
    };

    if (output_size == 0) {
        return PSA_SUCCESS;
    }

    status = API_DISPATCH(tfm_crypto_generate_random,
                          TFM_CRYPTO_GENERATE_RANDOM);

    return status;
#endif
}

psa_status_t psa_generate_key(const psa_key_attributes_t *attributes,
                              psa_key_id_t *key)
{
#if defined(TFM_CRYPTO_RNG_MODULE_DISABLED)
    (void)attributes;
    (void)key;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_GENERATE_KEY_SID,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = attributes, .len = sizeof(psa_key_attributes_t)},
    };

    psa_outvec out_vec[] = {
        {.base = key, .len = sizeof(psa_key_id_t)},
    };

    status = API_DISPATCH(tfm_crypto_generate_key,
                          TFM_CRYPTO_GENERATE_KEY);

    return status;
#endif
}

psa_status_t psa_aead_update_ad(psa_aead_operation_t *operation,
                                const uint8_t *input,
                                size_t input_length)
{
#if defined(TFM_CRYPTO_AEAD_MODULE_DISABLED)
    (void)operation;
    (void)input;
    (void)input_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_AEAD_UPDATE_AD_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = input, .len = input_length},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_aead_update_ad,
                          TFM_CRYPTO_AEAD_UPDATE_AD);

    return status;
#endif
}

psa_status_t psa_aead_finish(psa_aead_operation_t *operation,
                             uint8_t *ciphertext,
                             size_t ciphertext_size,
                             size_t *ciphertext_length,
                             uint8_t *tag,
                             size_t tag_size,
                             size_t *tag_length)
{
#if defined(TFM_CRYPTO_AEAD_MODULE_DISABLED)
    (void)operation;
    (void)ciphertext;
    (void)ciphertext_size;
    (void)ciphertext_length;
    (void)tag;
    (void)tag_size;
    (void)tag_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_AEAD_FINISH_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
        {.base = ciphertext, .len = ciphertext_size},
        {.base = tag, .len = tag_size},
    };

    status = API_DISPATCH(tfm_crypto_aead_finish,
                          TFM_CRYPTO_AEAD_FINISH);

    *ciphertext_length = out_vec[1].len;
    *tag_length = out_vec[2].len;

    return status;
#endif
}

psa_status_t psa_aead_verify(psa_aead_operation_t *operation,
                             uint8_t *plaintext,
                             size_t plaintext_size,
                             size_t *plaintext_length,
                             const uint8_t *tag,
                             size_t tag_length)
{
#if defined(TFM_CRYPTO_AEAD_MODULE_DISABLED)
    (void)operation;
    (void)plaintext;
    (void)plaintext_size;
    (void)plaintext_length;
    (void)tag;
    (void)tag_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_AEAD_VERIFY_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = tag, .len = tag_length},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
        {.base = plaintext, .len = plaintext_size},
    };

    status = API_DISPATCH(tfm_crypto_aead_verify,
                          TFM_CRYPTO_AEAD_VERIFY);

    *plaintext_length = out_vec[1].len;

    return status;
#endif
}

psa_status_t psa_aead_abort(psa_aead_operation_t *operation)
{
#if defined(TFM_CRYPTO_AEAD_MODULE_DISABLED)
    (void)operation;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_AEAD_ABORT_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_aead_abort,
                          TFM_CRYPTO_AEAD_ABORT);

    return status;
#endif
}

psa_status_t psa_mac_compute(psa_key_id_t key,
                             psa_algorithm_t alg,
                             const uint8_t *input,
                             size_t input_length,
                             uint8_t *mac,
                             size_t mac_size,
                             size_t *mac_length)
{
#if defined(TFM_CRYPTO_MAC_MODULE_DISABLED)
    (void)key;
    (void)alg;
    (void)input;
    (void)input_length;
    (void)mac;
    (void)mac_size;
    (void)mac_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_MAC_COMPUTE_SID,
        .key_id = key,
        .alg = alg,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = input, .len = input_length},
    };
    psa_outvec out_vec[] = {
        {.base = mac, .len = mac_size},
    };

    status = API_DISPATCH(tfm_crypto_mac_compute,
                          TFM_CRYPTO_MAC_COMPUTE);

    if (status == PSA_SUCCESS) {
        *mac_length = out_vec[0].len;
    }

    return status;
#endif
}

psa_status_t psa_mac_verify(psa_key_id_t key,
                            psa_algorithm_t alg,
                            const uint8_t *input,
                            size_t input_length,
                            const uint8_t *mac,
                            const size_t mac_length)
{
#if defined(TFM_CRYPTO_MAC_MODULE_DISABLED)
    (void)key;
    (void)alg;
    (void)input;
    (void)input_length;
    (void)mac;
    (void)mac_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_MAC_VERIFY_SID,
        .key_id = key,
        .alg = alg,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = input, .len = input_length},
        {.base = mac, .len = mac_length},
    };

    status = API_DISPATCH_NO_OUTVEC(tfm_crypto_mac_verify,
                                    TFM_CRYPTO_MAC_VERIFY);

    return status;
#endif
}

psa_status_t psa_cipher_encrypt(psa_key_id_t key,
                                psa_algorithm_t alg,
                                const uint8_t *input,
                                size_t input_length,
                                uint8_t *output,
                                size_t output_size,
                                size_t *output_length)
{
#if defined(TFM_CRYPTO_CIPHER_MODULE_DISABLED)
    (void)key;
    (void)alg;
    (void)input;
    (void)input_length;
    (void)output;
    (void)output_size;
    (void)output_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_CIPHER_ENCRYPT_SID,
        .key_id = key,
        .alg = alg,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = input, .len = input_length},
    };
    psa_outvec out_vec[] = {
        {.base = output, .len = output_size},
    };

    status = API_DISPATCH(tfm_crypto_cipher_encrypt,
                          TFM_CRYPTO_CIPHER_ENCRYPT);

    if (status == PSA_SUCCESS) {
        *output_length = out_vec[0].len;
    }

    return status;
#endif
}

psa_status_t psa_cipher_decrypt(psa_key_id_t key,
                                psa_algorithm_t alg,
                                const uint8_t *input,
                                size_t input_length,
                                uint8_t *output,
                                size_t output_size,
                                size_t *output_length)
{
#if defined(TFM_CRYPTO_CIPHER_MODULE_DISABLED)
    (void)key;
    (void)alg;
    (void)input;
    (void)input_length;
    (void)output;
    (void)output_size;
    (void)output_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_CIPHER_DECRYPT_SID,
        .key_id = key,
        .alg = alg,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = input, .len = input_length},
    };
    psa_outvec out_vec[] = {
        {.base = output, .len = output_size},
    };

    status = API_DISPATCH(tfm_crypto_cipher_decrypt,
                          TFM_CRYPTO_CIPHER_DECRYPT);

    if (status == PSA_SUCCESS) {
        *output_length = out_vec[0].len;
    }

    return status;
#endif
}

psa_status_t psa_raw_key_agreement(psa_algorithm_t alg,
                                   psa_key_id_t private_key,
                                   const uint8_t *peer_key,
                                   size_t peer_key_length,
                                   uint8_t *output,
                                   size_t output_size,
                                   size_t *output_length)
{
#if defined(TFM_CRYPTO_KEY_DERIVATION_MODULE_DISABLED)
    (void)alg;
    (void)private_key;
    (void)peer_key;
    (void)peer_key_length;
    (void)output;
    (void)output_size;
    (void)output_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_RAW_KEY_AGREEMENT_SID,
        .alg = alg,
        .key_id = private_key
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = peer_key, .len = peer_key_length},
    };

    psa_outvec out_vec[] = {
        {.base = output, .len = output_size},
    };

    status = API_DISPATCH(tfm_crypto_raw_key_agreement,
                          TFM_CRYPTO_RAW_KEY_AGREEMENT);

    *output_length = out_vec[0].len;

    return status;
#endif
}

psa_status_t psa_key_derivation_setup(psa_key_derivation_operation_t *operation,
                                      psa_algorithm_t alg)
{
#if defined(TFM_CRYPTO_KEY_DERIVATION_MODULE_DISABLED)
    (void)operation;
    (void)alg;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_KEY_DERIVATION_SETUP_SID,
        .alg = alg,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_key_derivation_setup,
                          TFM_CRYPTO_KEY_DERIVATION_SETUP);
    return status;
#endif
}

psa_status_t psa_key_derivation_set_capacity(
                                      psa_key_derivation_operation_t *operation,
                                      size_t capacity)
{
#if defined(TFM_CRYPTO_KEY_DERIVATION_MODULE_DISABLED)
    (void)operation;
    (void)capacity;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_KEY_DERIVATION_SET_CAPACITY_SID,
        .capacity = capacity,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };

    status = API_DISPATCH_NO_OUTVEC(tfm_crypto_key_derivation_set_capacity,
                                    TFM_CRYPTO_KEY_DERIVATION_SET_CAPACITY);
    return status;
#endif
}

psa_status_t psa_key_derivation_input_bytes(
                                      psa_key_derivation_operation_t *operation,
                                      psa_key_derivation_step_t step,
                                      const uint8_t *data,
                                      size_t data_length)
{
#if defined(TFM_CRYPTO_KEY_DERIVATION_MODULE_DISABLED)
    (void)operation;
    (void)step;
    (void)data;
    (void)data_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_KEY_DERIVATION_INPUT_BYTES_SID,
        .step = step,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = data, .len = data_length},
    };

    status = API_DISPATCH_NO_OUTVEC(tfm_crypto_key_derivation_input_bytes,
                                    TFM_CRYPTO_KEY_DERIVATION_INPUT_BYTES);
    return status;
#endif
}

psa_status_t psa_key_derivation_input_integer(
                                      psa_key_derivation_operation_t *operation,
                                      psa_key_derivation_step_t step,
                                      uint64_t value)
{
#if defined(TFM_CRYPTO_KEY_DERIVATION_MODULE_DISABLED)
    (void)operation;
    (void)step;
    (void)value;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_KEY_DERIVATION_INPUT_INTEGER_SID,
        .step = step,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = &value, .len = sizeof(uint64_t)},
    };

    status = API_DISPATCH_NO_OUTVEC(tfm_crypto_key_derivation_input_integer,
                                    TFM_CRYPTO_KEY_DERIVATION_INPUT_INTEGER);
    return status;
#endif
}

psa_status_t psa_key_derivation_output_key(
                                      const psa_key_attributes_t *attributes,
                                      psa_key_derivation_operation_t *operation,
                                      psa_key_id_t *key)
{
#if defined(TFM_CRYPTO_KEY_DERIVATION_MODULE_DISABLED)
    (void)attributes;
    (void)operation;
    (void)key;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_KEY_DERIVATION_OUTPUT_KEY_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = attributes, .len = sizeof(psa_key_attributes_t)},
    };

    psa_outvec out_vec[] = {
        {.base = key, .len = sizeof(psa_key_id_t)}
    };

    status = API_DISPATCH(tfm_crypto_key_derivation_output_key,
                          TFM_CRYPTO_KEY_DERIVATION_OUTPUT_KEY);
    return status;
#endif
}

psa_status_t psa_aead_encrypt_setup(psa_aead_operation_t *operation,
                                    psa_key_id_t key,
                                    psa_algorithm_t alg)
{
#if defined(TFM_CRYPTO_AEAD_MODULE_DISABLED)
    (void)operation;
    (void)key;
    (void)alg;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_AEAD_ENCRYPT_SETUP_SID,
        .key_id = key,
        .alg = alg,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_aead_encrypt_setup,
                          TFM_CRYPTO_AEAD_ENCRYPT_SETUP);

    return status;
#endif
}

psa_status_t psa_aead_decrypt_setup(psa_aead_operation_t *operation,
                                    psa_key_id_t key,
                                    psa_algorithm_t alg)
{
#if defined(TFM_CRYPTO_AEAD_MODULE_DISABLED)
    (void)operation;
    (void)key;
    (void)alg;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_AEAD_DECRYPT_SETUP_SID,
        .key_id = key,
        .alg = alg,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_aead_decrypt_setup,
                          TFM_CRYPTO_AEAD_DECRYPT_SETUP);

    return status;
#endif
}

psa_status_t psa_aead_generate_nonce(psa_aead_operation_t *operation,
                                     uint8_t *nonce,
                                     size_t nonce_size,
                                     size_t *nonce_length)
{
#if defined(TFM_CRYPTO_AEAD_MODULE_DISABLED)
    (void)operation;
    (void)nonce;
    (void)nonce_size;
    (void)nonce_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_AEAD_GENERATE_NONCE_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
        {.base = nonce, .len = nonce_size},
    };

    status = API_DISPATCH(tfm_crypto_aead_generate_nonce,
                          TFM_CRYPTO_AEAD_GENERATE_NONCE);

    *nonce_length = out_vec[1].len;

    return status;
#endif
}

psa_status_t psa_aead_set_nonce(psa_aead_operation_t *operation,
                                const uint8_t *nonce,
                                size_t nonce_length)
{
#if defined(TFM_CRYPTO_AEAD_MODULE_DISABLED)
    (void)operation;
    (void)nonce;
    (void)nonce_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_AEAD_SET_NONCE_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = nonce, .len = nonce_length},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_aead_set_nonce,
                          TFM_CRYPTO_AEAD_SET_NONCE);

    return status;
#endif
}

psa_status_t psa_aead_set_lengths(psa_aead_operation_t *operation,
                                  size_t ad_length,
                                  size_t plaintext_length)
{
#if defined(TFM_CRYPTO_AEAD_MODULE_DISABLED)
    (void)operation;
    (void)ad_length;
    (void)plaintext_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_AEAD_SET_LENGTHS_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = &ad_length, .len = sizeof(ad_length)},
        {.base = &plaintext_length, .len = sizeof(plaintext_length)},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_aead_set_lengths,
                          TFM_CRYPTO_AEAD_SET_LENGTHS);

    return status;
#endif
}

psa_status_t psa_aead_update(psa_aead_operation_t *operation,
                             const uint8_t *input,
                             size_t input_length,
                             uint8_t *output,
                             size_t output_size,
                             size_t *output_length)
{
#if defined(TFM_CRYPTO_AEAD_MODULE_DISABLED)
    (void)operation;
    (void)input;
    (void)input_length;
    (void)output;
    (void)output_size;
    (void)output_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_AEAD_UPDATE_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = input, .len = input_length},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
        {.base = output, .len = output_size}
    };

    status = API_DISPATCH(tfm_crypto_aead_update,
                          TFM_CRYPTO_AEAD_UPDATE);

    *output_length = out_vec[1].len;

    return status;
#endif
}

psa_status_t psa_pake_setup(psa_pake_operation_t *operation,
                            const psa_pake_cipher_suite_t *cipher_suite)
{
#if defined(TFM_CRYPTO_PAKE_MODULE_DISABLED)
    (void)operation;
    (void)cipher_suite;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_PAKE_SETUP_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = cipher_suite, .len = sizeof(psa_pake_cipher_suite_t)},
    };
    psa_outvec out_vec[] = {
        {.base = &(operation->handle), .len = sizeof(uint32_t)},
    };

    status = API_DISPATCH(tfm_crypto_pake_setup,
                          TFM_CRYPTO_PAKE_SETUP);

    return status;
#endif
}

psa_status_t psa_pake_set_password_key(psa_pake_operation_t *operation,
                                       mbedtls_svc_key_id_t password)
{
#if defined(TFM_CRYPTO_PAKE_MODULE_DISABLED)
    (void)operation;
    (void)password;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_PAKE_SET_PASSWORD_KEY_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = &password, .len = sizeof(mbedtls_svc_key_id_t)},
    };

    status = API_DISPATCH_NO_OUTVEC(tfm_crypto_pake_set_password_key,
                                    TFM_CRYPTO_PAKE_SET_PASSWORD_KEY);

    return status;
#endif
}

psa_status_t psa_pake_set_user(psa_pake_operation_t *operation,
                               const uint8_t *user_id,
                               size_t user_id_len)
{
#if defined(TFM_CRYPTO_PAKE_MODULE_DISABLED)
    (void)operation;
    (void)user_id;
    (void)user_id_len;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_PAKE_SET_USER_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = user_id, .len = user_id_len},
    };

    status = API_DISPATCH_NO_OUTVEC(tfm_crypto_pake_set_user,
                                    TFM_CRYPTO_PAKE_SET_USER);

    return status;
#endif
}

psa_status_t psa_pake_set_peer(psa_pake_operation_t *operation,
                               const uint8_t *peer_id,
                               size_t peer_id_len)
{
#if defined(TFM_CRYPTO_PAKE_MODULE_DISABLED)
    (void)operation;
    (void)peer_id;
    (void)peer_id_len;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_PAKE_SET_PEER_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = peer_id, .len = peer_id_len},
    };

    status = API_DISPATCH_NO_OUTVEC(tfm_crypto_pake_set_peer,
                                    TFM_CRYPTO_PAKE_SET_PEER);

    return status;
#endif
}

psa_status_t psa_pake_set_role(psa_pake_operation_t *operation,
                               psa_pake_role_t role)
{
#if defined(TFM_CRYPTO_PAKE_MODULE_DISABLED)
    (void)operation;
    (void)role;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_PAKE_SET_ROLE_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = &role, .len = sizeof(psa_pake_role_t)},
    };

    status = API_DISPATCH_NO_OUTVEC(tfm_crypto_pake_set_role,
                                    TFM_CRYPTO_PAKE_SET_ROLE);

    return status;
#endif
}

psa_status_t psa_pake_output(psa_pake_operation_t *operation,
                             psa_pake_step_t step,
                             uint8_t *output,
                             size_t output_size,
                             size_t *output_length)
{
#if defined(TFM_CRYPTO_PAKE_MODULE_DISABLED)
    (void)operation;
    (void)step;
    (void)output;
    (void)output_size;
    (void)output_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_PAKE_OUTPUT_SID,
        .op_handle = operation->handle,
        .step = step,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = output, .len = output_size}
    };

    status = API_DISPATCH(tfm_crypto_pake_output,
                          TFM_CRYPTO_PAKE_OUTPUT);

    *output_length = out_vec[0].len;

    return status;
#endif
}

psa_status_t psa_pake_input(psa_pake_operation_t *operation,
                            psa_pake_step_t step,
                            const uint8_t *input,
                            size_t input_length)
{
#if defined(TFM_CRYPTO_PAKE_MODULE_DISABLED)
    (void)operation;
    (void)step;
    (void)input;
    (void)input_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_PAKE_INPUT_SID,
        .op_handle = operation->handle,
        .step = step,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = input, .len = input_length},
    };

    status = API_DISPATCH_NO_OUTVEC(tfm_crypto_pake_input,
                                    TFM_CRYPTO_PAKE_INPUT);

    return status;
#endif
}

psa_status_t psa_pake_get_implicit_key(psa_pake_operation_t *operation,
                                       psa_key_derivation_operation_t *output)
{
#if defined(TFM_CRYPTO_PAKE_MODULE_DISABLED)
    (void)operation;
    (void)output;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_PAKE_GET_IMPLICIT_KEY_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
        {.base = output, .len = sizeof(psa_key_derivation_operation_t)},
    };

    status = API_DISPATCH_NO_OUTVEC(tfm_crypto_pake_get_implicit_key,
                                    TFM_CRYPTO_PAKE_GET_IMPLICIT_KEY);

    return status;
#endif
}

psa_status_t psa_pake_derive_secret(psa_pake_operation_t *operation,
                                    uint8_t *key_buf,
                                    size_t key_length)
{
#if defined(TFM_CRYPTO_PAKE_MODULE_DISABLED)
    (void)operation;
    (void)key_buf;
    (void)key_length;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_PAKE_DERIVE_SECRET_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };
    psa_outvec out_vec[] = {
        {.base = key_buf, .len = key_length}
    };

    status = API_DISPATCH(tfm_crypto_pake_derive_secret,
                          TFM_CRYPTO_PAKE_DERIVE_SECRET);

    return status;
#endif
}

psa_status_t psa_pake_abort(psa_pake_operation_t *operation)
{
#if defined(TFM_CRYPTO_PAKE_MODULE_DISABLED)
    (void)operation;

    return PSA_ERROR_NOT_SUPPORTED;
#else
    psa_status_t status;
    struct tfm_crypto_pack_iovec iov = {
        .sfn_id = TFM_CRYPTO_PAKE_ABORT_SID,
        .op_handle = operation->handle,
    };

    psa_invec in_vec[] = {
        {.base = &iov, .len = sizeof(struct tfm_crypto_pack_iovec)},
    };

    status = API_DISPATCH_NO_OUTVEC(tfm_crypto_pake_abort,
                                    TFM_CRYPTO_PAKE_ABORT);

    return status;
#endif
}

psa_status_t psa_set_key_domain_parameters( psa_key_attributes_t *attributes,
                                            psa_key_type_t type,
                                            const uint8_t *data,
                                            size_t data_length )
{
    /* The SiliconLabs SKL does not support key domain parameters yet. */
    if( (data != NULL) && (data_length != 0) ) {
        return( PSA_ERROR_NOT_SUPPORTED );
    }

    attributes->client.type = type;
    return PSA_SUCCESS;
}
