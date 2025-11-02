#include "rail.h"
#include "sl_rail.h"

void init_secure_radio(void);

SL_CODE_RAM void sl_rail_util_on_event(sl_rail_handle_t rail_handle, sl_rail_events_t events);

uint16_t download_packet(RAIL_Handle_t rail_handle, uint8_t *rx_buf);

uint32_t transmit_packet(uint8_t *payload, uint16_t length);