EESchema Schematic File Version 4
LIBS:inverter-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Transistor_IGBT:IRG4PF50W Q1
U 1 1 5BCAB7CC
P 3250 2650
F 0 "Q1" H 3441 2696 50  0000 L CNN
F 1 "IRG4PF50W" H 3441 2605 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-247-3_Vertical" H 3450 2575 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irg4pf50w.pdf" H 3250 2650 50  0001 L CNN
	1    3250 2650
	1    0    0    -1  
$EndComp
$Comp
L Transistor_IGBT:IRG4PF50W Q2
U 1 1 5BCAB99A
P 3250 3500
F 0 "Q2" H 3441 3546 50  0000 L CNN
F 1 "IRG4PF50W" H 3441 3455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-247-3_Vertical" H 3450 3425 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irg4pf50w.pdf" H 3250 3500 50  0001 L CNN
	1    3250 3500
	1    0    0    -1  
$EndComp
$Comp
L Transistor_IGBT:IRG4PF50W Q4
U 1 1 5BCABA1D
P 4800 3500
F 0 "Q4" H 4991 3546 50  0000 L CNN
F 1 "IRG4PF50W" H 4991 3455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-247-3_Vertical" H 5000 3425 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irg4pf50w.pdf" H 4800 3500 50  0001 L CNN
	1    4800 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5BCABA6A
P 2800 3500
F 0 "R3" V 2900 3700 50  0000 C CNN
F 1 "4.7" V 2700 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 2730 3500 50  0001 C CNN
F 3 "~" H 2800 3500 50  0001 C CNN
	1    2800 3500
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5BCABB3F
P 2800 2650
F 0 "R1" V 2850 2850 50  0000 C CNN
F 1 "4.7" V 2700 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 2730 2650 50  0001 C CNN
F 3 "~" H 2800 2650 50  0001 C CNN
	1    2800 2650
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5BCABBE4
P 2800 3000
F 0 "R2" V 2593 3000 50  0000 C CNN
F 1 "1" V 2684 3000 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 2730 3000 50  0001 C CNN
F 3 "~" H 2800 3000 50  0001 C CNN
	1    2800 3000
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5BCABC3D
P 2800 3850
F 0 "R4" V 2593 3850 50  0000 C CNN
F 1 "1" V 2684 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 2730 3850 50  0001 C CNN
F 3 "~" H 2800 3850 50  0001 C CNN
	1    2800 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5BCABD54
P 4350 2650
F 0 "R5" V 4250 2900 50  0000 C CNN
F 1 "4.7" V 4400 2800 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 4280 2650 50  0001 C CNN
F 3 "~" H 4350 2650 50  0001 C CNN
	1    4350 2650
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5BCABE1F
P 4350 3500
F 0 "R7" V 4150 3750 50  0000 C CNN
F 1 "4.7" V 4250 3700 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 4280 3500 50  0001 C CNN
F 3 "~" H 4350 3500 50  0001 C CNN
	1    4350 3500
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5BCABE84
P 4350 3850
F 0 "R8" V 4143 3850 50  0000 C CNN
F 1 "1" V 4234 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 4280 3850 50  0001 C CNN
F 3 "~" H 4350 3850 50  0001 C CNN
	1    4350 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5BCABEF1
P 4350 3000
F 0 "R6" V 4143 3000 50  0000 C CNN
F 1 "1" V 4234 3000 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 4280 3000 50  0001 C CNN
F 3 "~" H 4350 3000 50  0001 C CNN
	1    4350 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	3350 2450 3350 2350
Wire Wire Line
	3350 2350 4150 2350
Wire Wire Line
	4900 2350 4900 2450
Wire Wire Line
	4500 2650 4600 2650
Wire Wire Line
	4500 3000 4900 3000
Wire Wire Line
	4900 3000 4900 2850
Wire Wire Line
	4900 3000 4900 3200
Connection ~ 4900 3000
Wire Wire Line
	4200 3000 4100 3000
Wire Wire Line
	4200 2650 4100 2650
Wire Wire Line
	2650 3000 2550 3000
Wire Wire Line
	2950 3000 3350 3000
Wire Wire Line
	3350 3000 3350 2850
Wire Wire Line
	3350 3000 3350 3200
Connection ~ 3350 3000
Wire Wire Line
	3050 3500 2950 3500
Wire Wire Line
	3350 3700 3350 3850
Wire Wire Line
	3350 3850 2950 3850
Wire Wire Line
	4500 3500 4600 3500
Wire Wire Line
	4500 3850 4900 3850
Wire Wire Line
	4900 3850 4900 3700
Wire Wire Line
	3350 3850 3350 4000
Wire Wire Line
	3350 4000 4150 4000
Wire Wire Line
	4900 4000 4900 3850
Connection ~ 3350 3850
Connection ~ 4900 3850
Wire Wire Line
	4150 2350 4150 2250
Connection ~ 4150 2350
Wire Wire Line
	4150 2350 4900 2350
Wire Wire Line
	4150 4000 4150 4100
Connection ~ 4150 4000
Wire Wire Line
	4150 4000 4900 4000
Wire Wire Line
	3350 3200 4900 3200
Connection ~ 3350 3200
Wire Wire Line
	3350 3200 3350 3300
Connection ~ 4900 3200
Wire Wire Line
	4900 3200 4900 3300
Wire Wire Line
	4900 3200 5050 3200
Text Label 5050 3200 0    50   ~ 0
VSW+
Text Label 4150 2250 0    50   ~ 0
VIN+
Text Label 4150 4100 0    50   ~ 0
VIN-
Wire Wire Line
	2650 3500 2550 3500
Wire Wire Line
	2650 3850 2550 3850
Wire Wire Line
	4200 3500 4100 3500
Wire Wire Line
	4200 3850 4100 3850
Text Label 2550 2650 2    50   ~ 0
A
Text Label 4100 2650 2    50   ~ 0
A
Text Label 2550 3000 2    50   ~ 0
B
Text Label 4100 3000 2    50   ~ 0
B
Text Label 2550 3500 2    50   ~ 0
C
Text Label 4100 3500 2    50   ~ 0
C
Text Label 2550 3850 2    50   ~ 0
D
Text Label 4100 3850 2    50   ~ 0
D
$Comp
L Device:C C2
U 1 1 5BD11E82
P 3550 1250
F 0 "C2" H 3665 1296 50  0000 L CNN
F 1 "B32674D6225K000" H 3665 1205 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L31.5mm_W17.0mm_P27.50mm_MKS4" H 3588 1100 50  0001 C CNN
F 3 "~" H 3550 1250 50  0001 C CNN
	1    3550 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5BD12149
P 4550 1250
F 0 "C3" H 4665 1296 50  0000 L CNN
F 1 "B32674D6225K000" H 4665 1205 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L31.5mm_W17.0mm_P27.50mm_MKS4" H 4588 1100 50  0001 C CNN
F 3 "~" H 4550 1250 50  0001 C CNN
	1    4550 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5BD121BF
P 5550 1250
F 0 "C4" H 5665 1296 50  0000 L CNN
F 1 "B32674D6225K000" H 5665 1205 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L31.5mm_W17.0mm_P27.50mm_MKS4" H 5588 1100 50  0001 C CNN
F 3 "~" H 5550 1250 50  0001 C CNN
	1    5550 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5BD12234
P 2550 1250
F 0 "C1" H 2665 1296 50  0000 L CNN
F 1 "B32674D6225K000" H 2665 1205 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L31.5mm_W17.0mm_P27.50mm_MKS4" H 2588 1100 50  0001 C CNN
F 3 "~" H 2550 1250 50  0001 C CNN
	1    2550 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 1100 3550 1100
Wire Wire Line
	3550 1100 4550 1100
Connection ~ 3550 1100
Wire Wire Line
	4550 1100 5550 1100
Connection ~ 4550 1100
Wire Wire Line
	5550 1400 4550 1400
Wire Wire Line
	4550 1400 3550 1400
Connection ~ 4550 1400
Wire Wire Line
	3550 1400 2550 1400
Connection ~ 3550 1400
Wire Wire Line
	2550 1400 2550 1500
Connection ~ 2550 1400
Wire Wire Line
	2550 1100 2550 1000
Connection ~ 2550 1100
Text Label 2550 1000 0    50   ~ 0
VIN+
Text Label 2550 1500 0    50   ~ 0
VIN-
$Comp
L Transistor_IGBT:IRG4PF50W Q5
U 1 1 5BD16522
P 7300 2700
F 0 "Q5" H 7491 2746 50  0000 L CNN
F 1 "IRG4PF50W" H 7491 2655 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-247-3_Vertical" H 7500 2625 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irg4pf50w.pdf" H 7300 2700 50  0001 L CNN
	1    7300 2700
	1    0    0    -1  
$EndComp
$Comp
L Transistor_IGBT:IRG4PF50W Q7
U 1 1 5BD16528
P 8850 2700
F 0 "Q7" H 9041 2746 50  0000 L CNN
F 1 "IRG4PF50W" H 9041 2655 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-247-3_Vertical" H 9050 2625 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irg4pf50w.pdf" H 8850 2700 50  0001 L CNN
	1    8850 2700
	1    0    0    -1  
$EndComp
$Comp
L Transistor_IGBT:IRG4PF50W Q6
U 1 1 5BD1652E
P 7300 3550
F 0 "Q6" H 7491 3596 50  0000 L CNN
F 1 "IRG4PF50W" H 7491 3505 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-247-3_Vertical" H 7500 3475 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irg4pf50w.pdf" H 7300 3550 50  0001 L CNN
	1    7300 3550
	1    0    0    -1  
$EndComp
$Comp
L Transistor_IGBT:IRG4PF50W Q8
U 1 1 5BD16534
P 8850 3550
F 0 "Q8" H 9041 3596 50  0000 L CNN
F 1 "IRG4PF50W" H 9041 3505 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-247-3_Vertical" H 9050 3475 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irg4pf50w.pdf" H 8850 3550 50  0001 L CNN
	1    8850 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 5BD1653A
P 6850 3550
F 0 "R11" V 6700 3850 50  0000 C CNN
F 1 "4.7" V 6900 3750 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6780 3550 50  0001 C CNN
F 3 "~" H 6850 3550 50  0001 C CNN
	1    6850 3550
	0    1    1    0   
$EndComp
$Comp
L Device:R R9
U 1 1 5BD16540
P 6850 2700
F 0 "R9" V 7000 2900 50  0000 C CNN
F 1 "4.7" V 6900 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6780 2700 50  0001 C CNN
F 3 "~" H 6850 2700 50  0001 C CNN
	1    6850 2700
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 5BD16546
P 6850 3050
F 0 "R10" V 6643 3050 50  0000 C CNN
F 1 "1" V 6734 3050 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6780 3050 50  0001 C CNN
F 3 "~" H 6850 3050 50  0001 C CNN
	1    6850 3050
	0    1    1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 5BD1654C
P 6850 3900
F 0 "R12" V 6643 3900 50  0000 C CNN
F 1 "1" V 6734 3900 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6780 3900 50  0001 C CNN
F 3 "~" H 6850 3900 50  0001 C CNN
	1    6850 3900
	0    1    1    0   
$EndComp
$Comp
L Device:R R13
U 1 1 5BD16552
P 8400 2700
F 0 "R13" V 8200 2950 50  0000 C CNN
F 1 "4.7" V 8300 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 8330 2700 50  0001 C CNN
F 3 "~" H 8400 2700 50  0001 C CNN
	1    8400 2700
	0    1    1    0   
$EndComp
$Comp
L Device:R R15
U 1 1 5BD16558
P 8400 3550
F 0 "R15" V 8300 3800 50  0000 C CNN
F 1 "4.7" V 8200 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 8330 3550 50  0001 C CNN
F 3 "~" H 8400 3550 50  0001 C CNN
	1    8400 3550
	0    1    1    0   
$EndComp
$Comp
L Device:R R16
U 1 1 5BD1655E
P 8400 3900
F 0 "R16" V 8193 3900 50  0000 C CNN
F 1 "1" V 8284 3900 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 8330 3900 50  0001 C CNN
F 3 "~" H 8400 3900 50  0001 C CNN
	1    8400 3900
	0    1    1    0   
$EndComp
$Comp
L Device:R R14
U 1 1 5BD16564
P 8400 3050
F 0 "R14" V 8193 3050 50  0000 C CNN
F 1 "1" V 8284 3050 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 8330 3050 50  0001 C CNN
F 3 "~" H 8400 3050 50  0001 C CNN
	1    8400 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	7000 2700 7100 2700
Wire Wire Line
	7400 2500 7400 2400
Wire Wire Line
	7400 2400 8200 2400
Wire Wire Line
	8950 2400 8950 2500
Wire Wire Line
	8550 2700 8650 2700
Wire Wire Line
	8550 3050 8950 3050
Wire Wire Line
	8950 3050 8950 2900
Wire Wire Line
	8950 3050 8950 3250
Connection ~ 8950 3050
Wire Wire Line
	8250 3050 8150 3050
Wire Wire Line
	8250 2700 8150 2700
Wire Wire Line
	6700 2700 6600 2700
Wire Wire Line
	6700 3050 6600 3050
Wire Wire Line
	7000 3050 7400 3050
Wire Wire Line
	7400 3050 7400 2900
Wire Wire Line
	7400 3050 7400 3250
Connection ~ 7400 3050
Wire Wire Line
	7100 3550 7000 3550
Wire Wire Line
	7400 3750 7400 3900
Wire Wire Line
	7400 3900 7000 3900
Wire Wire Line
	8550 3550 8650 3550
Wire Wire Line
	8550 3900 8950 3900
Wire Wire Line
	8950 3900 8950 3750
Wire Wire Line
	7400 3900 7400 4050
Wire Wire Line
	7400 4050 8200 4050
Wire Wire Line
	8950 4050 8950 3900
Connection ~ 7400 3900
Connection ~ 8950 3900
Wire Wire Line
	8200 2400 8200 2300
Connection ~ 8200 2400
Wire Wire Line
	8200 2400 8950 2400
Wire Wire Line
	8200 4050 8200 4150
Connection ~ 8200 4050
Wire Wire Line
	8200 4050 8950 4050
Wire Wire Line
	7400 3250 8950 3250
Connection ~ 7400 3250
Wire Wire Line
	7400 3250 7400 3350
Connection ~ 8950 3250
Wire Wire Line
	8950 3250 8950 3350
Wire Wire Line
	8950 3250 9100 3250
Text Label 9100 3250 0    50   ~ 0
VSW-
Text Label 8200 2300 0    50   ~ 0
VIN+
Text Label 8200 4150 0    50   ~ 0
VIN-
Wire Wire Line
	6700 3550 6600 3550
Wire Wire Line
	6700 3900 6600 3900
Wire Wire Line
	8250 3550 8150 3550
Wire Wire Line
	8250 3900 8150 3900
Text Label 6600 2700 2    50   ~ 0
E
Text Label 8150 2700 2    50   ~ 0
E
Text Label 6600 3050 2    50   ~ 0
F
Text Label 8150 3050 2    50   ~ 0
F
Text Label 6600 3550 2    50   ~ 0
G
Text Label 8150 3550 2    50   ~ 0
G
Text Label 6600 3900 2    50   ~ 0
H
Text Label 8150 3900 2    50   ~ 0
H
$Comp
L Connector:Conn_01x01_Female J1
U 1 1 5BD188D8
P 2200 1100
F 0 "J1" H 2094 875 50  0000 C CNN
F 1 "Conn_01x01_Female" H 2094 966 50  0000 C CNN
F 2 "wbraun_smd:7693-term" H 2200 1100 50  0001 C CNN
F 3 "~" H 2200 1100 50  0001 C CNN
	1    2200 1100
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Female J2
U 1 1 5BD18BF3
P 2200 1400
F 0 "J2" H 2094 1175 50  0000 C CNN
F 1 "Conn_01x01_Female" H 2094 1266 50  0000 C CNN
F 2 "wbraun_smd:7693-term" H 2200 1400 50  0001 C CNN
F 3 "~" H 2200 1400 50  0001 C CNN
	1    2200 1400
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Female J3
U 1 1 5BD18E49
P 7600 950
F 0 "J3" H 7494 725 50  0000 C CNN
F 1 "Conn_01x01_Female" H 7494 816 50  0000 C CNN
F 2 "wbraun_smd:7693-term" H 7600 950 50  0001 C CNN
F 3 "~" H 7600 950 50  0001 C CNN
	1    7600 950 
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Female J4
U 1 1 5BD18FD6
P 7600 1250
F 0 "J4" H 7494 1025 50  0000 C CNN
F 1 "Conn_01x01_Female" H 7494 1116 50  0000 C CNN
F 2 "wbraun_smd:7693-term" H 7600 1250 50  0001 C CNN
F 3 "~" H 7600 1250 50  0001 C CNN
	1    7600 1250
	-1   0    0    1   
$EndComp
Wire Wire Line
	7800 950  8050 950 
Wire Wire Line
	7800 1250 8050 1250
Wire Wire Line
	2400 1100 2550 1100
Wire Wire Line
	2400 1400 2550 1400
Text Label 8050 1250 0    50   ~ 0
VSW-
Text Label 8050 950  0    50   ~ 0
VSW+
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 5BD206E3
P 1100 2550
F 0 "J5" H 1206 2728 50  0000 C CNN
F 1 "Conn_01x02_Male" H 1206 2637 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1100 2550 50  0001 C CNN
F 3 "~" H 1100 2550 50  0001 C CNN
	1    1100 2550
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J6
U 1 1 5BD20852
P 1100 2950
F 0 "J6" H 1206 3128 50  0000 C CNN
F 1 "Conn_01x02_Male" H 1206 3037 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1100 2950 50  0001 C CNN
F 3 "~" H 1100 2950 50  0001 C CNN
	1    1100 2950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J7
U 1 1 5BD209C8
P 1100 3350
F 0 "J7" H 1206 3528 50  0000 C CNN
F 1 "Conn_01x02_Male" H 1206 3437 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1100 3350 50  0001 C CNN
F 3 "~" H 1100 3350 50  0001 C CNN
	1    1100 3350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J8
U 1 1 5BD20AA5
P 1100 3750
F 0 "J8" H 1206 3928 50  0000 C CNN
F 1 "Conn_01x02_Male" H 1206 3837 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1100 3750 50  0001 C CNN
F 3 "~" H 1100 3750 50  0001 C CNN
	1    1100 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 2550 1400 2550
Wire Wire Line
	1300 2650 1400 2650
Wire Wire Line
	1300 2950 1400 2950
Wire Wire Line
	1300 3050 1400 3050
Wire Wire Line
	1300 3350 1400 3350
Wire Wire Line
	1300 3450 1400 3450
Wire Wire Line
	1300 3750 1400 3750
Wire Wire Line
	1300 3850 1400 3850
Text Label 1400 2550 0    50   ~ 0
A
Text Label 1400 2650 0    50   ~ 0
B
Text Label 1400 2950 0    50   ~ 0
C
Text Label 1400 3050 0    50   ~ 0
D
Text Label 1400 3350 0    50   ~ 0
E
Text Label 1400 3450 0    50   ~ 0
F
Text Label 1400 3750 0    50   ~ 0
G
Text Label 1400 3850 0    50   ~ 0
H
$Comp
L Device:D D1
U 1 1 5BD32EC9
P 2800 2500
F 0 "D1" H 2800 2716 50  0000 C CNN
F 1 "SS14FL" H 2800 2625 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 2800 2500 50  0001 C CNN
F 3 "~" H 2800 2500 50  0001 C CNN
	1    2800 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:D D2
U 1 1 5BD39C40
P 2800 3350
F 0 "D2" H 2800 3566 50  0000 C CNN
F 1 "SS14FL" H 2800 3475 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 2800 3350 50  0001 C CNN
F 3 "~" H 2800 3350 50  0001 C CNN
	1    2800 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:D D4
U 1 1 5BD3A16C
P 4350 3350
F 0 "D4" H 4350 3566 50  0000 C CNN
F 1 "SS14FL" H 4350 3475 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 4350 3350 50  0001 C CNN
F 3 "~" H 4350 3350 50  0001 C CNN
	1    4350 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:D D3
U 1 1 5BD3A407
P 4350 2500
F 0 "D3" H 4350 2716 50  0000 C CNN
F 1 "SS14FL" H 4350 2625 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 4350 2500 50  0001 C CNN
F 3 "~" H 4350 2500 50  0001 C CNN
	1    4350 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:D D5
U 1 1 5BD3A5FD
P 6850 2550
F 0 "D5" H 6850 2766 50  0000 C CNN
F 1 "SS14FL" H 6850 2675 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 6850 2550 50  0001 C CNN
F 3 "~" H 6850 2550 50  0001 C CNN
	1    6850 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:D D6
U 1 1 5BD3A76B
P 6850 3400
F 0 "D6" H 6850 3616 50  0000 C CNN
F 1 "SS14FL" H 6850 3525 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 6850 3400 50  0001 C CNN
F 3 "~" H 6850 3400 50  0001 C CNN
	1    6850 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:D D8
U 1 1 5BD3AAFF
P 8400 3400
F 0 "D8" H 8400 3616 50  0000 C CNN
F 1 "SS14FL" H 8400 3525 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 8400 3400 50  0001 C CNN
F 3 "~" H 8400 3400 50  0001 C CNN
	1    8400 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:D D7
U 1 1 5BD3ACE1
P 8400 2550
F 0 "D7" H 8400 2766 50  0000 C CNN
F 1 "SS14FL" H 8400 2675 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 8400 2550 50  0001 C CNN
F 3 "~" H 8400 2550 50  0001 C CNN
	1    8400 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 2650 3050 2650
Wire Wire Line
	2550 2650 2650 2650
Wire Wire Line
	2950 2500 2950 2650
Connection ~ 2950 2650
Wire Wire Line
	2650 2500 2650 2650
Connection ~ 2650 2650
Wire Wire Line
	2950 3350 2950 3500
Connection ~ 2950 3500
Wire Wire Line
	2650 3350 2650 3500
Connection ~ 2650 3500
Wire Wire Line
	7000 2550 7000 2700
Connection ~ 7000 2700
Wire Wire Line
	6700 2550 6700 2700
Connection ~ 6700 2700
Wire Wire Line
	7000 3400 7000 3550
Connection ~ 7000 3550
Wire Wire Line
	6700 3400 6700 3550
Connection ~ 6700 3550
Wire Wire Line
	8550 2550 8550 2700
Connection ~ 8550 2700
Wire Wire Line
	8250 2550 8250 2700
Connection ~ 8250 2700
Wire Wire Line
	8250 3400 8250 3550
Connection ~ 8250 3550
Wire Wire Line
	8550 3400 8550 3550
Connection ~ 8550 3550
$Comp
L Transistor_IGBT:IRG4PF50W Q3
U 1 1 5BCAB91A
P 4800 2650
F 0 "Q3" H 4991 2696 50  0000 L CNN
F 1 "IRG4PF50W" H 4991 2605 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-247-3_Vertical" H 5000 2575 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irg4pf50w.pdf" H 4800 2650 50  0001 L CNN
	1    4800 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2500 4500 2650
Connection ~ 4500 2650
Wire Wire Line
	4200 2500 4200 2650
Connection ~ 4200 2650
Wire Wire Line
	4500 3350 4500 3500
Connection ~ 4500 3500
Wire Wire Line
	4200 3350 4200 3500
Connection ~ 4200 3500
$Comp
L wbraun_ic_lib:mounting-hole-nc J1003
U 1 1 5C478DFD
P 3800 4900
F 0 "J1003" H 4078 4953 60  0000 L CNN
F 1 "mounting-hole-nc" H 4078 4847 60  0000 L CNN
F 2 "wbraun_smd:M3-through-hole" H 3800 4900 60  0001 C CNN
F 3 "" H 3800 4900 60  0001 C CNN
	1    3800 4900
	1    0    0    -1  
$EndComp
$Comp
L wbraun_ic_lib:mounting-hole-nc J1001
U 1 1 5C479324
P 3050 4900
F 0 "J1001" H 3328 4953 60  0000 L CNN
F 1 "mounting-hole-nc" H 3328 4847 60  0000 L CNN
F 2 "wbraun_smd:M3-through-hole" H 3050 4900 60  0001 C CNN
F 3 "" H 3050 4900 60  0001 C CNN
	1    3050 4900
	1    0    0    -1  
$EndComp
$Comp
L wbraun_ic_lib:mounting-hole-nc J1002
U 1 1 5C479727
P 3050 5450
F 0 "J1002" H 3328 5503 60  0000 L CNN
F 1 "mounting-hole-nc" H 3328 5397 60  0000 L CNN
F 2 "wbraun_smd:M3-through-hole" H 3050 5450 60  0001 C CNN
F 3 "" H 3050 5450 60  0001 C CNN
	1    3050 5450
	1    0    0    -1  
$EndComp
$Comp
L wbraun_ic_lib:mounting-hole-nc J1004
U 1 1 5C479B0B
P 3800 5450
F 0 "J1004" H 4078 5503 60  0000 L CNN
F 1 "mounting-hole-nc" H 4078 5397 60  0000 L CNN
F 2 "wbraun_smd:M3-through-hole" H 3800 5450 60  0001 C CNN
F 3 "" H 3800 5450 60  0001 C CNN
	1    3800 5450
	1    0    0    -1  
$EndComp
$Comp
L wbraun_ic_lib:mounting-hole-grounded J1005
U 1 1 5C47B16E
P 6050 5600
F 0 "J1005" H 6328 5547 60  0000 L CNN
F 1 "mounting-hole-grounded" H 6328 5441 60  0000 L CNN
F 2 "wbraun_smd:M3-tight-fit-pan-head" H 6050 5600 60  0001 C CNN
F 3 "" H 6050 5600 60  0001 C CNN
	1    6050 5600
	1    0    0    -1  
$EndComp
$Comp
L wbraun_ic_lib:mounting-hole-grounded J1006
U 1 1 5C47B65D
P 7650 5600
F 0 "J1006" H 7928 5547 60  0000 L CNN
F 1 "mounting-hole-grounded" H 7928 5441 60  0000 L CNN
F 2 "wbraun_smd:M3-tight-fit-pan-head" H 7650 5600 60  0001 C CNN
F 3 "" H 7650 5600 60  0001 C CNN
	1    7650 5600
	1    0    0    -1  
$EndComp
$Comp
L wbraun_ic_lib:mounting-hole-grounded J1007
U 1 1 5C47BD2D
P 8700 5600
F 0 "J1007" H 8978 5547 60  0000 L CNN
F 1 "mounting-hole-grounded" H 8978 5441 60  0000 L CNN
F 2 "wbraun_smd:M3-tight-fit-pan-head" H 8700 5600 60  0001 C CNN
F 3 "" H 8700 5600 60  0001 C CNN
	1    8700 5600
	1    0    0    -1  
$EndComp
$Comp
L wbraun_ic_lib:mounting-hole-grounded J1008
U 1 1 5C47BFA8
P 9600 5600
F 0 "J1008" H 9878 5547 60  0000 L CNN
F 1 "mounting-hole-grounded" H 9878 5441 60  0000 L CNN
F 2 "wbraun_smd:M3-tight-fit-pan-head" H 9600 5600 60  0001 C CNN
F 3 "" H 9600 5600 60  0001 C CNN
	1    9600 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 6050 6050 6150
Wire Wire Line
	7650 6050 7650 6150
Wire Wire Line
	8700 6050 8700 6150
Wire Wire Line
	9600 6050 9600 6150
Text Label 6050 6150 0    50   ~ 0
VSW+
Text Label 7650 6150 0    50   ~ 0
VSW-
Text Label 8700 6150 0    50   ~ 0
VIN+
Text Label 9600 6150 0    50   ~ 0
VIN-
$EndSCHEMATC
