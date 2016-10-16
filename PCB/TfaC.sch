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
Sheet 1 5
Title "TfaC - Arlarm Clock Restoration Project."
Date ""
Rev "2L.3"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 2400 850  1000 800 
U 5560D23E
F0 "Power System" 60
F1 "powerSystem.sch" 60
F2 "Vin" I L 2400 1050 60 
F3 "Vcc" O R 3400 1100 60 
F4 "Vbb" O R 3400 1400 60 
$EndSheet
$Sheet
S 4550 5250 1300 800 
U 5560D289
F0 "Display Module" 60
F1 "displaytModule.sch" 60
F2 "~SS" I L 4550 5550 60 
F3 "MISO" I R 5850 5600 60 
F4 "MOSI" I R 5850 5450 60 
F5 "SCK" I R 5850 5750 60 
F6 "Vcc" I L 4550 5800 60 
F7 "Reset" I L 4550 5350 60 
$EndSheet
$Sheet
S 4550 3200 1300 1600
U 5560D2A4
F0 "RTC Module" 60
F1 "RTCModule.sch" 60
F2 "Vbb" I L 4550 4000 60 
F3 "Vcc" I L 4550 3800 60 
F4 "~SS" I L 4550 3500 60 
F5 "MOSI" I R 5850 4200 60 
F6 "SCK" I R 5850 4550 60 
F7 "MISO" I R 5850 4350 60 
F8 "Periodic_INT" I R 5850 3850 60 
F9 "DCF_RCPT" I R 5850 3650 60 
F10 "ALARM_INT" I R 5850 3450 60 
$EndSheet
$Comp
L CONN_01X02 P101
U 1 1 5565E10C
P 1200 1100
F 0 "P101" H 1200 1250 50  0000 C CNN
F 1 "Line" H 1200 950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 1200 1100 60  0001 C CNN
F 3 "" H 1200 1100 60  0000 C CNN
	1    1200 1100
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 5565E1CF
P 1500 1350
F 0 "#PWR01" H 1500 1100 50  0001 C CNN
F 1 "GND" H 1500 1200 50  0000 C CNN
F 2 "" H 1500 1350 60  0000 C CNN
F 3 "" H 1500 1350 60  0000 C CNN
	1    1500 1350
	1    0    0    -1  
$EndComp
$Sheet
S 4150 1300 1200 1550
U 5560D274
F0 "Controller" 60
F1 "Controller.sch" 60
F2 "Vcc" I L 4150 1600 60 
F3 "MOSI" I R 5350 1750 60 
F4 "MISO" I R 5350 1600 60 
F5 "SCK" I R 5350 1450 60 
F6 "~DISPLAY_SELECT" I L 4150 1750 60 
F7 "~RTC_SELECT" I L 4150 1900 60 
F8 "Periodic_INT" I R 5350 2050 60 
F9 "DCF_RCPT" I R 5350 2200 60 
F10 "ALARM_INT" I R 5350 2400 60 
F11 "Reset" I L 4150 2350 60 
$EndSheet
Wire Wire Line
	1400 1050 2400 1050
Wire Wire Line
	1400 1150 1500 1150
Wire Wire Line
	1500 1150 1500 1350
Wire Wire Line
	6250 2050 6250 3850
Wire Wire Line
	6250 3850 5850 3850
Wire Wire Line
	6150 3650 5850 3650
Wire Wire Line
	6050 2400 6050 3450
Wire Wire Line
	6050 3450 5850 3450
Wire Wire Line
	3400 1100 3700 1100
Wire Wire Line
	3700 1100 3700 5800
Wire Wire Line
	3700 1600 4150 1600
Wire Wire Line
	3700 3800 4550 3800
Connection ~ 3700 1600
Wire Wire Line
	3400 1400 3550 1400
Wire Wire Line
	3550 1400 3550 4000
Wire Wire Line
	3550 4000 4550 4000
Wire Wire Line
	3700 5800 4550 5800
Connection ~ 3700 3800
Wire Wire Line
	4150 1750 3800 1750
Wire Wire Line
	3800 1750 3800 5550
Wire Wire Line
	3800 5550 4550 5550
Wire Wire Line
	4150 1900 3900 1900
Wire Wire Line
	3900 1900 3900 3500
Wire Wire Line
	3900 3500 4550 3500
Wire Wire Line
	6500 1750 6500 5450
Wire Wire Line
	6500 4200 5850 4200
Wire Wire Line
	6600 1600 6600 5600
Wire Wire Line
	6600 4350 5850 4350
Wire Wire Line
	6700 1450 6700 5750
Wire Wire Line
	6700 4550 5850 4550
Wire Wire Line
	6500 5450 5850 5450
Connection ~ 6500 4200
Wire Wire Line
	6600 5600 5850 5600
Connection ~ 6600 4350
Wire Wire Line
	6700 5750 5850 5750
Connection ~ 6700 4550
Wire Wire Line
	5350 2400 6050 2400
Wire Wire Line
	5350 2200 6150 2200
Wire Wire Line
	6150 2200 6150 3650
Wire Wire Line
	5350 2050 6250 2050
Wire Wire Line
	5350 1450 6700 1450
Wire Wire Line
	5350 1600 6600 1600
Wire Wire Line
	5350 1750 6500 1750
Wire Wire Line
	4150 2350 4050 2350
Wire Wire Line
	4050 2350 4050 5350
Wire Wire Line
	4050 5350 4550 5350
$EndSCHEMATC
