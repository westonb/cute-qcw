# recommended order from UG903 pg 12:
## Timing Assertions Section
# Primary clocks
# Virtual clocks
# Generated clocks
# Clock Groups
# Input and output delay constraints
## Timing Exceptions Section
# False Paths
# Max Delay / Min Delay
# Multicycle Paths
# Case Analysis
# Disable Timing

create_clock -add -name adc_clk -period 12.5 [get_ports { ADC_BIT_CLK }];

set_input_jitter [get_clocks ADC_DCO] 0.001
set_input_delay –clock adc_clk –max 0.1 [get_ports ADC_DATA]
set_input_delay –clock adc_clk –min 0.1 [get_ports ADC_DATA]



