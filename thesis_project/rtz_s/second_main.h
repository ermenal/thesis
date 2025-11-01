#include "rail.h"
#include "sl_rail.h"

void init_secure_radio(void);

void process_action_secure_radio(void);

SL_CODE_RAM void sl_rail_util_on_event(sl_rail_handle_t rail_handle, sl_rail_events_t events);