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
Text HLabel 3350 2200 0    60   Input ~ 0
~SS
Text HLabel 3350 1650 0    60   Input ~ 0
Vcc
$Comp
L DisplayModule M301
U 1 1 559837A8
P 4000 2100
F 0 "M301" H 3600 1650 60  0000 C CNN
F 1 "DisplayModule" H 4000 2700 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06" H 4000 2100 60  0001 C CNN
F 3 "" H 4000 2100 60  0000 C CNN
	1    4000 2100
	-1   0    0    -1  
$EndComp
Text Notes 2650 1300 0    60   ~ 0
This will be represeted by a 5 pole angled pin header. \nThe display module will plug into this. Nothing more\nis needed here. The display module is being \ndeveloped in another project.
Wire Wire Line
	3350 1650 3550 1650
Wire Wire Line
	3350 2000 3550 2000
Wire Wire Line
	3350 2200 3550 2200
$Comp
L GND #PWR08
U 1 1 55F1C70D
P 4150 2900
F 0 "#PWR08" H 4150 2650 50  0001 C CNN
F 1 "GND" H 4150 2750 50  0000 C CNN
F 2 "" H 4150 2900 60  0000 C CNN
F 3 "" H 4150 2900 60  0000 C CNN
	1    4150 2900
	1    0    0    -1  
$EndComp
Text HLabel 3350 2100 0    60   Input ~ 0
SCK
Text HLabel 3350 2000 0    60   Input ~ 0
MOSI
Wire Wire Line
	4150 2800 4150 2900
Wire Wire Line
	3350 2100 3550 2100
Text HLabel 3350 2400 0    60   Input ~ 0
Reset
Wire Wire Line
	3350 2400 3550 2400
$EndSCHEMATC
