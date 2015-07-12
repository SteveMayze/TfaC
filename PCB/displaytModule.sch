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
Text HLabel 2750 1950 0    60   Input ~ 0
MOSI
Text HLabel 2750 2100 0    60   Input ~ 0
SCK
Text HLabel 2750 2250 0    60   Input ~ 0
~SS
Text HLabel 2750 1650 0    60   Input ~ 0
Vcc
$Comp
L DisplayModule M?
U 1 1 559837A8
P 3700 1950
F 0 "M?" H 3400 2300 60  0000 C CNN
F 1 "DisplayModule" H 3700 2050 60  0000 C CNN
F 2 "" H 3700 1950 60  0000 C CNN
F 3 "" H 3700 1950 60  0000 C CNN
	1    3700 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	2750 1650 3300 1650
Wire Wire Line
	2750 1800 3300 1800
Wire Wire Line
	2750 1950 3300 1950
Wire Wire Line
	2750 2100 3300 2100
Wire Wire Line
	2750 2250 3300 2250
Text Notes 2500 3000 0    60   ~ 0
This will be represeted by a 5 pole angled pin header. \nThe display module will plug into this. Nothing more\nis needed here. The display module is being \ndeveloped in another project.
$EndSCHEMATC
