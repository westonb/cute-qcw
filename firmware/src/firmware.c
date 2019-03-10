
#include <stdint.h>
#include <stdbool.h>

/*
firmware for PowerSoC V0.1
6 clock cycles per CPU cycle
50MHz clock frequency
*/
//extern uint32_t sram;

#define reg_uart_clkdiv (*(volatile uint32_t*)0x02000004)
#define reg_uart_data (*(volatile uint32_t*)0x02000008)

#define reg_gpio_cfg (*(volatile uint32_t*) 0x02100000)
#define reg_gpio_out (*(volatile uint32_t*) 0x02100004)
#define reg_gpio_in (*(volatile uint32_t*) 0x02100008)

#define reg_spi_clkdiv (*(volatile uint32_t*) 0x02200000)
#define reg_spi_out (*(volatile uint32_t*) 0x02200004)
#define reg_spi_in (*(volatile uint32_t*) 0x02200008)
#define reg_spi_status (*(volatile uint32_t*) 0x0220000C)


void putchar(char c)
{
	if (c == '\n')
		putchar('\r');
	reg_uart_data = c;
}

void print(const char *p)
{
	while (*p)
		putchar(*(p++));
}


void delay_ms(uint8_t ms){
	//based on simulation below loop takes 64 cycles.
	uint32_t i;
	for(i=0; i < (780); i++){
		asm ("nop");
	}
}

void send_bytes(uint8_t *data, uint8_t data_len){
	uint8_t i;
	for (i=0; i<data_len; i++){
		reg_spi_out = (uint32_t) data[i];
		while(reg_spi_status == 0){

		}
	}
}

void adc_configure(void){
	uint8_t config_data[3];
}

void main()
{
	uint8_t spi_test_data[] = {1,2,3,4,5,6,7,8};
	//configure for 38400 baud 
	//uart is 8N1
	reg_uart_clkdiv = 1302;
	//SPI is 1 Mhz
	reg_spi_clkdiv = 50;
	reg_gpio_out = 11;
	print("Firmware Loaded\n");
	print("\n");

	while (1)
	{
		print("Hello World\n");
	
	}
}
