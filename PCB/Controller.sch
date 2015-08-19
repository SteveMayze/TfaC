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
L GND #PWR09
U 1 1 5560D64D
P 3450 4800
F 0 "#PWR09" H 3450 4550 50  0001 C CNN
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
L GND #PWR010
U 1 1 5570FE29
P 7850 1650
F 0 "#PWR010" H 7850 1400 50  0001 C CNN
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
L GND #PWR011
U 1 1 55710077
P 2700 2900
F 0 "#PWR011" H 2700 2650 50  0001 C CNN
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
L GND #PWR012
U 1 1 55C0F9DC
P 10100 5850
F 0 "#PWR012" H 10100 5600 50  0001 C CNN
F 1 "GND" H 10100 5700 50  0000 C CNN
F 2 "" H 10100 5850 60  0000 C CNN
F 3 "" H 10100 5850 60  0000 C CNN
	1    10100 5850
	1    0    0    -1  
$EndComp
Text GLabel 8550 1750 0    60   Input ~ 0
Time_Set
Text GLabel 8600 2200 0    60   Input ~ 0
Alarm_Set
Text GLabel 8600 2650 0    60   Input ~ 0
Fast
Text GLabel 8600 3100 0    60   Input ~ 0
Slow
Text GLabel 8300 3700 0    60   Input ~ 0
Auto_Time
Text GLabel 8550 4350 0    60   Input ~ 0
Sleep
Text GLabel 8750 5550 0    60   Input ~ 0
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
P 9350 4800
F 0 "SW507" H 9000 4900 50  0000 C CNN
F 1 "Summer Time" H 9350 4720 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 9350 4800 60  0001 C CNN
F 3 "" H 9350 4800 60  0000 C CNN
	1    9350 4800
	1    0    0    -1  
$EndComp
Text GLabel 8700 4800 0    60   Input ~ 0
Summer_Time
Text GLabel 5900 4400 2    60   Input ~ 0
Summer_Time
NoConn ~ 5650 2200
NoConn ~ 5650 2800
NoConn ~ 5650 2900
NoConn ~ 5650 3350
NoConn ~ 5650 3450
NoConn ~ 5650 3550
NoConn ~ 3750 3650
NoConn ~ 3750 3550
NoConn ~ 3750 2800
$Comp
L TL3315NF160Q SW501
U 1 1 55D05D88
P 9300 1750
F 0 "SW501" V 9500 1750 60  0000 C CNN
F 1 "Time Set" V 9150 1750 60  0000 C CNN
F 2 "tfac-footprints:TL3315" H 9300 1700 60  0001 C CNN
F 3 "" H 9300 1700 60  0000 C CNN
F 4 "Value" H 9300 1750 60  0001 C CNN "MPN"
F 5 "Value" H 9300 1750 60  0001 C CNN "ConradPN"
F 6 "Value" H 9600 1750 60  0001 C CNN "Label"
	1    9300 1750
	0    -1   -1   0   
$EndComp
$Comp
L TL3315NF160Q SW502
U 1 1 55D05FEA
P 9300 2200
F 0 "SW502" V 9450 2200 60  0000 C CNN
F 1 "Alarm Set" V 9150 2200 60  0000 C CNN
F 2 "tfac-footprints:TL3315" H 9300 2150 60  0001 C CNN
F 3 "" H 9300 2150 60  0000 C CNN
	1    9300 2200
	0    -1   -1   0   
$EndComp
$Comp
L TL3315NF160Q SW503
U 1 1 55D0627F
P 9300 2650
F 0 "SW503" V 9450 2650 60  0000 C CNN
F 1 "Fast" V 9150 2650 60  0000 C CNN
F 2 "tfac-footprints:TL3315" H 9300 2600 60  0001 C CNN
F 3 "" H 9300 2600 60  0000 C CNN
	1    9300 2650
	0    -1   -1   0   
$EndComp
$Comp
L TL3315NF160Q SW504
U 1 1 55D06309
P 9300 3100
F 0 "SW504" V 9450 3100 60  0000 C CNN
F 1 "Slow" V 9150 3100 60  0000 C CNN
F 2 "tfac-footprints:TL3315" H 9300 3050 60  0001 C CNN
F 3 "" H 9300 3050 60  0000 C CNN
	1    9300 3100
	0    -1   -1   0   
$EndComp
$Comp
L TL3315NF160Q SW506
U 1 1 55D06511
P 9300 4350
F 0 "SW506" V 9450 4350 60  0000 C CNN
F 1 "Sleep" V 9150 4350 60  0000 C CNN
F 2 "tfac-footprints:TL3315" H 9300 4300 60  0001 C CNN
F 3 "" H 9300 4300 60  0000 C CNN
	1    9300 4350
	0    -1   -1   0   
$EndComp
$Comp
L SWITCH_INV SW505
U 1 1 55D06426
P 9150 3700
F 0 "SW505" H 8950 3850 50  0000 C CNN
F 1 "Auto Time" H 9000 3550 50  0000 C CNN
F 2 "tfac-footprints:AYZ0202AGRLC" H 9150 3700 60  0001 C CNN
F 3 "" H 9150 3700 60  0000 C CNN
	1    9150 3700
	1    0    0    -1  
$EndComp
$Comp
L SWITCH_INV SW508
U 1 1 55D066FA
P 9400 5550
F 0 "SW508" H 9200 5700 50  0000 C CNN
F 1 "Alarm Enabled" H 9250 5400 50  0000 C CNN
F 2 "tfac-footprints:CLSB12C01" H 9400 5550 60  0001 C CNN
F 3 "" H 9400 5550 60  0000 C CNN
	1    9400 5550
	1    0    0    -1  
$EndComp
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
	10100 1750 10100 5850
Connection ~ 10100 3800
Wire Wire Line
	8550 1750 8950 1750
Wire Wire Line
	8600 2200 8950 2200
Wire Wire Line
	8600 2650 8950 2650
Wire Wire Line
	8600 3100 8950 3100
Wire Wire Line
	8300 3700 8650 3700
Wire Wire Line
	8550 4350 8900 4350
Wire Wire Line
	8750 5550 8900 5550
Wire Wire Line
	5650 3800 5900 3800
Wire Wire Line
	5650 3900 6600 3900
Wire Wire Line
	5650 4000 5900 4000
Wire Wire Line
	8700 4800 9050 4800
Wire Wire Line
	10100 4800 9650 4800
Connection ~ 10100 4800
Wire Wire Line
	10100 5650 9900 5650
Connection ~ 10100 5650
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
Wire Wire Line
	9050 1650 8950 1650
Wire Wire Line
	8950 1650 8950 1850
Wire Wire Line
	8950 1850 9050 1850
Connection ~ 8950 1750
Wire Wire Line
	9550 1650 9650 1650
Wire Wire Line
	9650 1650 9650 1850
Wire Wire Line
	9650 1850 9550 1850
Wire Wire Line
	9650 1750 10100 1750
Connection ~ 9650 1750
Wire Wire Line
	9050 2100 8950 2100
Wire Wire Line
	8950 2100 8950 2300
Wire Wire Line
	8950 2300 9050 2300
Connection ~ 8950 2200
Wire Wire Line
	9550 2100 9650 2100
Wire Wire Line
	9650 2100 9650 2300
Wire Wire Line
	9650 2300 9550 2300
Wire Wire Line
	9650 2200 10100 2200
Connection ~ 10100 2200
Connection ~ 9650 2200
Wire Wire Line
	9050 2550 8950 2550
Wire Wire Line
	8950 2550 8950 2750
Wire Wire Line
	8950 2750 9050 2750
Connection ~ 8950 2650
Wire Wire Line
	9550 2550 9650 2550
Wire Wire Line
	9650 2550 9650 2750
Wire Wire Line
	9650 2750 9550 2750
Wire Wire Line
	9650 2650 10100 2650
Connection ~ 10100 2650
Connection ~ 9650 2650
Wire Wire Line
	9650 3800 10100 3800
NoConn ~ 9650 3600
Wire Wire Line
	9050 3000 8950 3000
Wire Wire Line
	8950 3000 8950 3200
Wire Wire Line
	8950 3200 9050 3200
Connection ~ 8950 3100
Wire Wire Line
	9550 3000 9650 3000
Wire Wire Line
	9650 3000 9650 3200
Wire Wire Line
	9650 3200 9550 3200
Wire Wire Line
	9650 3100 10100 3100
Connection ~ 10100 3100
Connection ~ 9650 3100
Wire Wire Line
	9050 4250 8900 4250
Wire Wire Line
	8900 4250 8900 4450
Wire Wire Line
	8900 4450 9050 4450
Connection ~ 8900 4350
Wire Wire Line
	9550 4250 9650 4250
Wire Wire Line
	9650 4250 9650 4450
Wire Wire Line
	9650 4450 9550 4450
Wire Wire Line
	9650 4350 10100 4350
Connection ~ 10100 4350
Connection ~ 9650 4350
NoConn ~ 9900 5450
NoConn ~ 9300 3850
$EndSCHEMATC
