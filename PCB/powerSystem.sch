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
	5400 1600 6450 1600
Wire Wire Line
	5500 4000 6600 4000
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
Text HLabel 6450 1600 2    60   Output ~ 0
Vcc
Text HLabel 6600 4000 2    60   Output ~ 0
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
$EndSCHEMATC
