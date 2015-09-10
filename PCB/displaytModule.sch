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
Sheet 3 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 2750 1800 0    60   Input ~ 0
MISO
Text HLabel 2750 2100 0    60   Input ~ 0
~SS
Text HLabel 2750 1650 0    60   Input ~ 0
Vcc
$Comp
L DisplayModule M301
U 1 1 559837A8
P 3700 1950
F 0 "M301" V 4200 2200 60  0000 C CNN
F 1 "DisplayModule" H 3700 2050 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05" H 3700 1950 60  0001 C CNN
F 3 "" H 3700 1950 60  0000 C CNN
	1    3700 1950
	0    1    1    0   
$EndComp
Text Notes 2500 3000 0    60   ~ 0
This will be represeted by a 5 pole angled pin header. \nThe display module will plug into this. Nothing more\nis needed here. The display module is being \ndeveloped in another project.
$Comp
L R R?
U 1 1 55F1C62E
P 3050 1800
F 0 "R?" V 3130 1800 50  0000 C CNN
F 1 "1kΩ" V 3050 1800 50  0000 C CNN
F 2 "" V 2980 1800 30  0000 C CNN
F 3 "" H 3050 1800 30  0000 C CNN
	1    3050 1800
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 55F1C655
P 3050 1950
F 0 "R?" V 3130 1950 50  0000 C CNN
F 1 "1kΩ" V 3050 1950 50  0000 C CNN
F 2 "" V 2980 1950 30  0000 C CNN
F 3 "" H 3050 1950 30  0000 C CNN
	1    3050 1950
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 55F1C67F
P 3050 2100
F 0 "R?" V 3130 2100 50  0000 C CNN
F 1 "1kΩ" V 3050 2100 50  0000 C CNN
F 2 "" V 2980 2100 30  0000 C CNN
F 3 "" H 3050 2100 30  0000 C CNN
	1    3050 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	2750 1650 3300 1650
Wire Wire Line
	2750 1800 2900 1800
Wire Wire Line
	3200 1800 3300 1800
Wire Wire Line
	2750 1950 2900 1950
Wire Wire Line
	3200 1950 3300 1950
Wire Wire Line
	2750 2100 2900 2100
Wire Wire Line
	3200 2100 3300 2100
$Comp
L GND #PWR?
U 1 1 55F1C70D
P 3150 2400
F 0 "#PWR?" H 3150 2150 50  0001 C CNN
F 1 "GND" H 3150 2250 50  0000 C CNN
F 2 "" H 3150 2400 60  0000 C CNN
F 3 "" H 3150 2400 60  0000 C CNN
	1    3150 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2250 3150 2250
Wire Wire Line
	3150 2250 3150 2400
Text HLabel 2750 1950 0    60   Input ~ 0
SCK
$EndSCHEMATC
