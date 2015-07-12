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
Text HLabel 2750 2200 0    60   Input ~ 0
Vcc
Wire Wire Line
	3600 2200 3600 2500
Wire Wire Line
	3600 2300 3750 2300
Wire Wire Line
	3600 2500 3750 2500
Connection ~ 3600 2300
Text HLabel 6000 2500 2    60   Input ~ 0
MOSI
Text HLabel 6000 2600 2    60   Input ~ 0
MISO
Text HLabel 6000 2700 2    60   Input ~ 0
SCK
Text HLabel 6000 2400 2    60   Input ~ 0
~DISPLAY_SELECT
Wire Wire Line
	5650 2400 6000 2400
Wire Wire Line
	5650 2500 6000 2500
Wire Wire Line
	5650 2600 6000 2600
Wire Wire Line
	5650 2700 6000 2700
Text HLabel 6000 2300 2    60   Input ~ 0
~RTC_SELECT
Wire Wire Line
	5650 2300 6000 2300
Text HLabel 6050 3050 2    60   Input ~ 0
Periodic_INT
Text HLabel 6050 3150 2    60   Input ~ 0
DCF_RCPT
Text HLabel 6050 3250 2    60   Input ~ 0
ALARM_INT
Wire Wire Line
	5650 3050 6050 3050
Wire Wire Line
	5650 3150 6050 3150
Wire Wire Line
	5650 3250 6050 3250
$Comp
L CONN_02X03 P?
U 1 1 5570FD1E
P 7600 3550
F 0 "P?" H 7600 3750 50  0000 C CNN
F 1 "PRG" H 7600 3350 50  0000 C CNN
F 2 "" H 7600 2350 60  0000 C CNN
F 3 "" H 7600 2350 60  0000 C CNN
	1    7600 3550
	1    0    0    -1  
$EndComp
Text HLabel 7100 3450 0    60   Input ~ 0
MISO
Text HLabel 7100 3550 0    60   Input ~ 0
SCK
Text HLabel 8050 3550 2    60   Input ~ 0
MOSI
Text HLabel 8050 3450 2    60   Input ~ 0
Vcc
$Comp
L GND #PWR?
U 1 1 5570FE29
P 8100 3900
F 0 "#PWR?" H 8100 3650 50  0001 C CNN
F 1 "GND" H 8100 3750 50  0000 C CNN
F 2 "" H 8100 3900 60  0000 C CNN
F 3 "" H 8100 3900 60  0000 C CNN
	1    8100 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 3650 8100 3650
Wire Wire Line
	8100 3650 8100 3900
Wire Wire Line
	7850 3550 8050 3550
Wire Wire Line
	7850 3450 8050 3450
Wire Wire Line
	7350 3450 7100 3450
Wire Wire Line
	7350 3550 7100 3550
$Comp
L C C?
U 1 1 5570FFE4
P 3250 2500
F 0 "C?" H 3275 2600 50  0000 L CNN
F 1 "100n" H 3275 2400 50  0000 L CNN
F 2 "" H 3288 2350 30  0000 C CNN
F 3 "" H 3250 2500 60  0000 C CNN
	1    3250 2500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 55710077
P 3250 2900
F 0 "#PWR?" H 3250 2650 50  0001 C CNN
F 1 "GND" H 3250 2750 50  0000 C CNN
F 2 "" H 3250 2900 60  0000 C CNN
F 3 "" H 3250 2900 60  0000 C CNN
	1    3250 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 2650 3250 2900
$Comp
L R R?
U 1 1 55710A4C
P 6300 3900
F 0 "R?" V 6380 3900 50  0000 C CNN
F 1 "10K" V 6300 3900 50  0000 C CNN
F 2 "" V 6230 3900 30  0000 C CNN
F 3 "" H 6300 3900 30  0000 C CNN
	1    6300 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	5650 3650 7350 3650
Wire Wire Line
	2750 2200 3750 2200
Connection ~ 3600 2200
Text HLabel 6750 3900 2    60   Input ~ 0
Vcc
Wire Wire Line
	6750 3900 6450 3900
Wire Wire Line
	6150 3900 6000 3900
Wire Wire Line
	6000 3900 6000 3650
Connection ~ 6000 3650
Wire Wire Line
	3250 2350 3250 2200
Connection ~ 3250 2200
$EndSCHEMATC
