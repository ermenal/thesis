/**
 * @file main.c
 * @author Lowie Deferme <lowie.deferme@kuleuven.be>
 * @brief Application main
 * @version 0.1
 * @date 2024-04-26
 *
 * @copyright Copyright (c) 2024
 */

#include <stdint.h>
#include "em_device.h"
#include "em_cmu.h"
#include "em_gpio.h"
#include "em_usart.h"

#include "iot_uart_cfg_vcom.h"
#include "iot_pwm_cfg_led0.h"

int main(void)
{
    /* Make variables from macros for debug purposes */
    USART_TypeDef *uart0 = USART0;

    /* Enable USART0 clock domain. Also enable the clock for GPIO in order to configure pins. */
    CMU_ClockEnable(cmuClock_USART0, true);
    CMU_ClockEnable(cmuClock_GPIO, true);

    /* Initialize with default settings and then update fields according to application requirements. */
    USART_InitAsync_TypeDef initAsync = USART_INITASYNC_DEFAULT;
    initAsync.baudrate = 115200;
    initAsync.enable = usartDisable;
    USART_InitAsync(uart0, &initAsync);

    /* Configure USART0 pins */
    GPIO_Port_TypeDef tx_port = IOT_UART_CFG_VCOM_TX_PORT;
    uint8_t tx_pin = IOT_UART_CFG_VCOM_TX_PIN;
    GPIO_Port_TypeDef rx_port = IOT_UART_CFG_VCOM_RX_PORT;
    uint8_t rx_pin = IOT_UART_CFG_VCOM_RX_PIN;

    GPIO_Port_TypeDef led_port = gpioPortB;
    uint8_t led_pin = 2;

    GPIO->USARTROUTE[0].ROUTEEN = GPIO_USART_ROUTEEN_TXPEN | GPIO_USART_ROUTEEN_RXPEN;
    GPIO->USARTROUTE[0].TXROUTE = tx_port | (tx_pin << _GPIO_USART_CLKROUTE_PIN_SHIFT);
    GPIO->USARTROUTE[0].RXROUTE = rx_port | (rx_pin << _GPIO_USART_CLKROUTE_PIN_SHIFT);

    GPIO_PinModeSet(tx_port, tx_pin, gpioModePushPull, 1);
    GPIO_PinModeSet(rx_port, rx_pin, gpioModeInputPull, 1);
    GPIO_PinModeSet(led_port, led_pin, gpioModePushPull, 0);

    // Enable USART0
    // USART_Enable(uart0, usartEnable);
    uart0->CMD = USART_CMD_RXEN | USART_CMD_TXEN;
    uart0->EN = USART_EN_EN;

    for (;;)
    {
    //    for (int i = 0; i < 64; i++)
    //    {
    //        USART_Tx(USART0, 'a');
    //    }
    //    for (int i = 0; i < 64; i++)
    //    {
    //        USART_Tx(USART0, '\x00');
    //    }
        GPIO_PinOutToggle(led_port, led_pin);
        uint32_t i;
        for (i = 0; i < 10000000; i++){
            __NOP();
        }
    }
}
