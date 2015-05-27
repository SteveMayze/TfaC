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
Sheet 1 5
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
S 3250 1300 1000 800 
U 5560D23E
F0 "Power System" 60
F1 "powerSystem.sch" 60
F2 "Vin" I L 3250 1500 60 
F3 "Vcc" O R 4250 1850 60 
$EndSheet
$Sheet
S 5400 2650 1200 800 
U 5560D274
F0 "Controller" 60
F1 "Controller.sch" 60
F2 "Vcc" I L 5400 2950 60 
$EndSheet
$Sheet
S 5400 5100 1300 800 
U 5560D289
F0 "Display Module" 60
F1 "displaytModule.sch" 60
$EndSheet
$Sheet
S 5400 3900 1300 750 
U 5560D2A4
F0 "RTC Module" 60
F1 "RTCModule.sch" 60
$EndSheet
$Comp
L CONN_01X02 P?
U 1 1 5565E10C
P 2050 1550
F 0 "P?" H 2050 1700 50  0000 C CNN
F 1 "Line" H 2050 1400 50  0000 C CNN
F 2 "" H 2050 1550 60  0000 C CNN
F 3 "" H 2050 1550 60  0000 C CNN
	1    2050 1550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2250 1500 3250 1500
$Comp
L GND #PWR?
U 1 1 5565E1CF
P 2350 1800
F 0 "#PWR?" H 2350 1550 50  0001 C CNN
F 1 "GND" H 2350 1650 50  0000 C CNN
F 2 "" H 2350 1800 60  0000 C CNN
F 3 "" H 2350 1800 60  0000 C CNN
	1    2350 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 1600 2350 1600
Wire Wire Line
	2350 1600 2350 1800
Wire Wire Line
	4250 1850 4800 1850
Wire Wire Line
	4800 1850 4800 2950
Wire Wire Line
	4800 2950 5400 2950
$EndSCHEMATC
