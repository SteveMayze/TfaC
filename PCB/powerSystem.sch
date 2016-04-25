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
Sheet 2 5
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
L MCP1703T-5002E/CB U201
U 1 1 5565D3BF
P 5100 1600
F 0 "U201" H 5200 1450 50  0000 C CNN
F 1 "MCP1703T-5002E/CB" H 5100 1750 50  0000 C CNN
F 2 "tfac-footprints:SOT-23A" H 5100 1600 60  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22049e.pdf" H 5100 1600 60  0001 C CNN
F 4 "MCP1703T-5002E/CB" H 5100 1600 60  0001 C CNN "MPN"
F 5 "651424 - 62" H 5100 1600 60  0001 C CNN "ConradPN"
	1    5100 1600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5565D42B
P 5100 2650
F 0 "#PWR02" H 5100 2400 50  0001 C CNN
F 1 "GND" H 5100 2500 50  0000 C CNN
F 2 "" H 5100 2650 60  0000 C CNN
F 3 "" H 5100 2650 60  0000 C CNN
	1    5100 2650
	1    0    0    -1  
$EndComp
Text HLabel 3850 1600 0    60   Input ~ 0
Vin
Wire Wire Line
	3850 1600 4800 1600
Wire Wire Line
	5400 1600 7350 1600
Wire Wire Line
	5500 4000 8000 4000
$Comp
L C C204
U 1 1 5565DDF6
P 6350 4350
F 0 "C204" H 6375 4450 50  0000 L CNN
F 1 "1u" H 6375 4250 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6388 4200 30  0001 C CNN
F 3 "" H 6350 4350 60  0000 C CNN
	1    6350 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 4500 6350 4800
$Comp
L GND #PWR03
U 1 1 5565DE90
P 6350 4800
F 0 "#PWR03" H 6350 4550 50  0001 C CNN
F 1 "GND" H 6350 4650 50  0000 C CNN
F 2 "" H 6350 4800 60  0000 C CNN
F 3 "" H 6350 4800 60  0000 C CNN
	1    6350 4800
	1    0    0    -1  
$EndComp
Text HLabel 7350 1600 2    60   Output ~ 0
Vcc
Text HLabel 8000 4000 2    60   Output ~ 0
Vbb
Text HLabel 3500 4000 0    60   Input ~ 0
Vin
Connection ~ 5100 2550
$Comp
L GND #PWR04
U 1 1 556C9868
P 5050 4800
F 0 "#PWR04" H 5050 4550 50  0001 C CNN
F 1 "GND" H 5050 4650 50  0000 C CNN
F 2 "" H 5050 4800 60  0000 C CNN
F 3 "" H 5050 4800 60  0000 C CNN
	1    5050 4800
	1    0    0    -1  
$EndComp
$Comp
L R R201
U 1 1 556C98C6
P 4300 4250
F 0 "R201" V 4380 4250 50  0000 C CNN
F 1 "0" V 4300 4250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4230 4250 30  0001 C CNN
F 3 "" H 4300 4250 30  0000 C CNN
	1    4300 4250
	1    0    0    -1  
$EndComp
$Comp
L LD2979-RESCUE-TfaC-RESCUE-TfaC U202
U 1 1 556C9A30
P 5050 4000
AR Path="/556C9A30" Ref="U202"  Part="1" 
AR Path="/5560D23E/556C9A30" Ref="U202"  Part="1" 
F 0 "U202" H 5350 3350 50  0000 C CNN
F 1 "LD2979" H 5050 4150 50  0000 C CNN
F 2 "tfac-footprints:SOT-23-5L" H 5050 4000 60  0001 C CNN
F 3 "" H 5050 4000 60  0000 C CNN
	1    5050 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 4700 5050 4800
Wire Wire Line
	3500 4000 4600 4000
Wire Wire Line
	4300 4000 4300 4100
Connection ~ 4300 4000
Wire Wire Line
	4300 4400 4300 4500
Wire Wire Line
	4300 4500 4600 4500
$Comp
L C C202
U 1 1 556C9E21
P 4350 1900
F 0 "C202" H 4375 2000 50  0000 L CNN
F 1 "1u" H 4375 1800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4388 1750 30  0001 C CNN
F 3 "" H 4350 1900 60  0000 C CNN
F 4 "Value" H 4350 1900 60  0001 C CNN "MPN"
F 5 "Value" H 4350 1900 60  0001 C CNN "ConradPN"
	1    4350 1900
	1    0    0    -1  
$EndComp
$Comp
L C C203
U 1 1 556C9E5C
P 5750 1900
F 0 "C203" H 5775 2000 50  0000 L CNN
F 1 "1u" H 5775 1800 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5788 1750 30  0001 C CNN
F 3 "" H 5750 1900 60  0000 C CNN
	1    5750 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 1800 5100 2650
Wire Wire Line
	4350 2050 4350 2550
Wire Wire Line
	5750 2550 5750 2050
Connection ~ 3750 4000
Wire Wire Line
	3750 4000 3750 4200
$Comp
L C C201
U 1 1 5565DCBC
P 3750 4350
F 0 "C201" H 3775 4450 50  0000 L CNN
F 1 "1u" H 3775 4250 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3788 4200 30  0001 C CNN
F 3 "" H 3750 4350 60  0000 C CNN
	1    3750 4350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 5565DD5B
P 3750 4800
F 0 "#PWR05" H 3750 4550 50  0001 C CNN
F 1 "GND" H 3750 4650 50  0000 C CNN
F 2 "" H 3750 4800 60  0000 C CNN
F 3 "" H 3750 4800 60  0000 C CNN
	1    3750 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4500 3750 4800
Wire Wire Line
	4350 1750 4350 1600
Connection ~ 4350 1600
Wire Wire Line
	5750 1750 5750 1600
Connection ~ 5750 1600
Wire Wire Line
	6350 4200 6350 4000
Connection ~ 6350 4000
Wire Wire Line
	4350 2550 5750 2550
Text Notes 3400 3850 0    60   ~ 0
Consider patching this to Vcc rather \nthan Vin due to power dispation \ngoing from say 7V5 Vin to \n3V3 Vbb x 15mA.
Text Notes 4300 1300 0    60   ~ 0
The power requirement is still not set.\nThe case may have to be changed to allow\nbetter heat disipation.
$Comp
L LED D201
U 1 1 564D71D7
P 6700 2000
F 0 "D201" H 6700 2100 50  0000 C CNN
F 1 "LED" H 6700 1900 50  0000 C CNN
F 2 "LEDs:LED-0805" H 6700 2000 60  0001 C CNN
F 3 "" H 6700 2000 60  0000 C CNN
	1    6700 2000
	0    -1   -1   0   
$EndComp
$Comp
L R R202
U 1 1 564D7317
P 6700 2550
F 0 "R202" V 6780 2550 50  0000 C CNN
F 1 "480Ω" H 6500 2600 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6630 2550 30  0001 C CNN
F 3 "" H 6700 2550 30  0000 C CNN
	1    6700 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 1600 6700 1800
Connection ~ 6700 1600
Wire Wire Line
	6700 2200 6700 2400
$Comp
L GND #PWR06
U 1 1 564D7417
P 6700 2950
F 0 "#PWR06" H 6700 2700 50  0001 C CNN
F 1 "GND" H 6700 2800 50  0000 C CNN
F 2 "" H 6700 2950 60  0000 C CNN
F 3 "" H 6700 2950 60  0000 C CNN
	1    6700 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 2700 6700 2950
$Comp
L LED D202
U 1 1 564D751D
P 7300 4600
F 0 "D202" H 7300 4700 50  0000 C CNN
F 1 "LED" H 7300 4500 50  0000 C CNN
F 2 "LEDs:LED-0805" H 7300 4600 60  0001 C CNN
F 3 "" H 7300 4600 60  0000 C CNN
	1    7300 4600
	0    -1   -1   0   
$EndComp
$Comp
L R R203
U 1 1 564D7523
P 7300 5150
F 0 "R203" V 7380 5150 50  0000 C CNN
F 1 "260Ω" H 7150 5200 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7230 5150 30  0001 C CNN
F 3 "" H 7300 5150 30  0000 C CNN
	1    7300 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 4000 7300 4400
Wire Wire Line
	7300 4800 7300 5000
$Comp
L GND #PWR07
U 1 1 564D752B
P 7300 5550
F 0 "#PWR07" H 7300 5300 50  0001 C CNN
F 1 "GND" H 7300 5400 50  0000 C CNN
F 2 "" H 7300 5550 60  0000 C CNN
F 3 "" H 7300 5550 60  0000 C CNN
	1    7300 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 5300 7300 5550
Connection ~ 7300 4000
$Comp
L TEST_1P W?
U 1 1 56E53D9F
P 6900 1500
F 0 "W?" H 6900 1770 50  0000 C CNN
F 1 "TEST_1P" H 6900 1700 50  0000 C CNN
F 2 "" H 7100 1500 50  0000 C CNN
F 3 "" H 7100 1500 50  0000 C CNN
	1    6900 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 1500 6900 1600
Connection ~ 6900 1600
$Comp
L TEST_1P W?
U 1 1 56E53EC3
P 7500 3950
F 0 "W?" H 7500 4220 50  0000 C CNN
F 1 "TEST_1P" H 7500 4150 50  0000 C CNN
F 2 "" H 7700 3950 50  0000 C CNN
F 3 "" H 7700 3950 50  0000 C CNN
	1    7500 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 3950 7500 4000
Connection ~ 7500 4000
$EndSCHEMATC
