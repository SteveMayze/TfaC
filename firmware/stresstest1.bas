

' ============================================================================
' Alarm Clock
'
' Seven Segment display, plus Colon, plus AM/PM sign
' The display is driven from PORT-B, pins 1-7
' The Colon is driven by PORT-B pin 0
'
' The multiplexing of the four digits will be driven by PORTD, pins 0-3
'
' Five inputs are required for the following functions
'
'  Alarm enabled - Contact switch  - PORT-C 0
'  Alarm display/set - Press button - PORT-C 1
'  Fast set - Press button - PORT-C 2
'  Slow set - Press button - PORT-C 3
'  Summer/Winter toggle - Press button - PORT-C 4
'
' ============================================================================

$crystal = 1000000
$regfile = "m88pdef.dat"
$hwstack = 40
$swstack = 40
$framesize = 60

' $baud = 4800

Display_ss Alias Portb.2
Config Display_ss = Output : Display_ss = 1

'(
Dfc_ss Alias Portb.1
Config Dfc_ss = Output : Dfc_ss = 1
')

Config Spi = Soft , Din = Pinb.4 , Dout = Portb.3 , Ss = None , Clock = Portb.5 , Setup = 40 , Mode = 1


Spiinit



' Timer and interrupt Configuration ==========================================

Config Timer1 = Timer , Prescale = 8
On Timer1 Tenthsecondtimer_isr
' Const Timer1_tenthsecondcount = 59286 ' 20Hz
Const Timer1_tenthsecondcount = 64286                       ' 100Hz

Enable Timer1
'(
On Pcint1 Pcint1_isr
Pcmsk1.0 = 1                                                ' PCINT8  - 1 Second pulse
Pcmsk1.1 = 1                                                ' PCINT9  - DCF message
Pcmsk1.2 = 1                                                ' PCIN1T0 - Alarm interrupt

Enable Pcint1
')
Enable Interrupts

' I/O Configuration ===========================================================


'(
Config Pinc.0 = Input
Second_interrupt Alias Pinc.0

Config Pinc.1 = Input
Dfc_interrupt Alias Pinc.1

Config Pinc.2 = Input
Dfc_alarm Alias Pinc.2
')

Heartbeat Alias Portb.0
Config Heartbeat = Output : Heartbeat = 0
'(
Dfc_received Alias Portd.7
Config Dfc_received = Output : Dfc_received = 0
')

Hb2 Alias Portd.7
Config Hb2 = Output : Hb2 = 0

' Display

Const Digit1_addr = &H81
Const Digit2_addr = &H82
Const Digit3_addr = &H83
Const Digit4_addr = &H84
Const Colon_addr = &H85

Const Display_indicators_register = &H86

Const Intensity_register = &H8A
Const Intensity_max = &H0F
Const Intensity_med = &H07
Const Intensity_min = &H00

Const Power_register = &H8C
Const Normal_mode = &H01
Const Off_mode = &H00

Const Display_blink_register = &H8D

Const Display_test_register = &H8F
Const Display_test_on = &H01
Const Display_test_off = &H00


Dim Mosi(5) As Byte
Dim Miso(5) As Byte


' Holding the values of the time as fields.
Dim Seconds As Byte
Dim Minutes As Byte
Dim Hours As Byte


Dim Onetenth As Bit
Dim Dec_seconds As Byte
Dim Dec_minutes As Byte
Dim Dec_hours As Byte

Dim Colon_enabled As Bit

'(
Dim Interrupt_fired As Bit
Interrupt_fired = 0
Dim Dfc_time As Byte
Dfc_time = 250
Dim Periodic_int As Bit
Periodic_int = 0
')


' Main Loop ===================================================================


' Bring the slave select lines high.
'Set Dfc_ss
Set Display_ss

Seconds = 0
Minutes = 00
Hours = 12


Set Heartbeat
Wait 2
Reset Heartbeat
Wait 2

' Gosub Rtc_dfc_initialisation

Gosub Init_display

Set Hb2
Wait 2
Reset Hb2
Wait 2

Dec_minutes = 0
Dec_hours = 0

Do

   If Onetenth = 1 Then
      Onetenth = 0
      Incr Dec_minutes
      If Dec_minutes > 99 Then
         Dec_minutes = 0
         Incr Dec_hours
         If Dec_hours > 99 Then
            Dec_hours = 0
         End If
      End If

      Toggle Heartbeat

      Minutes = Makebcd(dec_minutes)
      Hours = Makebcd(dec_hours)

      Gosub Write_time_to_display

   End If

Loop

End




' Subroutines =================================================================



Init_display:
   Reset Display_ss
   Mosi(1) = Power_register
   Mosi(2) = Normal_mode
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Set Display_ss

   Waitus 50

   Reset Display_ss
   Mosi(1) = Display_test_register
   Mosi(2) = Display_test_on
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Set Display_ss

   Waitus 50

   Reset Display_ss
   Mosi(1) = Display_test_register
   Mosi(2) = Display_test_off
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Set Display_ss

   Waitus 50

   Reset Display_ss
   Mosi(1) = Colon_addr
   Mosi(2) = &H01                                           ' Enabled
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Set Display_ss

   Waitus 50

   Reset Display_ss
   Mosi(1) = Display_indicators_register
   Mosi(2) = &H00
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Set Display_ss

   Waitus 50

   Reset Display_ss
   Mosi(1) = Display_blink_register
   Mosi(2) = &B00010000                                     ' Blink the colon
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Set Display_ss
Return


Write_time_to_display:

   Reset Display_ss
   Waitus 50

   ' hours 10s
   Mosi(1) = Digit1_addr
   Mosi(2) = Hours
   Shift Mosi(2) , Right , 4
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Set Display_ss

   ' hours units
   Reset Display_ss
   Mosi(1) = Digit2_addr
   Mosi(2) = Hours
   Shift Mosi(2) , Left , 4
   Shift Mosi(2) , Right , 4
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Set Display_ss

   ' Minutes 10s
   Reset Display_ss
   Mosi(1) = Digit3_addr
   Mosi(2) = Minutes
   Shift Mosi(2) , Right , 4
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Set Display_ss

   ' Minutes units
   Reset Display_ss
   Mosi(1) = Digit4_addr
   Mosi(2) = Minutes
   Shift Mosi(2) , Left , 4
   Shift Mosi(2) , Right , 4
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Waitus 50
   Set Display_ss

Return


'(
Rtc_dfc_initialisation:
   Reset Dfc_ss
   Mosi(1) = &H0A                                           ' Bulk write, starting at register &H0A
   Mosi(2) = &B00000000                                     ' Periodic interupt 1Hz - Register &H0A
   Mosi(3) = &B00000000                                     ' No alarm - Register &H0B
   Mosi(4) = &B00000010                                     ' Enable the periodic interrupt - Register &H0C
   Mosi(5) = &B00000111                                     ' Enable the DCF interrup - Register &H0D
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Spiout Mosi(3) , 1
   Spiout Mosi(4) , 1
   Spiout Mosi(5) , 1
   Set Dfc_ss
Return

Read_time_from_dfc:

   Reset Dfc_ss


   Mosi(1) = &H40                                           ' Burst read, starting from register &H00 (Seconds)
   Mosi(2) = &HC1
   Mosi(3) = &HC2
   Mosi(4) = &HC3

   Spiout Mosi(1) , 1
   Spiin Miso(1) , 1
   Spiin Miso(2) , 1
   Spiin Miso(3) , 1

   Seconds = Miso(1)                                        'And &B01111111
   Minutes = Miso(2)                                        'And &B01111111
   Hours = Miso(3)                                          'And &B01111111

   Set Dfc_ss

Return

Delete_dfc_interrupt_flag:
   Reset Dfc_ss
   Mosi(1) = &H8E
   Mosi(2) = &B00000001
   Spiout Mosi(1) , 2
   Set Dfc_ss
Return

Delete_periodic_interrupt_flag:
   Reset Dfc_ss
   Mosi(1) = &H8E
   Mosi(2) = &B0000010
   Spiout Mosi(1) , 2
   Set Dfc_ss
Return
')


' Timer ISR ===================================================================

'(
Pcint1_isr:
   Interrupt_fired = 1
   If Second_interrupt = 0 Then Periodic_int = 1
   If Dfc_interrupt = 0 Then Dfc_time = 0
Return
')

Tenthsecondtimer_isr:
   Timer1 = Timer1_tenthsecondcount
   Onetenth = 1
 Return