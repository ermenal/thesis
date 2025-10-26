#ifndef NSC_GPIO_H
#define NSC_GPIO_H

// This is the function prototype for the Non-Secure Callable API.
// The Non-secure world will call this function.
void nsc_led_toggle(void);

#endif // NSC_GPIO_H