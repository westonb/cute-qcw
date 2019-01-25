EESchema Schematic File Version 4
LIBS:power-cache
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
L Connector:Conn_01x04_Female J1002
U 1 1 5C48201E
P 2050 2000
F 0 "J1002" H 1944 2285 50  0000 C CNN
F 1 "Conn_01x04_Female" H 1944 2194 50  0000 C CNN
F 2 "wbraun_smd:Terminal-block-plug_4x1_3.5mm-pitch" H 2050 2000 50  0001 C CNN
F 3 "~" H 2050 2000 50  0001 C CNN
	1    2050 2000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2250 1900 2350 1900
Wire Wire Line
	2250 2000 2350 2000
Wire Wire Line
	2250 2100 2350 2100
Wire Wire Line
	2250 2200 2350 2200
$Comp
L Device:CP1 C1001
U 1 1 5C483287
P 7650 3850
F 0 "C1001" H 7765 3896 50  0000 L CNN
F 1 "CP1" H 7765 3805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D25.0mm_P10.00mm_SnapIn" H 7650 3850 50  0001 C CNN
F 3 "~" H 7650 3850 50  0001 C CNN
	1    7650 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:D_x2_Serial_KCA D1001
U 1 1 5C4834DD
P 7150 4050
F 0 "D1001" H 7150 4266 50  0000 C CNN
F 1 "D_x2_Serial_KCA" H 7150 4175 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-247-3_Vertical" H 7150 4050 50  0001 C CNN
F 3 "~" H 7150 4050 50  0001 C CNN
	1    7150 4050
	0    1    -1   0   
$EndComp
$Comp
L Device:C C1003
U 1 1 5C483D8D
P 8800 3650
F 0 "C1003" H 8915 3696 50  0000 L CNN
F 1 "C" H 8915 3605 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L18.0mm_W8.0mm_P15.00mm_FKS3_FKP3" H 8838 3500 50  0001 C CNN
F 3 "~" H 8800 3650 50  0001 C CNN
	1    8800 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1004
U 1 1 5C483E77
P 8800 4150
F 0 "C1004" H 8915 4196 50  0000 L CNN
F 1 "C" H 8915 4105 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L18.0mm_W8.0mm_P15.00mm_FKS3_FKP3" H 8838 4000 50  0001 C CNN
F 3 "~" H 8800 4150 50  0001 C CNN
	1    8800 4150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J1001
U 1 1 5C4841FA
P 2050 2600
F 0 "J1001" H 1944 2275 50  0000 C CNN
F 1 "Conn_01x03_Female" H 1944 2366 50  0000 C CNN
F 2 "wbraun_smd:Terminal-block-plug_3x1_5mm-pitch" H 2050 2600 50  0001 C CNN
F 3 "~" H 2050 2600 50  0001 C CNN
	1    2050 2600
	-1   0    0    1   
$EndComp
$Comp
L Device:Fuse F1001
U 1 1 5C48F155
P 6800 5200
F 0 "F1001" V 6603 5200 50  0000 C CNN
F 1 "Fuse" V 6694 5200 50  0000 C CNN
F 2 "Fuse:Fuseholder_Cylinder-5x20mm_Schurter_0031_8201_Horizontal_Open" V 6730 5200 50  0001 C CNN
F 3 "~" H 6800 5200 50  0001 C CNN
	1    6800 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 2500 2350 2500
Wire Wire Line
	2250 2600 2350 2600
Wire Wire Line
	2250 2700 2350 2700
Text Label 2350 2500 0    50   ~ 0
L
Text Label 2350 2600 0    50   ~ 0
N
Text Label 2350 2700 0    50   ~ 0
G
Wire Wire Line
	6950 5200 7050 5200
Wire Wire Line
	7050 5400 6550 5400
Wire Wire Line
	6650 5200 6550 5200
Wire Wire Line
	7450 5200 7550 5200
Wire Wire Line
	7450 5400 7550 5400
Text Label 6550 5200 2    50   ~ 0
L
Text Label 6550 5400 2    50   ~ 0
N
Text Label 7550 5200 0    50   ~ 0
L'
Text Label 7550 5400 0    50   ~ 0
N'
$Comp
L wbraun_ic_lib:GTRL2 K1001
U 1 1 5C496070
P 7000 1400
F 0 "K1001" H 7630 1446 50  0000 L CNN
F 1 "GTRL2" H 7630 1355 50  0000 L CNN
F 2 "wbraun_smd:G2RL-2" H 6950 1400 50  0001 C CNN
F 3 "" H 6950 1400 50  0001 C CNN
	1    7000 1400
	1    0    0    -1  
$EndComp
$Comp
L wbraun_ic_lib:GTRL2 K1002
U 1 1 5C4963A0
P 7000 2700
F 0 "K1002" H 7630 2746 50  0000 L CNN
F 1 "GTRL2" H 7630 2655 50  0000 L CNN
F 2 "wbraun_smd:G2RL-2" H 6950 2700 50  0001 C CNN
F 3 "" H 6950 2700 50  0001 C CNN
	1    7000 2700
	1    0    0    -1  
$EndComp
Text Notes 5850 1400 0    50   ~ 0
Safety Relay
Text Notes 5750 2750 0    50   ~ 0
Precharge Relay
Wire Wire Line
	6600 1100 6600 1000
Wire Wire Line
	6600 1700 6600 1800
Text Label 6600 1000 2    50   ~ 0
RELAY1_A
Text Label 6600 1800 2    50   ~ 0
RELAY1_B
Text Label 7100 850  2    50   ~ 0
L'
Wire Wire Line
	7400 1700 7400 1800
Wire Wire Line
	7300 1100 7300 1000
Text Label 7300 1000 0    50   ~ 0
VOUT+
Text Label 7400 1800 0    50   ~ 0
DISCHARGE
Text Label 7000 3100 0    50   ~ 0
PRECHARGE_IN
Wire Wire Line
	7100 850  7100 1100
Wire Wire Line
	6600 2400 6600 2300
Wire Wire Line
	6600 3000 6600 3100
Text Label 6600 2300 2    50   ~ 0
RELAY2_A
Text Label 6600 3100 2    50   ~ 0
RELAY2_B
Wire Wire Line
	7000 3000 7000 3100
Wire Wire Line
	7100 2400 7100 2300
Text Label 7000 1900 0    50   ~ 0
PRECHARGE_IN
Wire Wire Line
	6900 2100 6900 2400
Text Label 6900 2100 0    50   ~ 0
PRECHARGE
Text Label 7100 2300 0    50   ~ 0
DOUBLER_IN
$Comp
L Device:R R1001
U 1 1 5C498F2D
P 8950 1350
F 0 "R1001" H 9020 1396 50  0000 L CNN
F 1 "R" H 9020 1305 50  0000 L CNN
F 2 "wbraun_smd:RESISTOR_CW010" V 8880 1350 50  0001 C CNN
F 3 "~" H 8950 1350 50  0001 C CNN
	1    8950 1350
	-1   0    0    1   
$EndComp
Wire Wire Line
	8950 1200 8950 1100
Wire Wire Line
	8950 1500 8950 1650
Text Label 8950 1100 0    50   ~ 0
DISCHARGE
Text Label 8950 1650 0    50   ~ 0
VOUT-
$Comp
L Device:R R1002
U 1 1 5C499891
P 8950 2700
F 0 "R1002" H 9020 2746 50  0000 L CNN
F 1 "R" H 9020 2655 50  0000 L CNN
F 2 "wbraun_smd:RESISTOR_CW010" V 8880 2700 50  0001 C CNN
F 3 "~" H 8950 2700 50  0001 C CNN
	1    8950 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	8950 2550 8950 2450
Wire Wire Line
	8950 2850 8950 3000
Text Label 8950 2450 0    50   ~ 0
PRECHARGE
Text Label 8950 3000 0    50   ~ 0
DOUBLER_IN
Wire Wire Line
	7150 3750 7150 3650
Wire Wire Line
	7150 3650 7650 3650
Wire Wire Line
	7650 3650 7650 3700
Wire Wire Line
	7650 4000 7650 4050
$Comp
L Device:CP1 C1002
U 1 1 5C48336B
P 7650 4250
F 0 "C1002" H 7765 4296 50  0000 L CNN
F 1 "CP1" H 7765 4205 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D25.0mm_P10.00mm_SnapIn" H 7650 4250 50  0001 C CNN
F 3 "~" H 7650 4250 50  0001 C CNN
	1    7650 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 4400 7650 4450
Wire Wire Line
	7650 4450 7150 4450
Wire Wire Line
	7150 4450 7150 4350
Wire Wire Line
	7650 4050 7750 4050
Connection ~ 7650 4050
Wire Wire Line
	7650 4050 7650 4100
Wire Wire Line
	6950 4050 6850 4050
Wire Wire Line
	7650 3650 7750 3650
Connection ~ 7650 3650
Wire Wire Line
	7650 4450 7750 4450
Connection ~ 7650 4450
Text Label 7750 3650 0    50   ~ 0
VOUT+
Text Label 7750 4450 0    50   ~ 0
VOUT-
Text Label 6850 4050 2    50   ~ 0
DOUBLER_IN
Text Label 7750 4050 0    50   ~ 0
N'
Wire Wire Line
	8800 3900 8900 3900
Wire Wire Line
	8800 3500 8800 3450
Wire Wire Line
	8800 3450 8900 3450
Wire Wire Line
	8800 4300 8800 4350
Wire Wire Line
	8800 4350 8900 4350
Text Label 8900 3450 0    50   ~ 0
VOUT+
Text Label 8900 4350 0    50   ~ 0
VOUT-
Text Label 8900 3900 0    50   ~ 0
G
Text Label 2350 1900 0    50   ~ 0
RELAY1_A
Text Label 2350 2000 0    50   ~ 0
RELAY1_B
Text Label 2350 2100 0    50   ~ 0
RELAY2_A
Text Label 2350 2200 0    50   ~ 0
RELAY2_B
Text Notes 1900 3150 0    50   ~ 0
Input Connectors
$Comp
L Connector:Conn_01x03_Female J1003
U 1 1 5C484396
P 2100 3500
F 0 "J1003" H 1993 3175 50  0000 C CNN
F 1 "Conn_01x03_Female" H 1993 3266 50  0000 C CNN
F 2 "wbraun_smd:Terminal-block-plug_3x1_5mm-pitch" H 2100 3500 50  0001 C CNN
F 3 "~" H 2100 3500 50  0001 C CNN
	1    2100 3500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2300 3400 2400 3400
Wire Wire Line
	2300 3500 2400 3500
Wire Wire Line
	2300 3600 2400 3600
Text Label 2400 3400 0    50   ~ 0
VOUT+
Text Label 2400 3500 0    50   ~ 0
VOUT-
Text Label 2400 3600 0    50   ~ 0
G
$Comp
L Mechanical:Heatsink_Pad HS1001
U 1 1 5C4B8180
P 9850 4200
F 0 "HS1001" H 9991 4241 50  0000 L CNN
F 1 "Heatsink_Pad" H 9991 4150 50  0000 L CNN
F 2 "wbraun_smd:RA-T2X" H 9862 4150 50  0001 C CNN
F 3 "~" H 9862 4150 50  0001 C CNN
	1    9850 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:EMI_Filter_CommonMode FL1001
U 1 1 5C4AA415
P 7250 5300
F 0 "FL1001" H 7250 5578 50  0000 C CNN
F 1 "EMI_Filter_CommonMode" H 7250 5487 50  0000 C CNN
F 2 "wbraun_smd:744824622" V 7250 5340 50  0001 C CNN
F 3 "~" V 7250 5340 50  0000 C CNN
	1    7250 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 3800 8800 3900
Wire Wire Line
	8800 3900 8800 4000
Connection ~ 8800 3900
Text Label 9850 4400 0    50   ~ 0
G
Wire Wire Line
	9850 4300 9850 4400
$Comp
L wbraun_ic_lib:mounting-hole-nc J1004
U 1 1 5C4AE651
P 2250 5750
F 0 "J1004" H 2528 5803 60  0000 L CNN
F 1 "mounting-hole-nc" H 2528 5697 60  0000 L CNN
F 2 "wbraun_smd:M3-mounting-hole-insulated" H 2250 5750 60  0001 C CNN
F 3 "" H 2250 5750 60  0001 C CNN
	1    2250 5750
	1    0    0    -1  
$EndComp
$Comp
L wbraun_ic_lib:mounting-hole-nc J1006
U 1 1 5C4AE7C3
P 3250 5700
F 0 "J1006" H 3528 5753 60  0000 L CNN
F 1 "mounting-hole-nc" H 3528 5647 60  0000 L CNN
F 2 "wbraun_smd:M3-mounting-hole-insulated" H 3250 5700 60  0001 C CNN
F 3 "" H 3250 5700 60  0001 C CNN
	1    3250 5700
	1    0    0    -1  
$EndComp
$Comp
L wbraun_ic_lib:mounting-hole-nc J1007
U 1 1 5C4AE82D
P 3300 6300
F 0 "J1007" H 3578 6353 60  0000 L CNN
F 1 "mounting-hole-nc" H 3578 6247 60  0000 L CNN
F 2 "wbraun_smd:M3-mounting-hole-insulated" H 3300 6300 60  0001 C CNN
F 3 "" H 3300 6300 60  0001 C CNN
	1    3300 6300
	1    0    0    -1  
$EndComp
$Comp
L wbraun_ic_lib:mounting-hole-nc J1005
U 1 1 5C4AE887
P 2300 6350
F 0 "J1005" H 2578 6403 60  0000 L CNN
F 1 "mounting-hole-nc" H 2578 6297 60  0000 L CNN
F 2 "wbraun_smd:M3-mounting-hole-insulated" H 2300 6350 60  0001 C CNN
F 3 "" H 2300 6350 60  0001 C CNN
	1    2300 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1005
U 1 1 5C4B11B7
P 8800 4850
F 0 "C1005" H 8915 4896 50  0000 L CNN
F 1 "C" H 8915 4805 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L18.0mm_W8.0mm_P15.00mm_FKS3_FKP3" H 8838 4700 50  0001 C CNN
F 3 "~" H 8800 4850 50  0001 C CNN
	1    8800 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1006
U 1 1 5C4B11BE
P 8800 5350
F 0 "C1006" H 8915 5396 50  0000 L CNN
F 1 "C" H 8915 5305 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L18.0mm_W8.0mm_P15.00mm_FKS3_FKP3" H 8838 5200 50  0001 C CNN
F 3 "~" H 8800 5350 50  0001 C CNN
	1    8800 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 5100 8900 5100
Wire Wire Line
	8800 4700 8800 4650
Wire Wire Line
	8800 4650 8900 4650
Wire Wire Line
	8800 5500 8800 5550
Wire Wire Line
	8800 5550 8900 5550
Text Label 8900 5100 0    50   ~ 0
G
Wire Wire Line
	8800 5000 8800 5100
Wire Wire Line
	8800 5100 8800 5200
Connection ~ 8800 5100
Text Label 8900 4650 0    50   ~ 0
L'
Text Label 8900 5550 0    50   ~ 0
N'
Wire Wire Line
	7000 1700 7000 1900
$EndSCHEMATC
