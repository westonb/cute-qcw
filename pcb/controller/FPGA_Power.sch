EESchema Schematic File Version 4
LIBS:controller-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L wbraun_ic_lib:XC7S25-L1FTGB196 U?
U 4 1 5BE9D688
P 3200 3650
F 0 "U?" H 3200 6365 50  0000 C CNN
F 1 "XC7S25-L1FTGB196" H 3200 6274 50  0000 C CNN
F 2 "wbraun_smd:FTGB196" H 1450 4850 50  0001 C CNN
F 3 "" H 1450 4850 50  0001 C CNN
	4    3200 3650
	1    0    0    -1  
$EndComp
Text Notes 6600 900  0    50   ~ 0
Decoupling Capacitors Recomendation from UG483, Table 2-1
$Comp
L Device:C C?
U 1 1 5BE9D787
P 6600 1550
F 0 "C?" H 6715 1596 50  0000 L CNN
F 1 "100u" H 6715 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6638 1400 50  0001 C CNN
F 3 "~" H 6600 1550 50  0001 C CNN
	1    6600 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5BE9D86F
P 7100 1550
F 0 "C?" H 7215 1596 50  0000 L CNN
F 1 "4.7u" H 7215 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7138 1400 50  0001 C CNN
F 3 "~" H 7100 1550 50  0001 C CNN
	1    7100 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5BE9D8B0
P 7600 1550
F 0 "C?" H 7715 1596 50  0000 L CNN
F 1 "4.7u" H 7715 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7638 1400 50  0001 C CNN
F 3 "~" H 7600 1550 50  0001 C CNN
	1    7600 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5BE9D8FE
P 8100 1550
F 0 "C?" H 8215 1596 50  0000 L CNN
F 1 "0.47u" H 8215 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8138 1400 50  0001 C CNN
F 3 "~" H 8100 1550 50  0001 C CNN
	1    8100 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5BE9D94B
P 8600 1550
F 0 "C?" H 8715 1596 50  0000 L CNN
F 1 "0.47u" H 8715 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8638 1400 50  0001 C CNN
F 3 "~" H 8600 1550 50  0001 C CNN
	1    8600 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5BE9D985
P 9100 1550
F 0 "C?" H 9215 1596 50  0000 L CNN
F 1 "0.47u" H 9215 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9138 1400 50  0001 C CNN
F 3 "~" H 9100 1550 50  0001 C CNN
	1    9100 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BE9DBC2
P 6600 1800
F 0 "#PWR?" H 6600 1550 50  0001 C CNN
F 1 "GND" H 6605 1627 50  0000 C CNN
F 2 "" H 6600 1800 50  0001 C CNN
F 3 "" H 6600 1800 50  0001 C CNN
	1    6600 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 1400 6600 1350
Wire Wire Line
	6600 1350 7100 1350
Wire Wire Line
	7100 1350 7100 1400
Connection ~ 6600 1350
Wire Wire Line
	6600 1350 6600 1200
Wire Wire Line
	7100 1350 7600 1350
Wire Wire Line
	7600 1350 7600 1400
Connection ~ 7100 1350
Wire Wire Line
	7600 1350 8100 1350
Wire Wire Line
	8100 1350 8100 1400
Connection ~ 7600 1350
Wire Wire Line
	8100 1350 8600 1350
Wire Wire Line
	8600 1350 8600 1400
Connection ~ 8100 1350
Wire Wire Line
	8600 1350 9100 1350
Wire Wire Line
	9100 1350 9100 1400
Connection ~ 8600 1350
Wire Wire Line
	6600 1700 6600 1750
Wire Wire Line
	7100 1700 7100 1750
Wire Wire Line
	7100 1750 6600 1750
Connection ~ 6600 1750
Wire Wire Line
	6600 1750 6600 1800
Wire Wire Line
	7100 1750 7600 1750
Wire Wire Line
	7600 1750 7600 1700
Connection ~ 7100 1750
Wire Wire Line
	7600 1750 8100 1750
Wire Wire Line
	8100 1750 8100 1700
Connection ~ 7600 1750
Wire Wire Line
	8100 1750 8600 1750
Wire Wire Line
	8600 1750 8600 1700
Connection ~ 8100 1750
Wire Wire Line
	8600 1750 9100 1750
Wire Wire Line
	9100 1750 9100 1700
Connection ~ 8600 1750
Text Notes 6100 1550 0    50   ~ 0
VCCINT
$Comp
L Device:C C?
U 1 1 5BE9E4DA
P 6600 2500
F 0 "C?" H 6715 2546 50  0000 L CNN
F 1 "47u" H 6715 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6638 2350 50  0001 C CNN
F 3 "~" H 6600 2500 50  0001 C CNN
	1    6600 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5BE9E54C
P 7100 2500
F 0 "C?" H 7215 2546 50  0000 L CNN
F 1 "4.7u" H 7215 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7138 2350 50  0001 C CNN
F 3 "~" H 7100 2500 50  0001 C CNN
	1    7100 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5BE9E59F
P 7600 2500
F 0 "C?" H 7715 2546 50  0000 L CNN
F 1 "0.47u" H 7715 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7638 2350 50  0001 C CNN
F 3 "~" H 7600 2500 50  0001 C CNN
	1    7600 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BE9E649
P 6600 2750
F 0 "#PWR?" H 6600 2500 50  0001 C CNN
F 1 "GND" H 6605 2577 50  0000 C CNN
F 2 "" H 6600 2750 50  0001 C CNN
F 3 "" H 6600 2750 50  0001 C CNN
	1    6600 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2650 6600 2700
Wire Wire Line
	6600 2700 7100 2700
Wire Wire Line
	7100 2700 7100 2650
Wire Wire Line
	7100 2700 7600 2700
Wire Wire Line
	7600 2700 7600 2650
Connection ~ 7100 2700
Wire Wire Line
	6600 2700 6600 2750
Connection ~ 6600 2700
Wire Wire Line
	6600 2350 6600 2300
Wire Wire Line
	6600 2300 7100 2300
Wire Wire Line
	7100 2300 7100 2350
Wire Wire Line
	7100 2300 7600 2300
Wire Wire Line
	7600 2300 7600 2350
Connection ~ 7100 2300
Connection ~ 6600 2300
Wire Wire Line
	6600 2200 6600 2300
Text Notes 6050 2500 0    50   ~ 0
VCCBRAM
$Comp
L Device:C C?
U 1 1 5BEA04FC
P 6600 3450
F 0 "C?" H 6715 3496 50  0000 L CNN
F 1 "47u" H 6715 3405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6638 3300 50  0001 C CNN
F 3 "~" H 6600 3450 50  0001 C CNN
	1    6600 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5BEA0573
P 7100 3450
F 0 "C?" H 7215 3496 50  0000 L CNN
F 1 "4.7u" H 7215 3405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7138 3300 50  0001 C CNN
F 3 "~" H 7100 3450 50  0001 C CNN
	1    7100 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5BEA05CB
P 7500 3450
F 0 "C?" H 7615 3496 50  0000 L CNN
F 1 "0.47u" H 7615 3405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7538 3300 50  0001 C CNN
F 3 "~" H 7500 3450 50  0001 C CNN
	1    7500 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5BEA0628
P 8000 3450
F 0 "C?" H 8115 3496 50  0000 L CNN
F 1 "0.47u" H 8115 3405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8038 3300 50  0001 C CNN
F 3 "~" H 8000 3450 50  0001 C CNN
	1    8000 3450
	1    0    0    -1  
$EndComp
Text Notes 6100 3500 0    50   ~ 0
VCCAUX
$Comp
L power:GND #PWR?
U 1 1 5BEA0775
P 6600 3700
F 0 "#PWR?" H 6600 3450 50  0001 C CNN
F 1 "GND" H 6605 3527 50  0000 C CNN
F 2 "" H 6600 3700 50  0001 C CNN
F 3 "" H 6600 3700 50  0001 C CNN
	1    6600 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 3600 8000 3650
Wire Wire Line
	8000 3650 7500 3650
Wire Wire Line
	6600 3650 6600 3600
Wire Wire Line
	6600 3650 6600 3700
Connection ~ 6600 3650
Wire Wire Line
	7100 3600 7100 3650
Connection ~ 7100 3650
Wire Wire Line
	7100 3650 6600 3650
Wire Wire Line
	7500 3600 7500 3650
Connection ~ 7500 3650
Wire Wire Line
	7500 3650 7100 3650
Wire Wire Line
	8000 3300 8000 3250
Wire Wire Line
	8000 3250 7500 3250
Wire Wire Line
	6600 3250 6600 3300
Wire Wire Line
	7100 3250 7100 3300
Connection ~ 7100 3250
Wire Wire Line
	7100 3250 6600 3250
Wire Wire Line
	7500 3250 7500 3300
Connection ~ 7500 3250
Wire Wire Line
	7500 3250 7100 3250
Wire Wire Line
	6600 3250 6600 3150
Connection ~ 6600 3250
$Comp
L Device:C C?
U 1 1 5BEA54D0
P 6600 4600
F 0 "C?" H 6715 4646 50  0000 L CNN
F 1 "47u" H 6715 4555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6638 4450 50  0001 C CNN
F 3 "~" H 6600 4600 50  0001 C CNN
	1    6600 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5BEA54D6
P 7100 4600
F 0 "C?" H 7215 4646 50  0000 L CNN
F 1 "4.7u" H 7215 4555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7138 4450 50  0001 C CNN
F 3 "~" H 7100 4600 50  0001 C CNN
	1    7100 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5BEA54DC
P 7600 4600
F 0 "C?" H 7715 4646 50  0000 L CNN
F 1 "4.7u" H 7715 4555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7638 4450 50  0001 C CNN
F 3 "~" H 7600 4600 50  0001 C CNN
	1    7600 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5BEA54E2
P 8100 4600
F 0 "C?" H 8215 4646 50  0000 L CNN
F 1 "0.47u" H 8215 4555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8138 4450 50  0001 C CNN
F 3 "~" H 8100 4600 50  0001 C CNN
	1    8100 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5BEA54F4
P 6600 4850
F 0 "#PWR?" H 6600 4600 50  0001 C CNN
F 1 "GND" H 6605 4677 50  0000 C CNN
F 2 "" H 6600 4850 50  0001 C CNN
F 3 "" H 6600 4850 50  0001 C CNN
	1    6600 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 4450 6600 4400
Wire Wire Line
	6600 4400 7100 4400
Wire Wire Line
	7100 4400 7100 4450
Connection ~ 6600 4400
Wire Wire Line
	6600 4400 6600 4250
Wire Wire Line
	7100 4400 7600 4400
Wire Wire Line
	7600 4400 7600 4450
Connection ~ 7100 4400
Wire Wire Line
	7600 4400 8100 4400
Wire Wire Line
	8100 4400 8100 4450
Connection ~ 7600 4400
Wire Wire Line
	8100 4400 8600 4400
Wire Wire Line
	8600 4400 8600 4450
Connection ~ 8100 4400
Wire Wire Line
	8600 4400 9100 4400
Wire Wire Line
	9100 4400 9100 4450
Connection ~ 8600 4400
Wire Wire Line
	6600 4750 6600 4800
Wire Wire Line
	7100 4750 7100 4800
Wire Wire Line
	7100 4800 6600 4800
Connection ~ 6600 4800
Wire Wire Line
	6600 4800 6600 4850
Wire Wire Line
	7100 4800 7600 4800
Wire Wire Line
	7600 4800 7600 4750
Connection ~ 7100 4800
Wire Wire Line
	7600 4800 8100 4800
Wire Wire Line
	8100 4800 8100 4750
Connection ~ 7600 4800
Wire Wire Line
	8100 4800 8600 4800
Wire Wire Line
	8600 4800 8600 4750
Connection ~ 8100 4800
Wire Wire Line
	8600 4800 9100 4800
Wire Wire Line
	9100 4800 9100 4750
Connection ~ 8600 4800
Text Notes 6200 4600 0    50   ~ 0
VCCO14
Wire Wire Line
	2200 1200 2100 1200
Wire Wire Line
	2100 1200 2100 1300
Wire Wire Line
	2200 6100 2100 6100
Connection ~ 2100 6100
Wire Wire Line
	2100 6100 2100 6200
Wire Wire Line
	2200 6000 2100 6000
Connection ~ 2100 6000
Wire Wire Line
	2100 6000 2100 6100
Wire Wire Line
	2200 5900 2100 5900
Connection ~ 2100 5900
Wire Wire Line
	2100 5900 2100 6000
Wire Wire Line
	2200 5800 2100 5800
Connection ~ 2100 5800
Wire Wire Line
	2100 5800 2100 5900
Wire Wire Line
	2200 5700 2100 5700
Connection ~ 2100 5700
Wire Wire Line
	2100 5700 2100 5800
Wire Wire Line
	2200 5600 2100 5600
Connection ~ 2100 5600
Wire Wire Line
	2100 5600 2100 5700
Wire Wire Line
	2200 5500 2100 5500
Connection ~ 2100 5500
Wire Wire Line
	2100 5500 2100 5600
Wire Wire Line
	2200 5400 2100 5400
Connection ~ 2100 5400
Wire Wire Line
	2100 5400 2100 5500
Wire Wire Line
	2200 5300 2100 5300
Connection ~ 2100 5300
Wire Wire Line
	2100 5300 2100 5400
Wire Wire Line
	2200 5200 2100 5200
Connection ~ 2100 5200
Wire Wire Line
	2100 5200 2100 5300
Wire Wire Line
	2200 5100 2100 5100
Connection ~ 2100 5100
Wire Wire Line
	2100 5100 2100 5200
Wire Wire Line
	2200 5000 2100 5000
Connection ~ 2100 5000
Wire Wire Line
	2100 5000 2100 5100
Wire Wire Line
	2200 4900 2100 4900
Connection ~ 2100 4900
Wire Wire Line
	2100 4900 2100 5000
Wire Wire Line
	2200 4800 2100 4800
Connection ~ 2100 4800
Wire Wire Line
	2100 4800 2100 4900
Wire Wire Line
	2200 4700 2100 4700
Connection ~ 2100 4700
Wire Wire Line
	2100 4700 2100 4800
Wire Wire Line
	2200 4600 2100 4600
Connection ~ 2100 4600
Wire Wire Line
	2100 4600 2100 4700
Wire Wire Line
	2200 4500 2100 4500
Connection ~ 2100 4500
Wire Wire Line
	2100 4500 2100 4600
Wire Wire Line
	2200 4400 2100 4400
Connection ~ 2100 4400
Wire Wire Line
	2100 4400 2100 4500
Wire Wire Line
	2200 4300 2100 4300
Connection ~ 2100 4300
Wire Wire Line
	2100 4300 2100 4400
Wire Wire Line
	2200 4200 2100 4200
Connection ~ 2100 4200
Wire Wire Line
	2100 4200 2100 4300
Wire Wire Line
	2200 4100 2100 4100
Connection ~ 2100 4100
Wire Wire Line
	2100 4100 2100 4200
Wire Wire Line
	2200 4000 2100 4000
Connection ~ 2100 4000
Wire Wire Line
	2100 4000 2100 4100
Wire Wire Line
	2200 3900 2100 3900
Connection ~ 2100 3900
Wire Wire Line
	2100 3900 2100 4000
Wire Wire Line
	2200 3800 2100 3800
Connection ~ 2100 3800
Wire Wire Line
	2100 3800 2100 3900
Wire Wire Line
	2200 3700 2100 3700
Connection ~ 2100 3700
Wire Wire Line
	2100 3700 2100 3800
Wire Wire Line
	2200 3600 2100 3600
Connection ~ 2100 3600
Wire Wire Line
	2100 3600 2100 3700
Wire Wire Line
	2200 3500 2100 3500
Connection ~ 2100 3500
Wire Wire Line
	2100 3500 2100 3600
Wire Wire Line
	2200 3400 2100 3400
Connection ~ 2100 3400
Wire Wire Line
	2100 3400 2100 3500
Wire Wire Line
	2200 3300 2100 3300
Connection ~ 2100 3300
Wire Wire Line
	2100 3300 2100 3400
Wire Wire Line
	2200 3200 2100 3200
Connection ~ 2100 3200
Wire Wire Line
	2100 3200 2100 3300
Wire Wire Line
	2200 3100 2100 3100
Connection ~ 2100 3100
Wire Wire Line
	2100 3100 2100 3200
Wire Wire Line
	2200 3000 2100 3000
Connection ~ 2100 3000
Wire Wire Line
	2100 3000 2100 3100
Wire Wire Line
	2200 2900 2100 2900
Connection ~ 2100 2900
Wire Wire Line
	2100 2900 2100 3000
Wire Wire Line
	2200 2800 2100 2800
Connection ~ 2100 2800
Wire Wire Line
	2100 2800 2100 2900
Wire Wire Line
	2200 2700 2100 2700
Connection ~ 2100 2700
Wire Wire Line
	2100 2700 2100 2800
Wire Wire Line
	2200 2600 2100 2600
Connection ~ 2100 2600
Wire Wire Line
	2100 2600 2100 2700
Wire Wire Line
	2200 2500 2100 2500
Connection ~ 2100 2500
Wire Wire Line
	2100 2500 2100 2600
Wire Wire Line
	2200 2400 2100 2400
Connection ~ 2100 2400
Wire Wire Line
	2100 2400 2100 2500
Wire Wire Line
	2200 2300 2100 2300
Connection ~ 2100 2300
Wire Wire Line
	2100 2300 2100 2400
Wire Wire Line
	2200 2200 2100 2200
Connection ~ 2100 2200
Wire Wire Line
	2100 2200 2100 2300
Wire Wire Line
	2200 2100 2100 2100
Connection ~ 2100 2100
Wire Wire Line
	2100 2100 2100 2200
Wire Wire Line
	2200 2000 2100 2000
Connection ~ 2100 2000
Wire Wire Line
	2100 2000 2100 2100
Wire Wire Line
	2200 1900 2100 1900
Connection ~ 2100 1900
Wire Wire Line
	2100 1900 2100 2000
Wire Wire Line
	2200 1800 2100 1800
Connection ~ 2100 1800
Wire Wire Line
	2100 1800 2100 1900
Wire Wire Line
	2200 1700 2100 1700
Connection ~ 2100 1700
Wire Wire Line
	2100 1700 2100 1800
Wire Wire Line
	2200 1600 2100 1600
Connection ~ 2100 1600
Wire Wire Line
	2100 1600 2100 1700
Wire Wire Line
	2200 1500 2100 1500
Connection ~ 2100 1500
Wire Wire Line
	2100 1500 2100 1600
Wire Wire Line
	2200 1400 2100 1400
Connection ~ 2100 1400
Wire Wire Line
	2100 1400 2100 1500
Wire Wire Line
	2200 1300 2100 1300
Connection ~ 2100 1300
Wire Wire Line
	2100 1300 2100 1400
Wire Wire Line
	4200 3900 4300 3900
Wire Wire Line
	4200 4000 4300 4000
Wire Wire Line
	4200 4100 4300 4100
Wire Wire Line
	4200 3700 4300 3700
Wire Wire Line
	4200 3600 4300 3600
Wire Wire Line
	4200 3500 4300 3500
Wire Wire Line
	4200 3300 4300 3300
Wire Wire Line
	4200 3200 4300 3200
Wire Wire Line
	4200 2800 4300 2800
Wire Wire Line
	4200 2900 4300 2900
Wire Wire Line
	4200 3000 4300 3000
Wire Wire Line
	4200 1200 4300 1200
Wire Wire Line
	4200 1300 4300 1300
Wire Wire Line
	4200 1400 4300 1400
Wire Wire Line
	4200 1500 4300 1500
Wire Wire Line
	4200 1600 4300 1600
Wire Wire Line
	4200 1700 4300 1700
Wire Wire Line
	4200 1800 4300 1800
Wire Wire Line
	4200 1900 4300 1900
Wire Wire Line
	4200 2000 4300 2000
Wire Wire Line
	4200 2100 4300 2100
Wire Wire Line
	4200 2300 4300 2300
Wire Wire Line
	4200 2400 4300 2400
Wire Wire Line
	4200 2500 4300 2500
Wire Wire Line
	4200 2600 4300 2600
Text Notes 2300 6900 0    50   ~ 0
Bank 0: 3V3 (config)\nBank 14: 3V3 (due to config)\nBank 34: 2V5 (LVDS)\nVCCINT: 1V0\nVCCBRAM: 1V0\nVCCAUX: 1V8
Wire Wire Line
	4300 1200 4300 1300
Connection ~ 4300 1300
Wire Wire Line
	4300 1300 4300 1400
Connection ~ 4300 1400
Wire Wire Line
	4300 1400 4300 1500
Connection ~ 4300 1500
Wire Wire Line
	4300 1500 4300 1600
Connection ~ 4300 1600
Wire Wire Line
	4300 1600 4300 1700
Connection ~ 4300 1700
Wire Wire Line
	4300 1700 4300 1800
Connection ~ 4300 1800
Wire Wire Line
	4300 1800 4300 1900
Connection ~ 4300 1900
Wire Wire Line
	4300 1900 4300 2000
Connection ~ 4300 2000
Wire Wire Line
	4300 2000 4300 2100
Wire Wire Line
	4300 2300 4300 2400
Connection ~ 4300 2400
Wire Wire Line
	4300 2400 4300 2500
Connection ~ 4300 2500
Wire Wire Line
	4300 2500 4300 2600
Wire Wire Line
	4300 2300 4400 2300
Connection ~ 4300 2300
Wire Wire Line
	4300 1200 4400 1200
Connection ~ 4300 1200
Wire Wire Line
	4300 2800 4300 2900
Connection ~ 4300 2900
Wire Wire Line
	4300 2900 4300 3000
Wire Wire Line
	4300 3200 4300 3300
Wire Wire Line
	4300 3500 4300 3600
Connection ~ 4300 3600
Wire Wire Line
	4300 3600 4300 3700
Wire Wire Line
	4300 3900 4300 4000
Connection ~ 4300 4000
Wire Wire Line
	4300 4000 4300 4100
$Comp
L power:+1V0 #PWR?
U 1 1 5C24BB34
P 4400 1200
F 0 "#PWR?" H 4400 1050 50  0001 C CNN
F 1 "+1V0" H 4415 1373 50  0000 C CNN
F 2 "" H 4400 1200 50  0001 C CNN
F 3 "" H 4400 1200 50  0001 C CNN
	1    4400 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 2800 4400 2800
Connection ~ 4300 2800
Wire Wire Line
	4300 3200 4400 3200
Connection ~ 4300 3200
Wire Wire Line
	4300 3500 4400 3500
Connection ~ 4300 3500
Wire Wire Line
	4300 3900 4400 3900
Connection ~ 4300 3900
$Comp
L power:+1V0 #PWR?
U 1 1 5C28C4FA
P 6600 1200
F 0 "#PWR?" H 6600 1050 50  0001 C CNN
F 1 "+1V0" H 6615 1373 50  0000 C CNN
F 2 "" H 6600 1200 50  0001 C CNN
F 3 "" H 6600 1200 50  0001 C CNN
	1    6600 1200
	1    0    0    -1  
$EndComp
$Comp
L power:+1V0 #PWR?
U 1 1 5C28C952
P 6600 2200
F 0 "#PWR?" H 6600 2050 50  0001 C CNN
F 1 "+1V0" H 6615 2373 50  0000 C CNN
F 2 "" H 6600 2200 50  0001 C CNN
F 3 "" H 6600 2200 50  0001 C CNN
	1    6600 2200
	1    0    0    -1  
$EndComp
$Comp
L power:+1V8 #PWR?
U 1 1 5C2938DC
P 4400 2300
F 0 "#PWR?" H 4400 2150 50  0001 C CNN
F 1 "+1V8" H 4415 2473 50  0000 C CNN
F 2 "" H 4400 2300 50  0001 C CNN
F 3 "" H 4400 2300 50  0001 C CNN
	1    4400 2300
	1    0    0    -1  
$EndComp
$Comp
L power:+1V8 #PWR?
U 1 1 5C293BBA
P 6600 3150
F 0 "#PWR?" H 6600 3000 50  0001 C CNN
F 1 "+1V8" H 6615 3323 50  0000 C CNN
F 2 "" H 6600 3150 50  0001 C CNN
F 3 "" H 6600 3150 50  0001 C CNN
	1    6600 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5C2F58D1
P 6600 5700
F 0 "C?" H 6715 5746 50  0000 L CNN
F 1 "47u" H 6715 5655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6638 5550 50  0001 C CNN
F 3 "~" H 6600 5700 50  0001 C CNN
	1    6600 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5C2F58D7
P 7100 5700
F 0 "C?" H 7215 5746 50  0000 L CNN
F 1 "4.7u" H 7215 5655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7138 5550 50  0001 C CNN
F 3 "~" H 7100 5700 50  0001 C CNN
	1    7100 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5C2F58DD
P 7600 5700
F 0 "C?" H 7715 5746 50  0000 L CNN
F 1 "4.7u" H 7715 5655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7638 5550 50  0001 C CNN
F 3 "~" H 7600 5700 50  0001 C CNN
	1    7600 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5C2F58E3
P 8100 5700
F 0 "C?" H 8215 5746 50  0000 L CNN
F 1 "0.47u" H 8215 5655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8138 5550 50  0001 C CNN
F 3 "~" H 8100 5700 50  0001 C CNN
	1    8100 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C2F58EF
P 6600 5950
F 0 "#PWR?" H 6600 5700 50  0001 C CNN
F 1 "GND" H 6605 5777 50  0000 C CNN
F 2 "" H 6600 5950 50  0001 C CNN
F 3 "" H 6600 5950 50  0001 C CNN
	1    6600 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 5550 6600 5500
Wire Wire Line
	6600 5500 7100 5500
Wire Wire Line
	7100 5500 7100 5550
Connection ~ 6600 5500
Wire Wire Line
	6600 5500 6600 5350
Wire Wire Line
	7100 5500 7600 5500
Wire Wire Line
	7600 5500 7600 5550
Connection ~ 7100 5500
Wire Wire Line
	7600 5500 8100 5500
Wire Wire Line
	8100 5500 8100 5550
Connection ~ 7600 5500
Wire Wire Line
	8100 5500 8600 5500
Wire Wire Line
	8600 5500 8600 5550
Connection ~ 8100 5500
Wire Wire Line
	8600 5500 9100 5500
Wire Wire Line
	9100 5500 9100 5550
Connection ~ 8600 5500
Wire Wire Line
	6600 5850 6600 5900
Wire Wire Line
	7100 5850 7100 5900
Wire Wire Line
	7100 5900 6600 5900
Connection ~ 6600 5900
Wire Wire Line
	6600 5900 6600 5950
Wire Wire Line
	7100 5900 7600 5900
Wire Wire Line
	7600 5900 7600 5850
Connection ~ 7100 5900
Wire Wire Line
	7600 5900 8100 5900
Wire Wire Line
	8100 5900 8100 5850
Connection ~ 7600 5900
Wire Wire Line
	8100 5900 8600 5900
Wire Wire Line
	8600 5900 8600 5850
Connection ~ 8100 5900
Wire Wire Line
	8600 5900 9100 5900
Wire Wire Line
	9100 5900 9100 5850
Connection ~ 8600 5900
Text Notes 6200 5700 0    50   ~ 0
VCCO34
$Comp
L Device:C C?
U 1 1 5C30872E
P 9300 3250
F 0 "C?" H 9415 3296 50  0000 L CNN
F 1 "47u" H 9415 3205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9338 3100 50  0001 C CNN
F 3 "~" H 9300 3250 50  0001 C CNN
	1    9300 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5C308746
P 9750 3250
F 0 "C?" H 9865 3296 50  0000 L CNN
F 1 "0.47u" H 9865 3205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9788 3100 50  0001 C CNN
F 3 "~" H 9750 3250 50  0001 C CNN
	1    9750 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C30874C
P 9300 3500
F 0 "#PWR?" H 9300 3250 50  0001 C CNN
F 1 "GND" H 9305 3327 50  0000 C CNN
F 2 "" H 9300 3500 50  0001 C CNN
F 3 "" H 9300 3500 50  0001 C CNN
	1    9300 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 3050 9750 3100
Wire Wire Line
	9750 3050 10250 3050
Wire Wire Line
	10250 3050 10250 3100
Wire Wire Line
	9750 3450 9750 3400
Wire Wire Line
	9750 3450 10250 3450
Wire Wire Line
	10250 3450 10250 3400
$Comp
L Device:C C?
U 1 1 5C308774
P 10250 3250
F 0 "C?" H 10365 3296 50  0000 L CNN
F 1 "0.47u" H 10365 3205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 10288 3100 50  0001 C CNN
F 3 "~" H 10250 3250 50  0001 C CNN
	1    10250 3250
	1    0    0    -1  
$EndComp
Text Notes 8900 3250 0    50   ~ 0
VCCO0
Wire Wire Line
	9300 3400 9300 3450
Wire Wire Line
	9750 3050 9300 3050
Wire Wire Line
	9300 2900 9300 3050
Connection ~ 9750 3050
Connection ~ 9300 3050
Wire Wire Line
	9300 3050 9300 3100
Wire Wire Line
	9750 3450 9300 3450
Connection ~ 9750 3450
Connection ~ 9300 3450
Wire Wire Line
	9300 3450 9300 3500
$Comp
L power:+3V3 #PWR?
U 1 1 5C3BCB32
P 9300 2900
F 0 "#PWR?" H 9300 2750 50  0001 C CNN
F 1 "+3V3" H 9315 3073 50  0000 C CNN
F 2 "" H 9300 2900 50  0001 C CNN
F 3 "" H 9300 2900 50  0001 C CNN
	1    9300 2900
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5C3BCF52
P 6600 4250
F 0 "#PWR?" H 6600 4100 50  0001 C CNN
F 1 "+3V3" H 6615 4423 50  0000 C CNN
F 2 "" H 6600 4250 50  0001 C CNN
F 3 "" H 6600 4250 50  0001 C CNN
	1    6600 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C3E13B9
P 2100 6200
F 0 "#PWR?" H 2100 5950 50  0001 C CNN
F 1 "GND" H 2105 6027 50  0000 C CNN
F 2 "" H 2100 6200 50  0001 C CNN
F 3 "" H 2100 6200 50  0001 C CNN
	1    2100 6200
	1    0    0    -1  
$EndComp
$Comp
L power:+1V0 #PWR?
U 1 1 5C3E1A07
P 4400 2800
F 0 "#PWR?" H 4400 2650 50  0001 C CNN
F 1 "+1V0" H 4415 2973 50  0000 C CNN
F 2 "" H 4400 2800 50  0001 C CNN
F 3 "" H 4400 2800 50  0001 C CNN
	1    4400 2800
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5C3E1DBA
P 4400 3200
F 0 "#PWR?" H 4400 3050 50  0001 C CNN
F 1 "+3V3" H 4415 3373 50  0000 C CNN
F 2 "" H 4400 3200 50  0001 C CNN
F 3 "" H 4400 3200 50  0001 C CNN
	1    4400 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5C3E1F96
P 4400 3500
F 0 "#PWR?" H 4400 3350 50  0001 C CNN
F 1 "+3V3" H 4415 3673 50  0000 C CNN
F 2 "" H 4400 3500 50  0001 C CNN
F 3 "" H 4400 3500 50  0001 C CNN
	1    4400 3500
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5C42A22F
P 6600 5350
F 0 "#PWR?" H 6600 5200 50  0001 C CNN
F 1 "+3V3" H 6615 5523 50  0000 C CNN
F 2 "" H 6600 5350 50  0001 C CNN
F 3 "" H 6600 5350 50  0001 C CNN
	1    6600 5350
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5C42A806
P 4400 3900
F 0 "#PWR?" H 4400 3750 50  0001 C CNN
F 1 "+3V3" H 4415 4073 50  0000 C CNN
F 2 "" H 4400 3900 50  0001 C CNN
F 3 "" H 4400 3900 50  0001 C CNN
	1    4400 3900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
