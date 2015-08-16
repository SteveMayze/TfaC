EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Tfac-Symbols
LIBS:TfaC-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
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
L RTC-DCF77 U401
U 1 1 557082EC
P 5950 1400
F 0 "U401" H 6200 550 60  0000 C CNN
F 1 "RTC-DCF77" H 5950 2000 60  0000 C CNN
F 2 "tfac-footprints:RTC-DCF" H 5950 1400 60  0001 C CNN
F 3 "" H 5950 1400 60  0000 C CNN
	1    5950 1400
	1    0    0    -1  
$EndComp
Text HLabel 4050 950  0    60   Input ~ 0
Vbb
$Comp
L GND #PWR06
U 1 1 5570847C
P 5800 2650
F 0 "#PWR06" H 5800 2400 50  0001 C CNN
F 1 "GND" H 5800 2500 50  0000 C CNN
F 2 "" H 5800 2650 60  0000 C CNN
F 3 "" H 5800 2650 60  0000 C CNN
	1    5800 2650
	1    0    0    -1  
$EndComp
$Comp
L IRLML2502 Q403
U 1 1 5570800B
P 4300 4650
F 0 "Q403" H 4300 4501 40  0000 R CNN
F 1 "IRLML2502" H 4300 4800 40  0000 R CNN
F 2 "tfac-footprints:Micro3" H 4170 4752 29  0001 C CNN
F 3 "" H 4300 4650 60  0000 C CNN
	1    4300 4650
	0    1    1    0   
$EndComp
$Comp
L IRLML2502 Q405
U 1 1 55708087
P 6000 4650
F 0 "Q405" H 6000 4501 40  0000 R CNN
F 1 "IRLML2502" H 6000 4800 40  0000 R CNN
F 2 "tfac-footprints:Micro3" H 5870 4752 29  0001 C CNN
F 3 "" H 6000 4650 60  0000 C CNN
	1    6000 4650
	0    1    1    0   
$EndComp
$Comp
L IRLML2502 Q404
U 1 1 557080B4
P 5150 4650
F 0 "Q404" H 5150 4501 40  0000 R CNN
F 1 "IRLML2502" H 5150 4800 40  0000 R CNN
F 2 "tfac-footprints:Micro3" H 5020 4752 29  0001 C CNN
F 3 "" H 5150 4650 60  0000 C CNN
	1    5150 4650
	0    1    1    0   
$EndComp
$Comp
L IRLML2502 Q406
U 1 1 557080D9
P 6850 4650
F 0 "Q406" H 6850 4501 40  0000 R CNN
F 1 "IRLML2502" H 6850 4800 40  0000 R CNN
F 2 "tfac-footprints:Micro3" H 6720 4752 29  0001 C CNN
F 3 "" H 6850 4650 60  0000 C CNN
	1    6850 4650
	0    1    1    0   
$EndComp
$Comp
L IRLML2502 Q407
U 1 1 557080FC
P 7800 4650
F 0 "Q407" H 7800 4501 40  0000 R CNN
F 1 "NOPOP" H 7800 4800 40  0000 R CNN
F 2 "tfac-footprints:Micro3" H 7670 4752 29  0001 C CNN
F 3 "" H 7800 4650 60  0000 C CNN
	1    7800 4650
	0    1    1    0   
$EndComp
$Comp
L IRLML2502 Q408
U 1 1 5570812B
P 8650 4650
F 0 "Q408" H 8650 4501 40  0000 R CNN
F 1 "IRLML2502" H 8650 4800 40  0000 R CNN
F 2 "tfac-footprints:Micro3" H 8520 4752 29  0001 C CNN
F 3 "" H 8650 4650 60  0000 C CNN
	1    8650 4650
	0    1    1    0   
$EndComp
$Comp
L IRLML2502 Q401
U 1 1 5570815C
P 2600 4650
F 0 "Q401" H 2600 4501 40  0000 R CNN
F 1 "IRLML2502" H 2600 4800 40  0000 R CNN
F 2 "tfac-footprints:Micro3" H 2470 4752 29  0001 C CNN
F 3 "" H 2600 4650 60  0000 C CNN
	1    2600 4650
	0    1    1    0   
$EndComp
$Comp
L IRLML2502 Q402
U 1 1 5570818B
P 3450 4650
F 0 "Q402" H 3450 4501 40  0000 R CNN
F 1 "IRLML2502" H 3450 4800 40  0000 R CNN
F 2 "tfac-footprints:Micro3" H 3320 4752 29  0001 C CNN
F 3 "" H 3450 4650 60  0000 C CNN
	1    3450 4650
	0    1    1    0   
$EndComp
$Comp
L R R401
U 1 1 5570833A
P 2300 4100
F 0 "R401" V 2380 4100 50  0000 C CNN
F 1 "10K" V 2300 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2230 4100 30  0001 C CNN
F 3 "" H 2300 4100 30  0000 C CNN
	1    2300 4100
	1    0    0    -1  
$EndComp
$Comp
L R R402
U 1 1 55708378
P 2900 4100
F 0 "R402" V 2980 4100 50  0000 C CNN
F 1 "1K5" V 2900 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2830 4100 30  0001 C CNN
F 3 "" H 2900 4100 30  0000 C CNN
	1    2900 4100
	1    0    0    -1  
$EndComp
$Comp
L R R403
U 1 1 557083DA
P 3150 4100
F 0 "R403" V 3230 4100 50  0000 C CNN
F 1 "10K" V 3150 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3080 4100 30  0001 C CNN
F 3 "" H 3150 4100 30  0000 C CNN
	1    3150 4100
	1    0    0    -1  
$EndComp
$Comp
L R R404
U 1 1 55708413
P 3750 4100
F 0 "R404" V 3830 4100 50  0000 C CNN
F 1 "1K5" V 3750 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3680 4100 30  0001 C CNN
F 3 "" H 3750 4100 30  0000 C CNN
	1    3750 4100
	1    0    0    -1  
$EndComp
Text HLabel 2050 3150 0    60   Input ~ 0
Vcc
Text HLabel 2050 3350 0    60   Input ~ 0
Vbb
Text GLabel 2300 4950 3    60   Input ~ 0
L_Periodic_INT
Text GLabel 3150 4950 3    60   Input ~ 0
L_DCF_RCPT
$Comp
L R R405
U 1 1 55709AF5
P 4000 4100
F 0 "R405" V 4080 4100 50  0000 C CNN
F 1 "10K" V 4000 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3930 4100 30  0001 C CNN
F 3 "" H 4000 4100 30  0000 C CNN
	1    4000 4100
	1    0    0    -1  
$EndComp
$Comp
L R R406
U 1 1 55709AFB
P 4600 4100
F 0 "R406" V 4680 4100 50  0000 C CNN
F 1 "4K7" V 4600 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4530 4100 30  0001 C CNN
F 3 "" H 4600 4100 30  0000 C CNN
	1    4600 4100
	1    0    0    -1  
$EndComp
$Comp
L R R407
U 1 1 55709B01
P 4850 4100
F 0 "R407" V 4930 4100 50  0000 C CNN
F 1 "10K" V 4850 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4780 4100 30  0001 C CNN
F 3 "" H 4850 4100 30  0000 C CNN
	1    4850 4100
	1    0    0    -1  
$EndComp
$Comp
L R R408
U 1 1 55709B07
P 5450 4100
F 0 "R408" V 5530 4100 50  0000 C CNN
F 1 "4K7" V 5450 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5380 4100 30  0001 C CNN
F 3 "" H 5450 4100 30  0000 C CNN
	1    5450 4100
	1    0    0    -1  
$EndComp
$Comp
L R R409
U 1 1 55709E4B
P 5700 4100
F 0 "R409" V 5780 4100 50  0000 C CNN
F 1 "10K" V 5700 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5630 4100 30  0001 C CNN
F 3 "" H 5700 4100 30  0000 C CNN
	1    5700 4100
	1    0    0    -1  
$EndComp
$Comp
L R R410
U 1 1 55709E51
P 6300 4100
F 0 "R410" V 6380 4100 50  0000 C CNN
F 1 "4K7" V 6300 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6230 4100 30  0001 C CNN
F 3 "" H 6300 4100 30  0000 C CNN
	1    6300 4100
	1    0    0    -1  
$EndComp
$Comp
L R R411
U 1 1 55709E57
P 6550 4100
F 0 "R411" V 6630 4100 50  0000 C CNN
F 1 "10K" V 6550 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6480 4100 30  0001 C CNN
F 3 "" H 6550 4100 30  0000 C CNN
	1    6550 4100
	1    0    0    -1  
$EndComp
$Comp
L R R412
U 1 1 55709E5D
P 7150 4100
F 0 "R412" V 7230 4100 50  0000 C CNN
F 1 "4K7" V 7150 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7080 4100 30  0001 C CNN
F 3 "" H 7150 4100 30  0000 C CNN
	1    7150 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 950  5450 950 
Wire Wire Line
	5350 950  5350 1100
Wire Wire Line
	5350 1100 5450 1100
Connection ~ 5350 950 
Wire Wire Line
	5800 2400 5800 2650
Wire Wire Line
	5800 2550 6100 2550
Wire Wire Line
	6100 2550 6100 2400
Connection ~ 5800 2550
Wire Wire Line
	5000 1250 5450 1250
Wire Wire Line
	5000 1400 5450 1400
Wire Wire Line
	5000 1550 5450 1550
Wire Wire Line
	5000 1700 5450 1700
Wire Wire Line
	2300 4250 2300 4950
Wire Wire Line
	2300 4750 2400 4750
Wire Wire Line
	2900 4750 2800 4750
Wire Wire Line
	3150 4250 3150 4950
Wire Wire Line
	3150 4750 3250 4750
Wire Wire Line
	3650 4750 3750 4750
Wire Wire Line
	3750 4250 3750 6050
Wire Wire Line
	2050 3150 8950 3150
Wire Wire Line
	2900 3150 2900 3950
Wire Wire Line
	2300 3350 2300 3950
Connection ~ 2900 3150
Connection ~ 2300 3350
Wire Wire Line
	2300 3550 2550 3550
Wire Wire Line
	2550 3550 2550 4450
Connection ~ 2300 3550
Connection ~ 2300 4750
Connection ~ 2900 4750
Connection ~ 3150 4750
Connection ~ 3750 4750
Wire Wire Line
	3150 3350 3150 3950
Connection ~ 3150 3350
Wire Wire Line
	2050 3350 8350 3350
Wire Wire Line
	3150 3550 3400 3550
Wire Wire Line
	3400 3550 3400 4450
Connection ~ 3150 3550
Wire Wire Line
	3750 3150 3750 3950
Connection ~ 3750 3150
Wire Wire Line
	4000 4250 4000 4950
Wire Wire Line
	4600 4250 4600 6050
Wire Wire Line
	4850 4250 4850 4950
Wire Wire Line
	5450 4250 5450 5900
Wire Wire Line
	4600 3150 4600 3950
Wire Wire Line
	4000 3350 4000 3950
Wire Wire Line
	4250 3600 4250 4450
Wire Wire Line
	4850 3350 4850 3950
Wire Wire Line
	5100 3600 5100 4450
Wire Wire Line
	5450 3150 5450 3950
Connection ~ 4600 3150
Connection ~ 4000 3350
Wire Wire Line
	4000 3600 4250 3600
Connection ~ 4000 3600
Wire Wire Line
	4850 3600 5100 3600
Connection ~ 4850 3600
Wire Wire Line
	5700 4250 5700 4950
Wire Wire Line
	6300 4250 6300 5750
Wire Wire Line
	6550 4250 6550 4950
Wire Wire Line
	7150 4250 7150 5600
Wire Wire Line
	6300 3150 6300 3950
Wire Wire Line
	5700 3350 5700 3950
Wire Wire Line
	5950 3600 5950 4450
Wire Wire Line
	6550 3350 6550 3950
Wire Wire Line
	6800 3600 6800 4450
Wire Wire Line
	7150 3150 7150 3950
Connection ~ 5450 3150
Connection ~ 6300 3150
Connection ~ 4850 3350
Connection ~ 5700 3350
Wire Wire Line
	5700 3600 5950 3600
Connection ~ 5700 3600
Wire Wire Line
	6550 3600 6800 3600
Connection ~ 6550 3600
Wire Wire Line
	4000 4750 4100 4750
Connection ~ 4000 4750
Wire Wire Line
	4500 4750 4600 4750
Connection ~ 4600 4750
Wire Wire Line
	4850 4750 4950 4750
Connection ~ 4850 4750
Wire Wire Line
	5350 4750 5450 4750
Connection ~ 5450 4750
Wire Wire Line
	5700 4750 5800 4750
Connection ~ 5700 4750
Wire Wire Line
	6200 4750 6300 4750
Connection ~ 6300 4750
Wire Wire Line
	6550 4750 6650 4750
Connection ~ 6550 4750
Wire Wire Line
	7050 4750 7150 4750
Connection ~ 7150 4750
$Comp
L R R413
U 1 1 5570A9F3
P 7500 4100
F 0 "R413" V 7580 4100 50  0000 C CNN
F 1 "NOPOP" V 7500 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7430 4100 30  0001 C CNN
F 3 "" H 7500 4100 30  0000 C CNN
	1    7500 4100
	1    0    0    -1  
$EndComp
$Comp
L R R414
U 1 1 5570A9F9
P 8100 4100
F 0 "R414" V 8180 4100 50  0000 C CNN
F 1 "NOPOP" V 8100 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 8030 4100 30  0001 C CNN
F 3 "" H 8100 4100 30  0000 C CNN
	1    8100 4100
	1    0    0    -1  
$EndComp
$Comp
L R R415
U 1 1 5570A9FF
P 8350 4100
F 0 "R415" V 8430 4100 50  0000 C CNN
F 1 "10K" V 8350 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 8280 4100 30  0001 C CNN
F 3 "" H 8350 4100 30  0000 C CNN
	1    8350 4100
	1    0    0    -1  
$EndComp
$Comp
L R R416
U 1 1 5570AA05
P 8950 4100
F 0 "R416" V 9030 4100 50  0000 C CNN
F 1 "4K7" V 8950 4100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 8880 4100 30  0001 C CNN
F 3 "" H 8950 4100 30  0000 C CNN
	1    8950 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 4250 7500 4950
Wire Wire Line
	8100 4250 8100 5100
Wire Wire Line
	8350 4250 8350 4950
Wire Wire Line
	8950 4250 8950 5400
Wire Wire Line
	8100 3150 8100 3950
Wire Wire Line
	7500 3350 7500 3950
Wire Wire Line
	7750 3600 7750 4450
Wire Wire Line
	8350 3350 8350 3950
Wire Wire Line
	8600 3600 8600 4450
Wire Wire Line
	8950 3150 8950 3950
Connection ~ 7150 3150
Connection ~ 8100 3150
Connection ~ 6550 3350
Connection ~ 7500 3350
Wire Wire Line
	7500 3600 7750 3600
Connection ~ 7500 3600
Wire Wire Line
	8350 3600 8600 3600
Connection ~ 8350 3600
Wire Wire Line
	7500 4750 7600 4750
Connection ~ 7500 4750
Wire Wire Line
	8000 4750 8100 4750
Connection ~ 8100 4750
Wire Wire Line
	8350 4750 8450 4750
Connection ~ 8350 4750
Wire Wire Line
	8850 4750 8950 4750
Connection ~ 8950 4750
Text GLabel 4000 4950 3    60   Input ~ 0
~L_SS
Text GLabel 4850 4950 3    60   Input ~ 0
L_MOSI
Text GLabel 5700 4950 3    60   Input ~ 0
L_MISO
Text GLabel 6550 4950 3    60   Input ~ 0
L_SCK
Text GLabel 7500 4950 3    60   Input ~ 0
L_Rx
Text GLabel 8350 4950 3    60   Input ~ 0
L_ALARM_INT
Text GLabel 5000 1700 0    60   Input ~ 0
L_MISO
Text GLabel 5000 1550 0    60   Input ~ 0
L_MOSI
Text GLabel 5000 1400 0    60   Input ~ 0
L_SCK
Text GLabel 5000 1250 0    60   Input ~ 0
~L_SS
Text Notes 1250 1600 0    60   ~ 0
The RTC-DCF77 is a pre-fabricated module \nthat has two 6 contact pin headers each end. \nThis does not need any representation here \nwith respect to connectors.\n\nThis will be modelled in the foot print as two 6-pole \nthrough hole connectors\n
Wire Wire Line
	2900 4250 2900 5900
Text HLabel 2500 5900 0    60   Input ~ 0
Periodic_INT
Wire Wire Line
	2900 5900 2500 5900
Text HLabel 2500 6050 0    60   Input ~ 0
DCF_RCPT
Wire Wire Line
	3750 6050 2500 6050
Text HLabel 9100 6050 2    60   Input ~ 0
~SS
Wire Wire Line
	4600 6050 9100 6050
Text HLabel 9100 5900 2    60   Input ~ 0
MOSI
Wire Wire Line
	5450 5900 9100 5900
Text HLabel 9100 5400 2    60   Input ~ 0
ALARM_INT
Wire Wire Line
	8950 5400 9100 5400
Text HLabel 9100 5600 2    60   Input ~ 0
SCK
Wire Wire Line
	7150 5600 9100 5600
Text HLabel 9100 5750 2    60   Input ~ 0
MISO
Wire Wire Line
	6300 5750 9100 5750
Text GLabel 6850 1100 2    60   Input ~ 0
L_Periodic_INT
Text GLabel 6850 1250 2    60   Input ~ 0
L_DCF_RCPT
Text GLabel 6850 1550 2    60   Input ~ 0
L_ALARM_INT
Wire Wire Line
	6450 1100 6850 1100
Wire Wire Line
	6450 1250 6850 1250
Wire Wire Line
	6450 1550 6850 1550
Text GLabel 6850 1400 2    60   Input ~ 0
L_Rx
Wire Wire Line
	6450 1400 6850 1400
NoConn ~ 8100 5100
$EndSCHEMATC
