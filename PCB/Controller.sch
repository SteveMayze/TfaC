EESchema Schematic File Version 2
LIBS:TfaC-rescue
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
P 2650 2150
F 0 "IC501" H 1900 3400 40  0000 L BNN
F 1 "ATMEGA88-A" H 3100 750 40  0000 L BNN
F 2 "Housings_QFP:LQFP-32_7x7mm_Pitch0.8mm" H 2650 2150 30  0001 C CIN
F 3 "" H 2650 2150 60  0000 C CNN
	1    2650 2150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 5560D64D
P 1450 3650
F 0 "#PWR010" H 1450 3400 50  0001 C CNN
F 1 "GND" H 1450 3500 50  0000 C CNN
F 2 "" H 1450 3650 60  0000 C CNN
F 3 "" H 1450 3650 60  0000 C CNN
	1    1450 3650
	1    0    0    -1  
$EndComp
Text HLabel 1100 1050 0    60   Input ~ 0
Vcc
Text HLabel 4000 1350 2    60   Input ~ 0
MOSI
Text HLabel 4000 1450 2    60   Input ~ 0
MISO
Text HLabel 4000 1550 2    60   Input ~ 0
SCK
Text HLabel 4000 1250 2    60   Input ~ 0
~DISPLAY_SELECT
Text HLabel 4000 1650 2    60   Input ~ 0
~RTC_SELECT
Text HLabel 4050 1900 2    60   Input ~ 0
Periodic_INT
Text HLabel 4050 2000 2    60   Input ~ 0
DCF_RCPT
Text HLabel 4050 2100 2    60   Input ~ 0
ALARM_INT
$Comp
L CONN_02X03 P501
U 1 1 5570FD1E
P 6300 1200
F 0 "P501" H 6300 1400 50  0000 C CNN
F 1 "PRG" H 6300 1000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03" H 6300 0   60  0001 C CNN
F 3 "" H 6300 0   60  0000 C CNN
	1    6300 1200
	1    0    0    -1  
$EndComp
Text HLabel 5800 1100 0    60   Input ~ 0
MISO
Text HLabel 5800 1200 0    60   Input ~ 0
SCK
Text HLabel 6750 1200 2    60   Input ~ 0
MOSI
Text HLabel 6750 1100 2    60   Input ~ 0
Vcc
$Comp
L GND #PWR011
U 1 1 5570FE29
P 6800 1550
F 0 "#PWR011" H 6800 1300 50  0001 C CNN
F 1 "GND" H 6800 1400 50  0000 C CNN
F 2 "" H 6800 1550 60  0000 C CNN
F 3 "" H 6800 1550 60  0000 C CNN
	1    6800 1550
	1    0    0    -1  
$EndComp
$Comp
L C C501
U 1 1 5570FFE4
P 1350 1350
F 0 "C501" H 1375 1450 50  0000 L CNN
F 1 "100n" H 1375 1250 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1388 1200 30  0001 C CNN
F 3 "" H 1350 1350 60  0000 C CNN
	1    1350 1350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 55710077
P 1350 1750
F 0 "#PWR012" H 1350 1500 50  0001 C CNN
F 1 "GND" H 1350 1600 50  0000 C CNN
F 2 "" H 1350 1750 60  0000 C CNN
F 3 "" H 1350 1750 60  0000 C CNN
	1    1350 1750
	1    0    0    -1  
$EndComp
$Comp
L R R501
U 1 1 55710A4C
P 4500 2500
F 0 "R501" V 4580 2500 50  0000 C CNN
F 1 "10K" V 4500 2500 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4430 2500 30  0001 C CNN
F 3 "" H 4500 2500 30  0000 C CNN
	1    4500 2500
	0    1    1    0   
$EndComp
$Comp
L GND #PWR013
U 1 1 55C0F9DC
P 10100 5850
F 0 "#PWR013" H 10100 5600 50  0001 C CNN
F 1 "GND" H 10100 5700 50  0000 C CNN
F 2 "" H 10100 5850 60  0000 C CNN
F 3 "" H 10100 5850 60  0000 C CNN
	1    10100 5850
	1    0    0    -1  
$EndComp
Text GLabel 8550 1750 0    60   Input ~ 0
Time_Set
Text GLabel 8600 2650 0    60   Input ~ 0
Alarm_Set
Text GLabel 8600 2200 0    60   Input ~ 0
Fast
Text GLabel 8600 3100 0    60   Input ~ 0
Slow
Text GLabel 8650 3600 0    60   Input ~ 0
Auto_Time
Text GLabel 8550 4350 0    60   Input ~ 0
Sleep
Text GLabel 8750 5550 0    60   Input ~ 0
Alarm_Enabled
Text GLabel 3900 2650 2    60   Input ~ 0
Time_Set
Text GLabel 4600 2750 2    60   Input ~ 0
Alarm_Set
Text GLabel 3900 3050 2    60   Input ~ 0
Fast
Text GLabel 3900 2850 2    60   Input ~ 0
Slow
Text GLabel 4600 2950 2    60   Input ~ 0
Alarm_Enabled
Text GLabel 4600 3150 2    60   Input ~ 0
Sleep
Text GLabel 4600 3350 2    60   Input ~ 0
Auto_Time
$Comp
L SW_PUSH SW507
U 1 1 55C107C5
P 9350 4800
F 0 "SW507" H 9000 4850 50  0000 C CNN
F 1 "Summer Time" H 9350 4720 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 9350 4800 60  0001 C CNN
F 3 "" H 9350 4800 60  0000 C CNN
	1    9350 4800
	1    0    0    -1  
$EndComp
Text GLabel 8700 4800 0    60   Input ~ 0
Summer_Time
Text GLabel 3900 3250 2    60   Input ~ 0
Summer_Time
NoConn ~ 1750 2500
NoConn ~ 1750 2400
NoConn ~ 1750 1650
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
	1750 3150 1450 3150
Wire Wire Line
	1450 3150 1450 3650
Wire Wire Line
	1750 3250 1450 3250
Connection ~ 1450 3250
Wire Wire Line
	1750 3350 1450 3350
Connection ~ 1450 3350
Wire Wire Line
	1600 1050 1600 1350
Wire Wire Line
	1600 1150 1750 1150
Wire Wire Line
	1600 1350 1750 1350
Connection ~ 1600 1150
Wire Wire Line
	3650 1250 4000 1250
Wire Wire Line
	3650 1350 4000 1350
Wire Wire Line
	3650 1450 4000 1450
Wire Wire Line
	3650 1550 4000 1550
Wire Wire Line
	3650 1150 4300 1150
Wire Wire Line
	3650 1900 4050 1900
Wire Wire Line
	3650 2000 4050 2000
Wire Wire Line
	3650 2100 4050 2100
Wire Wire Line
	6550 1300 6800 1300
Wire Wire Line
	6800 1300 6800 1550
Wire Wire Line
	6550 1200 6750 1200
Wire Wire Line
	6550 1100 6750 1100
Wire Wire Line
	6050 1100 5800 1100
Wire Wire Line
	6050 1200 5800 1200
Wire Wire Line
	1350 1500 1350 1750
Connection ~ 1600 1050
Wire Wire Line
	5800 1300 6050 1300
Wire Wire Line
	10100 1750 10100 5850
Wire Wire Line
	8550 1750 8950 1750
Wire Wire Line
	8600 2200 8950 2200
Wire Wire Line
	8600 2650 8950 2650
Wire Wire Line
	8600 3100 8950 3100
Wire Wire Line
	8550 4350 8900 4350
Wire Wire Line
	8750 5550 8900 5550
Wire Wire Line
	3650 2650 3900 2650
Wire Wire Line
	3650 2750 4600 2750
Wire Wire Line
	3650 2850 3900 2850
Wire Wire Line
	8700 4800 9050 4800
Wire Wire Line
	10100 4800 9650 4800
Connection ~ 10100 4800
Wire Wire Line
	10100 5650 9900 5650
Connection ~ 10100 5650
Wire Wire Line
	3650 2950 4600 2950
Wire Wire Line
	3650 3050 3900 3050
Wire Wire Line
	3650 3150 4600 3150
Wire Wire Line
	3650 3250 3900 3250
Wire Wire Line
	3650 3350 4600 3350
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
Wire Wire Line
	1100 1050 1750 1050
Wire Wire Line
	3650 2500 4350 2500
Wire Wire Line
	4650 2500 4750 2500
Wire Wire Line
	1350 1200 1350 1050
Connection ~ 1350 1050
Text HLabel 4750 2500 2    60   Input ~ 0
Vcc
Wire Wire Line
	4750 2400 4100 2400
Wire Wire Line
	4100 2400 4100 2500
Connection ~ 4100 2500
$Comp
L LED D501
U 1 1 564D7767
P 2300 4150
F 0 "D501" H 2300 4250 50  0000 C CNN
F 1 "LED" H 2300 4050 50  0000 C CNN
F 2 "LEDs:LED_0805" H 2300 4150 60  0001 C CNN
F 3 "" H 2300 4150 60  0000 C CNN
F 4 "Value" H 2300 4150 60  0001 C CNN "DigiKeyPN"
F 5 "Value" H 2300 4150 60  0001 C CNN "Voltage"
F 6 "Value" H 2300 4150 60  0001 C CNN "ConradPN"
F 7 "Value" H 2300 4150 60  0001 C CNN "Link"
F 8 "No" H 2300 4150 60  0001 C CNN "On-Hand"
	1    2300 4150
	-1   0    0    1   
$EndComp
$Comp
L R R502
U 1 1 564D780E
P 2750 4150
F 0 "R502" V 2830 4150 50  0000 C CNN
F 1 "480Ω" V 2650 4150 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2680 4150 30  0001 C CNN
F 3 "" H 2750 4150 30  0000 C CNN
	1    2750 4150
	0    1    1    0   
$EndComp
$Comp
L GND #PWR014
U 1 1 564D788E
P 3050 4250
F 0 "#PWR014" H 3050 4000 50  0001 C CNN
F 1 "GND" H 3050 4100 50  0000 C CNN
F 2 "" H 3050 4250 60  0000 C CNN
F 3 "" H 3050 4250 60  0000 C CNN
	1    3050 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4150 2600 4150
Wire Wire Line
	2900 4150 3050 4150
Wire Wire Line
	3050 4150 3050 4250
Text Label 4250 2200 2    60   ~ 0
Heartbeat
Text HLabel 4750 2400 2    60   Input ~ 0
Reset
Text HLabel 5800 1300 0    60   Input ~ 0
Reset
Text HLabel 3650 4100 0    60   Input ~ 0
Reset
Wire Wire Line
	3650 4100 4000 4100
$Comp
L GND #PWR015
U 1 1 5660B31D
P 4800 4250
F 0 "#PWR015" H 4800 4000 50  0001 C CNN
F 1 "GND" H 4800 4100 50  0000 C CNN
F 2 "" H 4800 4250 60  0000 C CNN
F 3 "" H 4800 4250 60  0000 C CNN
	1    4800 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 4100 4800 4100
Wire Wire Line
	4800 4100 4800 4250
$Comp
L TL3315NF160Q SW509
U 1 1 566C6130
P 4250 4200
F 0 "SW509" V 4400 4200 60  0000 C CNN
F 1 "Reset" V 4100 4200 60  0000 C CNN
F 2 "tfac-footprints:PTS525SM15SMTR2LFS" H 4250 4150 60  0001 C CNN
F 3 "" H 4250 4150 60  0000 C CNN
	1    4250 4200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3900 4100 3900 4300
Wire Wire Line
	3900 4300 4000 4300
Connection ~ 3900 4100
Wire Wire Line
	4500 4300 4600 4300
Wire Wire Line
	4600 4300 4600 4100
Connection ~ 4600 4100
Text Label 1600 4150 0    60   ~ 0
Heartbeat
Wire Wire Line
	2100 4150 1600 4150
Wire Wire Line
	3650 1650 4000 1650
Text Label 4300 1150 2    60   ~ 0
Buzzer
Wire Wire Line
	3650 2200 4250 2200
NoConn ~ 3650 1050
NoConn ~ 3650 1750
NoConn ~ 3650 2400
Wire Wire Line
	6500 4350 6500 4550
Wire Wire Line
	6500 4350 7000 4350
Wire Wire Line
	7000 4350 7000 4600
Wire Wire Line
	6500 4850 6500 5050
Wire Wire Line
	6500 5050 7000 5050
Wire Wire Line
	7000 5050 7000 4800
Wire Wire Line
	6750 4350 6750 4200
Wire Wire Line
	6750 4200 6500 4200
Connection ~ 6750 4350
Text Label 6100 5450 0    60   ~ 0
Buzzer
$Comp
L GND #PWR016
U 1 1 56E475A8
P 6750 5800
F 0 "#PWR016" H 6750 5550 50  0001 C CNN
F 1 "GND" H 6750 5650 50  0000 C CNN
F 2 "" H 6750 5800 60  0000 C CNN
F 3 "" H 6750 5800 60  0000 C CNN
	1    6750 5800
	1    0    0    -1  
$EndComp
Text Notes 5100 6400 0    60   ~ 0
BJT requires a Vce (breakdown)\nof 60V or more!\n\nBe sure to check the footprint!
Text Notes 5550 5450 0    60   ~ 0
PWM signal
Wire Wire Line
	6450 5450 6100 5450
Wire Wire Line
	6750 5650 6750 5800
Wire Wire Line
	6750 5250 6750 5050
Connection ~ 6750 5050
$Comp
L SPEAKER SP501
U 1 1 5787E352
P 7300 4700
F 0 "SP501" H 7200 4950 50  0000 C CNN
F 1 "CT-1205-SMT" H 7200 4450 50  0000 C CNN
F 2 "tfac-footprints:CT-1205-SMT" H 7300 4700 50  0001 C CNN
F 3 "http://www.cui.com/product/resource/ct-1205-smt.pdf" H 7300 4700 50  0001 C CNN
F 4 "102-1199-2-ND" H 7300 4700 60  0001 C CNN "DigiKeyPN"
F 5 "Value" H 7300 4700 60  0001 C CNN "Voltage"
F 6 "Value" H 7300 4700 60  0001 C CNN "ConradPN"
F 7 "Value" H 7300 4700 60  0001 C CNN "Link"
F 8 "Yes" H 7300 4700 60  0001 C CNN "On-Hand"
	1    7300 4700
	1    0    0    -1  
$EndComp
$Comp
L D D503
U 1 1 5787E3E5
P 6500 4700
F 0 "D503" H 6500 4800 50  0000 C CNN
F 1 "1N4148W" H 6500 4600 50  0000 C CNN
F 2 "Diodes_SMD:SOD-123" H 6500 4700 50  0001 C CNN
F 3 "http://www.vishay.com/docs/85887/1n4148wfl-g.pdf" H 6500 4700 50  0001 C CNN
F 4 "Value" H 6500 4700 60  0001 C CNN "DigiKeyPN"
F 5 "Value" H 6500 4700 60  0001 C CNN "Voltage"
F 6 "Value" H 6500 4700 60  0001 C CNN "ConradPN"
F 7 "Value" H 6500 4700 60  0001 C CNN "Link"
F 8 "Yes" H 6500 4700 60  0001 C CNN "On-Hand"
F 9 "Value" H 6500 4700 60  0001 C CNN " 1N4148WFL-G3-08GICT-ND "
	1    6500 4700
	0    1    1    0   
$EndComp
$Comp
L Q_NPN_BCE Q501
U 1 1 5787E5A8
P 6650 5450
F 0 "Q501" H 7100 5500 50  0000 R CNN
F 1 "2SD2391" H 7250 5400 50  0000 R CNN
F 2 "TO_SOT_Packages_SMD:SOT89-3_Housing" H 6850 5550 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/discrete/transistor/bipolar/2sd2391t100q-e.pdf" H 6650 5450 50  0001 C CNN
F 4 "Value" H 6650 5450 60  0001 C CNN "DigiKeyPN"
F 5 "Value" H 6650 5450 60  0001 C CNN "Voltage"
F 6 "Value" H 6650 5450 60  0001 C CNN "ConradPN"
F 7 "Value" H 6650 5450 60  0001 C CNN "Link"
F 8 "Yes" H 6650 5450 60  0001 C CNN "On-Hand"
	1    6650 5450
	1    0    0    -1  
$EndComp
NoConn ~ 3650 2300
Text HLabel 6500 4200 0    60   Input ~ 0
Vcc
$Comp
L CONN_01X02 SW505
U 1 1 579AA172
P 9300 3650
F 0 "SW505" H 9300 3800 50  0000 C CNN
F 1 "AUTO_TIME" H 9250 3450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 9300 3650 50  0001 C CNN
F 3 "" H 9300 3650 50  0000 C CNN
	1    9300 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 3600 9100 3600
$Comp
L GND #PWR017
U 1 1 579AA3CB
P 8900 3850
F 0 "#PWR017" H 8900 3600 50  0001 C CNN
F 1 "GND" H 8900 3700 50  0000 C CNN
F 2 "" H 8900 3850 60  0000 C CNN
F 3 "" H 8900 3850 60  0000 C CNN
	1    8900 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 3700 8900 3700
Wire Wire Line
	8900 3700 8900 3850
$EndSCHEMATC
