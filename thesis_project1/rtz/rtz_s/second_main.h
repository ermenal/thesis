#ifndef SECOND_MAIN_H
#define SECOND_MAIN_H

#include "sl_rail_util_init.h"
#include <stdbool.h>

#include "../../boot_state.h"
#include "sl_sleeptimer.h"

void init_secure_radio(void);

SL_CODE_RAM void sl_rail_util_on_event(sl_rail_handle_t rail_handle, sl_rail_events_t events);

uint16_t download_packet(RAIL_Handle_t rail_handle, uint8_t *rx_buf);

uint32_t transmit_packet(uint8_t *payload, uint16_t length);

bool boot_state_manager_init(void);
const NvmBootState_t *boot_state_get_current(void);
AppSlot_t boot_state_get_inactive_slot(void);
bool boot_state_mark_update_pending(AppSlot_t target_slot);
bool boot_state_commit_proof_of_life(void);

// Packet counting for 1-minute measurement
static volatile uint32_t packet_count = 0u;
static volatile bool measurement_active = false;
static sl_sleeptimer_timer_handle_t measurement_timer;
void measurement_timer_callback(sl_sleeptimer_timer_handle_t *handle, void *data);

#endif /* SECOND_MAIN_H */