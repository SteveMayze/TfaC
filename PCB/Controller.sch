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
LIBS:special
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
$Comp
L ATMEGA88-A IC?
U 1 1 5560D585
P 4650 3300
F 0 "IC?" H 3900 4550 40  0000 L BNN
F 1 "ATMEGA88-A" H 5100 1900 40  0000 L BNN
F 2 "TQFP32" H 4650 3300 30  0000 C CIN
F 3 "" H 4650 3300 60  0000 C CNN
	1    4650 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5560D64D
P 3450 4800
F 0 "#PWR?" H 3450 4550 50  0001 C CNN
F 1 "GND" H 3450 4650 50  0000 C CNN
F 2 "" H 3450 4800 60  0000 C CNN
F 3 "" H 3450 4800 60  0000 C CNN
	1    3450 4800
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
$EndSCHEMATC
