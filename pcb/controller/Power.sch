EESchema Schematic File Version 4
LIBS:controller-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 6
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
L Device:EMI_Filter_CommonMode FL?
U 1 1 5C45A21F
P 2550 2200
F 0 "FL?" H 2550 2478 50  0000 C CNN
F 1 "EMI_Filter_CommonMode" H 2550 2387 50  0000 C CNN
F 2 "" V 2550 2240 50  0000 C CNN
F 3 "~" V 2550 2240 50  0000 C CNN
	1    2550 2200
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J?
U 1 1 5C45A3A4
P 1450 2100
F 0 "J?" H 1344 2285 50  0000 C CNN
F 1 "Conn_01x02_Female" H 1344 2194 50  0000 C CNN
F 2 "" H 1450 2100 50  0001 C CNN
F 3 "~" H 1450 2100 50  0001 C CNN
	1    1450 2100
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5C45A46A
P 3300 2200
F 0 "C?" H 3415 2246 50  0000 L CNN
F 1 "C" H 3415 2155 50  0000 L CNN
F 2 "" H 3338 2050 50  0001 C CNN
F 3 "~" H 3300 2200 50  0001 C CNN
	1    3300 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C?
U 1 1 5C45A4F3
P 3700 2200
F 0 "C?" H 3815 2246 50  0000 L CNN
F 1 "CP1" H 3815 2155 50  0000 L CNN
F 2 "" H 3700 2200 50  0001 C CNN
F 3 "~" H 3700 2200 50  0001 C CNN
	1    3700 2200
	1    0    0    -1  
$EndComp
Text Notes 1750 5700 0    50   ~ 0
Power Rails:\nFPGA 1V: 0.8A\nFPGA 1V8: 0.1A\nFPGA 3V3: 0.2A\nAnalog 1V8 (ADC): 0.1A\nAnalog 3V3: 0.05\nGate Drive: 24V 1A\n
$EndSCHEMATC
