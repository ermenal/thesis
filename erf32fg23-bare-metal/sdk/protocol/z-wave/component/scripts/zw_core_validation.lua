-- This validation script checks following:
-- 1. FreeRTOS requires settings
--  1. configUSE_IDLE_HOOK must be set to 1 in Z-Wave application
--  2. configTIMER_TASK_PRIORITY must be set to 55 in Z-Wave application
--  3.1 configMAX_SYSCALL_INTERRUPT_PRIORITY must be set to 32 in Z-Wave application for Series 1
--  3.2 configMAX_SYSCALL_INTERRUPT_PRIORITY must be set to 16 in Z-Wave application for Series 2
--  4.1 configKERNEL_INTERRUPT_PRIORITY must be set to 224 in Z-Wave application for Series 1
--  4.2 configKERNEL_INTERRUPT_PRIORITY must be set to 112 in Z-Wave application for Series 2
--  5. configTIMER_QUEUE_LENGTH must be set to 8 in Z-Wave application
-- 2. sl_device required settings
--  1. SL_DEVICE_INIT_DCDC_BYPASS must be set to 1 in Z_Wave applications
-- 3. sl_psa required settings
--  1. SL_PSA_ITS_USER_MAX_FILES must be set to 32 in Z_Wave applications for Series 2 with Security Vault
--  2. SL_PSA_KEY_USER_SLOT_COUNT must be set to 12 in Z_Wave applications for Series 2 with Security Vault
-- 4. sl_sleeptimer required settings
--  1. SL_SLEEPTIMER_PERIPHERAL must be set to SL_SLEEPTIMER_PERIPHERAL_BURTC in Z_Wave applications for Series 2
-- 5. sl_power_manager
--  1. power_manager_deepsleep component must be added to Z_Wave applications to support the lowest energy mode EM3
--  2. RAIL power manager initialization must not be enabled (this is a temporary workaround)
local device_sdid_95 = slc.is_provided("device_sdid_95")
local device_series_1 = slc.is_provided("device_series_1")
local device_series_2 = slc.is_provided("device_series_2")
local device_security_vault = slc.is_provided("device_security_vault")
local device_init_dcdc = slc.is_provided("device_init_dcdc")
local psa_crypto = slc.is_provided("psa_crypto")
local psa_its = slc.is_provided("psa_its")

function validate_config_component(name, value)
    local config = slc.config(name)

    if config == nil then
        validation.error('Z-Wave requires ' .. name .. ' to be available',
                         validation.target_for_defines({name}), nil, nil)
    end
    if config.value ~= value then
        validation.error('Z-Wave requires ' .. config.id .. ' to be set to ' ..
                             value .. '.',
                         validation.target_for_defines({config.id}), nil, nil)
    end
end

-- freertos
validate_config_component("configUSE_IDLE_HOOK", "1")
validate_config_component("configTIMER_TASK_PRIORITY", "55")

if device_series_1 then
    validate_config_component("configMAX_SYSCALL_INTERRUPT_PRIORITY", "32")
    validate_config_component("configKERNEL_INTERRUPT_PRIORITY", "224")
end

if device_series_2 then
    validate_config_component("configMAX_SYSCALL_INTERRUPT_PRIORITY", "16")
    validate_config_component("configKERNEL_INTERRUPT_PRIORITY", "112")
end

if device_sdid_95 then
    validate_config_component("configTIMER_QUEUE_LENGTH", "4")
else
    validate_config_component("configTIMER_QUEUE_LENGTH", "8")
end

-- sl_device
if device_init_dcdc then
    validate_config_component("SL_DEVICE_INIT_DCDC_BYPASS", "1")
end

-- sl_psa
if device_series_2 and device_security_vault and psa_crypto and psa_its then
    validate_config_component("SL_PSA_ITS_USER_MAX_FILES", "32")
    validate_config_component("SL_PSA_KEY_USER_SLOT_COUNT", "14")
end

-- sl_sleeptimer
if device_series_2 then
    validate_config_component("SL_SLEEPTIMER_PERIPHERAL", "SL_SLEEPTIMER_PERIPHERAL_BURTC")
end

-- sl_board
if not slc.is_selected("power_manager_deepsleep") then
    validation.error('Z-Wave requires power_manager_deepsleep to support the lowest energy mode being EM3', validation.target_for_project())
end

-- sl_rail_util_power_manager
validate_config_component("SL_RAIL_UTIL_RAIL_POWER_MANAGER_INIT", "0")

--
-- EOF
-- 
