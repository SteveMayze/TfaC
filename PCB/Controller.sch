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
Sheet 5 5
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
L ATMEGA88-A IC501
U 1 1 5560D585
P 4650 3300
F 0 "IC501" H 3900 4550 40  0000 L BNN
F 1 "ATMEGA88-A" H 5100 1900 40  0000 L BNN
F 2 "Housings_QFP:LQFP-32_7x7mm_Pitch0.8mm" H 4650 3300 30  0000 C CIN
F 3 "" H 4650 3300 60  0000 C CNN
	1    4650 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5560D64D
P 3450 4800
F 0 "#PWR07" H 3450 4550 50  0001 C CNN
F 1 "GND" H 3450 4650 50  0000 C CNN
F 2 "" H 3450 4800 60  0000 C CNN
F 3 "" H 3450 4800 60  0000 C CNN
	1    3450 4800
	1    0    0    -1  
$EndComp
Text HLabel 2200 2200 0    60   Input ~ 0
Vcc
Text HLabel 6000 2500 2    60   Input ~ 0
MOSI
Text HLabel 6000 2600 2    60   Input ~ 0
MISO
Text HLabel 6000 2700 2    60   Input ~ 0
SCK
Text HLabel 6000 2400 2    60   Input ~ 0
~DISPLAY_SELECT
Text HLabel 6000 2300 2    60   Input ~ 0
~RTC_SELECT
Text HLabel 6050 3050 2    60   Input ~ 0
Periodic_INT
Text HLabel 6050 3150 2    60   Input ~ 0
DCF_RCPT
Text HLabel 6050 3250 2    60   Input ~ 0
ALARM_INT
$Comp
L CONN_02X03 P501
U 1 1 5570FD1E
P 7350 1300
F 0 "P501" H 7350 1500 50  0000 C CNN
F 1 "PRG" H 7350 1100 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03" H 7350 100 60  0001 C CNN
F 3 "" H 7350 100 60  0000 C CNN
	1    7350 1300
	1    0    0    -1  
$EndComp
Text HLabel 6850 1200 0    60   Input ~ 0
MISO
Text HLabel 6850 1300 0    60   Input ~ 0
SCK
Text HLabel 7800 1300 2    60   Input ~ 0
MOSI
Text HLabel 7800 1200 2    60   Input ~ 0
Vcc
$Comp
L GND #PWR08
U 1 1 5570FE29
P 7850 1650
F 0 "#PWR08" H 7850 1400 50  0001 C CNN
F 1 "GND" H 7850 1500 50  0000 C CNN
F 2 "" H 7850 1650 60  0000 C CNN
F 3 "" H 7850 1650 60  0000 C CNN
	1    7850 1650
	1    0    0    -1  
$EndComp
$Comp
L C C501
U 1 1 5570FFE4
P 2700 2500
F 0 "C501" H 2725 2600 50  0000 L CNN
F 1 "100n" H 2725 2400 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2738 2350 30  0001 C CNN
F 3 "" H 2700 2500 60  0000 C CNN
	1    2700 2500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 55710077
P 2700 2900
F 0 "#PWR09" H 2700 2650 50  0001 C CNN
F 1 "GND" H 2700 2750 50  0000 C CNN
F 2 "" H 2700 2900 60  0000 C CNN
F 3 "" H 2700 2900 60  0000 C CNN
	1    2700 2900
	1    0    0    -1  
$EndComp
$Comp
L R R501
U 1 1 55710A4C
P 3200 2200
F 0 "R501" V 3280 2200 50  0000 C CNN
F 1 "10K" V 3200 2200 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3130 2200 30  0001 C CNN
F 3 "" H 3200 2200 30  0000 C CNN
	1    3200 2200
	0    1    1    0   
$EndComp
Text GLabel 6500 1400 0    60   Input ~ 0
Reset
Text GLabel 5900 3650 2    60   Input ~ 0
Reset
Text GLabel 3150 1700 2    60   Input ~ 0
Reset
$Comp
L SW_PUSH SW501
U 1 1 55C0F652
P 9350 2450
F 0 "SW501" H 9500 2560 50  0000 C CNN
F 1 "Time Set" H 9350 2370 50  0000 C CNN
F 2 "" H 9350 2450 60  0001 C CNN
F 3 "" H 9350 2450 60  0000 C CNN
	1    9350 2450
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW502
U 1 1 55C0F6D0
P 9350 2750
F 0 "SW502" H 9500 2860 50  0000 C CNN
F 1 "Alarm Set" H 9350 2670 50  0000 C CNN
F 2 "" H 9350 2750 60  0001 C CNN
F 3 "" H 9350 2750 60  0000 C CNN
	1    9350 2750
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW503
U 1 1 55C0F704
P 9350 3050
F 0 "SW503" H 9500 3160 50  0000 C CNN
F 1 "Fast" H 9350 2970 50  0000 C CNN
F 2 "" H 9350 3050 60  0001 C CNN
F 3 "" H 9350 3050 60  0000 C CNN
	1    9350 3050
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW504
U 1 1 55C0F741
P 9350 3350
F 0 "SW504" H 9500 3460 50  0000 C CNN
F 1 "Slow" H 9350 3270 50  0000 C CNN
F 2 "" H 9350 3350 60  0001 C CNN
F 3 "" H 9350 3350 60  0000 C CNN
	1    9350 3350
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW505
U 1 1 55C0F785
P 9350 3650
F 0 "SW505" H 9500 3760 50  0000 C CNN
F 1 "Auto Time" H 9350 3570 50  0000 C CNN
F 2 "" H 9350 3650 60  0001 C CNN
F 3 "" H 9350 3650 60  0000 C CNN
	1    9350 3650
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW506
U 1 1 55C0F89E
P 9350 4000
F 0 "SW506" H 9500 4110 50  0000 C CNN
F 1 "Sleep" H 9350 3920 50  0000 C CNN
F 2 "" H 9350 4000 60  0001 C CNN
F 3 "" H 9350 4000 60  0000 C CNN
	1    9350 4000
	1    0    0    -1  
$EndComp
$Comp
L SPST SW508
U 1 1 55C0F8D0
P 9400 4800
F 0 "SW508" H 9400 4900 50  0000 C CNN
F 1 "Alarm Enabled" H 9400 4700 50  0000 C CNN
F 2 "" H 9400 4800 60  0001 C CNN
F 3 "" H 9400 4800 60  0000 C CNN
	1    9400 4800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 55C0F9DC
P 10100 5000
F 0 "#PWR010" H 10100 4750 50  0001 C CNN
F 1 "GND" H 10100 4850 50  0000 C CNN
F 2 "" H 10100 5000 60  0000 C CNN
F 3 "" H 10100 5000 60  0000 C CNN
	1    10100 5000
	1    0    0    -1  
$EndComp
Text GLabel 8700 2450 0    60   Input ~ 0
Time_Set
Text GLabel 8700 2750 0    60   Input ~ 0
Alarm_Set
Text GLabel 8700 3050 0    60   Input ~ 0
Fast
Text GLabel 8700 3350 0    60   Input ~ 0
Slow
Text GLabel 8700 3650 0    60   Input ~ 0
Auto_Time
Text GLabel 8700 4000 0    60   Input ~ 0
Sleep
Text GLabel 8750 4800 0    60   Input ~ 0
Alarm_Enabled
Text GLabel 5900 3800 2    60   Input ~ 0
Time_Set
Text GLabel 5900 4200 2    60   Input ~ 0
Alarm_Set
Text GLabel 6600 3900 2    60   Input ~ 0
Fast
Text GLabel 5900 4000 2    60   Input ~ 0
Slow
Text GLabel 6600 4100 2    60   Input ~ 0
Alarm_Enabled
Text GLabel 6600 4300 2    60   Input ~ 0
Sleep
Text GLabel 6600 4500 2    60   Input ~ 0
Auto_Time
$Comp
L SW_PUSH SW507
U 1 1 55C107C5
P 9350 4350
F 0 "SW507" H 9500 4460 50  0000 C CNN
F 1 "Sleep" H 9350 4270 50  0000 C CNN
F 2 "" H 9350 4350 60  0001 C CNN
F 3 "" H 9350 4350 60  0000 C CNN
	1    9350 4350
	1    0    0    -1  
$EndComp
Text GLabel 8700 4350 0    60   Input ~ 0
Summer_Time
Wire Wire Line
	3750 4300 3450 4300
Wire Wire Line
	3450 4300 3450 4800
Wire Wire Line
	3750 4400 3450 4400
Connection ~ 3450 4400
Wire Wire Line
	3750 4500 3450 4500
Connection ~ 3450 4500
Wire Wire Line
	3600 2200 3600 2500
Wire Wire Line
	3600 2300 3750 2300
Wire Wire Line
	3600 2500 3750 2500
Connection ~ 3600 2300
Wire Wire Line
	5650 2400 6000 2400
Wire Wire Line
	5650 2500 6000 2500
Wire Wire Line
	5650 2600 6000 2600
Wire Wire Line
	5650 2700 6000 2700
Wire Wire Line
	5650 2300 6000 2300
Wire Wire Line
	5650 3050 6050 3050
Wire Wire Line
	5650 3150 6050 3150
Wire Wire Line
	5650 3250 6050 3250
Wire Wire Line
	7600 1400 7850 1400
Wire Wire Line
	7850 1400 7850 1650
Wire Wire Line
	7600 1300 7800 1300
Wire Wire Line
	7600 1200 7800 1200
Wire Wire Line
	7100 1200 6850 1200
Wire Wire Line
	7100 1300 6850 1300
Wire Wire Line
	2700 2650 2700 2900
Wire Wire Line
	2700 2350 2700 2200
Wire Wire Line
	3350 2200 3750 2200
Connection ~ 3600 2200
Wire Wire Line
	2200 2200 3050 2200
Connection ~ 2700 2200
Wire Wire Line
	6500 1400 7100 1400
Wire Wire Line
	5900 3650 5650 3650
Wire Wire Line
	3150 1700 2900 1700
Wire Wire Line
	2900 1700 2900 2200
Connection ~ 2900 2200
Wire Wire Line
	9650 2450 10100 2450
Wire Wire Line
	10100 2450 10100 5000
Wire Wire Line
	9650 2750 10100 2750
Connection ~ 10100 2750
Wire Wire Line
	9650 3050 10100 3050
Connection ~ 10100 3050
Wire Wire Line
	9650 3350 10100 3350
Connection ~ 10100 3350
Wire Wire Line
	9650 3650 10100 3650
Connection ~ 10100 3650
Wire Wire Line
	9650 4000 10100 4000
Connection ~ 10100 4000
Wire Wire Line
	8700 2450 9050 2450
Wire Wire Line
	8700 2750 9050 2750
Wire Wire Line
	8700 3050 9050 3050
Wire Wire Line
	8700 3350 9050 3350
Wire Wire Line
	8700 3650 9050 3650
Wire Wire Line
	8700 4000 9050 4000
Wire Wire Line
	8750 4800 8900 4800
Wire Wire Line
	5650 3800 5900 3800
Wire Wire Line
	5650 3900 6600 3900
Wire Wire Line
	5650 4000 5900 4000
Wire Wire Line
	8700 4350 9050 4350
Wire Wire Line
	9650 4350 10100 4350
Connection ~ 10100 4350
Wire Wire Line
	9900 4800 10100 4800
Connection ~ 10100 4800
Text GLabel 5900 4400 2    60   Input ~ 0
Summer_Time
Wire Wire Line
	5650 4100 6600 4100
Wire Wire Line
	5650 4200 5900 4200
Wire Wire Line
	5650 4300 6600 4300
Wire Wire Line
	5650 4400 5900 4400
Wire Wire Line
	5650 4500 6600 4500
NoConn ~ 5650 2200
NoConn ~ 5650 2800
NoConn ~ 5650 2900
NoConn ~ 5650 3350
NoConn ~ 5650 3450
NoConn ~ 5650 3550
NoConn ~ 3750 3650
NoConn ~ 3750 3550
NoConn ~ 3750 2800
$EndSCHEMATC
