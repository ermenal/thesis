#include "em_device.h"
#include "tz_config.h"

int main(void)
{
  // Call the Secure API function
  SECURE_hello_world();

  while(1);
}