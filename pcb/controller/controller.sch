EESchema Schematic File Version 4
LIBS:controller-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 1000 950  1000 1000
U 5BD3B75A
F0 "Power" 50
F1 "Power.sch" 50
$EndSheet
$Sheet
S 1000 2400 1000 1000
U 5C40415F
F0 "FPGA" 50
F1 "FPGA.sch" 50
$EndSheet
$Sheet
S 1000 3850 1000 1000
U 5C45B08A
F0 "Gate Drive" 50
F1 "GateDrive.sch" 50
$EndSheet
$Sheet
S 1000 5200 1000 1000
U 5C45B08D
F0 "Interface" 50
F1 "Interface.sch" 50
$EndSheet
$Sheet
S 2900 5200 1000 1000
U 5C45B090
F0 "Analog" 50
F1 "Analog.sch" 50
$EndSheet
$Comp
L wbraun_ic_lib:mounting-hole-grounded J1002
U 1 1 5C44CD77
P 6850 4350
F 0 "J1002" H 7128 4297 60  0000 L CNN
F 1 "mounting-hole-grounded" H 7128 4191 60  0000 L CNN
F 2 "wbraun_smd:M3-tight-fit-pan-head" H 6850 4350 60  0001 C CNN
F 3 "" H 6850 4350 60  0001 C CNN
	1    6850 4350
	1    0    0    -1  
$EndComp
$Comp
L wbraun_ic_lib:mounting-hole-grounded J1003
U 1 1 5C44CEBD
P 7900 4350
F 0 "J1003" H 8178 4297 60  0000 L CNN
F 1 "mounting-hole-grounded" H 8178 4191 60  0000 L CNN
F 2 "wbraun_smd:M3-tight-fit-pan-head" H 7900 4350 60  0001 C CNN
F 3 "" H 7900 4350 60  0001 C CNN
	1    7900 4350
	1    0    0    -1  
$EndComp
$Comp
L wbraun_ic_lib:mounting-hole-grounded J1001
U 1 1 5C44CF0B
P 5800 4350
F 0 "J1001" H 6078 4297 60  0000 L CNN
F 1 "mounting-hole-grounded" H 6078 4191 60  0000 L CNN
F 2 "wbraun_smd:M3-tight-fit-pan-head" H 5800 4350 60  0001 C CNN
F 3 "" H 5800 4350 60  0001 C CNN
	1    5800 4350
	1    0    0    -1  
$EndComp
$Comp
L wbraun_ic_lib:mounting-hole-grounded J1004
U 1 1 5C44CFC0
P 8850 4350
F 0 "J1004" H 9128 4297 60  0000 L CNN
F 1 "mounting-hole-grounded" H 9128 4191 60  0000 L CNN
F 2 "wbraun_smd:M3-tight-fit-pan-head" H 8850 4350 60  0001 C CNN
F 3 "" H 8850 4350 60  0001 C CNN
	1    8850 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0203
U 1 1 5C4A8EAE
P 5800 4950
F 0 "#PWR0203" H 5800 4700 50  0001 C CNN
F 1 "GND" H 5805 4777 50  0000 C CNN
F 2 "" H 5800 4950 50  0001 C CNN
F 3 "" H 5800 4950 50  0001 C CNN
	1    5800 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0204
U 1 1 5C4A8ED0
P 6850 4950
F 0 "#PWR0204" H 6850 4700 50  0001 C CNN
F 1 "GND" H 6855 4777 50  0000 C CNN
F 2 "" H 6850 4950 50  0001 C CNN
F 3 "" H 6850 4950 50  0001 C CNN
	1    6850 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0216
U 1 1 5C4A8EE3
P 7900 4950
F 0 "#PWR0216" H 7900 4700 50  0001 C CNN
F 1 "GND" H 7905 4777 50  0000 C CNN
F 2 "" H 7900 4950 50  0001 C CNN
F 3 "" H 7900 4950 50  0001 C CNN
	1    7900 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0217
U 1 1 5C4A8EF6
P 8850 4950
F 0 "#PWR0217" H 8850 4700 50  0001 C CNN
F 1 "GND" H 8855 4777 50  0000 C CNN
F 2 "" H 8850 4950 50  0001 C CNN
F 3 "" H 8850 4950 50  0001 C CNN
	1    8850 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 4800 5800 4950
Wire Wire Line
	6850 4800 6850 4950
Wire Wire Line
	7900 4800 7900 4950
Wire Wire Line
	8850 4800 8850 4950
$EndSCHEMATC
