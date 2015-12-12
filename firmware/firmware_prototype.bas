

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
$regfile = "m88def.dat"
$hwstack = 40
$swstack = 40
$framesize = 60

' $baud = 4800



' Config Spi = Hard , Master = Yes , Data_order = Msb , Noss = 1 , Spiin = 255
Config Spi = Soft , Din = Pinb.4 , Dout = Portb.3 , Ss = None , Clock = Portb.5 , Setup = 40

Display_ss Alias Portb.2
Config Display_ss = Output : Display_ss = 1

Dcf_ss Alias Portb.1
Config Dcf_ss = Output : Dcf_ss = 1

Spiinit

' Timer and interrupt Configuration ==========================================

On Pcint1 Pcint1_isr
Pcmsk1.0 = 1                                                ' PCINT8  - 1 Second pulse
Pcmsk1.1 = 1                                                ' PCINT9  - DCF message
Pcmsk1.2 = 1                                                ' PCIN1T0 - Alarm interrupt

Enable Pcint1
Enable Interrupts

' I/O Configuration ===========================================================



Config Pinc.0 = Input
Second_interrupt Alias Pinc.0
Dim New_second As Bit

Config Pinc.1 = Input
Dcf_interrupt Alias Pinc.1

Config Pinc.2 = Input
Dcf_alarm Alias Pinc.2


Heartbeat Alias Portb.0
Config Heartbeat = Output : Heartbeat = 0
Dcf_received Alias Portd.7
Config Dcf_received = Output : Dcf_received = 0




' Display

Const Intensity_register = &H0A
Const Intensity_max = &H0F
Const Intensity_med = &H07
Const Intensity_min = &H00


Const Power_register = &H0C
Const Normal_mode = &H01
Const Off_mode = &H00

Const Display_test_register = &H0F
Const Display_test_on = &H01
Const Display_test_off = &H00

Const Display_blink_register = &H0D

Const Digit1_addr = &H01
Const Digit2_addr = &H02
Const Digit3_addr = &H03
Const Digit4_addr = &H04
Const Colon_addr = &H05
Const Display_indicators_register = &H06


Dim Spi_data(2) As Byte
Dim Mosi(5) As Byte
Dim Miso(5) As Byte


' Holding the values of the time as fields.
Dim Seconds As Byte
Dim Minutes As Byte
Dim Hours As Byte

Dim Hour_bcd As Byte
Dim Minute_bcd As Byte
Dim Second_bcd As Byte
Dim Bcd_str As String * 10

Dim Colon_enabled As Bit

Dim dcf_time As Byte
Dcf_time = 250



' Main Loop ===================================================================


' Bring the slave select lines high.
Set Dcf_ss
Set Display_ss

Seconds = 0
Minutes = 00
Hours = 12


Set Heartbeat
Wait 2
Reset Heartbeat
Wait 2

Gosub Rtc_dcf_initialisation

Gosub Init_display

Do
   If New_second = 1 Then
      Gosub Read_time_from_dfc
      If Dcf_time = 0 Then
         Set Dcf_received : Waitms 500 : Reset Dcf_received
         Gosub Delete_dcf_interrupt_flag
      End If
      If Dcf_time < 250 Then Incr Dcf_time
      Toggle Heartbeat
      Gosub Write_time_to_display
      New_second = 0
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
   ' hours 10s
   Spi_data(1) = Digit1_addr
   Spi_data(2) = Makebcd(hours)
   Shift Spi_data(2) , Right , 4
   Spiout Spi_data(1) , 1
   Spiout Spi_data(2) , 1
   Set Display_ss

   Waitus 50

   ' hours units
   Reset Display_ss
   Spi_data(1) = Digit2_addr
   Spi_data(2) = Makebcd(hours)
   Shift Spi_data(2) , Left , 4
   Shift Spi_data(2) , Right , 4
   Spiout Spi_data(1) , 1
   Spiout Spi_data(2) , 1
   Set Display_ss

   Waitus 50

   ' Minutes 10s
   Reset Display_ss
   Spi_data(1) = Digit3_addr
   Spi_data(2) = Makebcd(minutes)
   Shift Spi_data(2) , Right , 4
   Spiout Spi_data(1) , 1
   Spiout Spi_data(2) , 1
   Set Display_ss

   Waitus 50

   ' Minutes units
   Reset Display_ss
   Spi_data(1) = Digit4_addr
   Spi_data(2) = Makebcd(minutes)
   Shift Spi_data(2) , Left , 4
   Shift Spi_data(2) , Right , 4
   Spiout Spi_data(1) , 1
   Spiout Spi_data(2) , 1
   Set Display_ss

Return



Rtc_dcf_initialisation:
   Reset Dcf_ss
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
   Set Dcf_ss
Return


Read_time_from_dfc:

   Reset Dcf_ss


   Mosi(1) = &H40                                           ' Burst read, starting from register &H00 (Seconds)
   Mosi(2) = &HC1
   Mosi(3) = &HC2
   Mosi(4) = &HC3

   Spiout Mosi(1) , 1
   Spiin Miso(1) , 1
   Spiin Miso(2) , 1
   Spiin Miso(3) , 1

   Second_bcd = Miso(1)                                     'And &B01111111
   Minute_bcd = Miso(2)                                     'And &B01111111
   Hour_bcd = Miso(3)                                       'And &B01111111

   Set Dcf_ss

   Hours = Makedec(hour_bcd)
   Minutes = Makedec(minute_bcd)
   Seconds = Makedec(second_bcd)

Return

Delete_dcf_interrupt_flag:
   Reset Dcf_ss
   Mosi(1) = &H8E
   Mosi(2) = &B00000001
   Spiout Mosi(1) , 2
   Set Dcf_ss
Return


' Timer ISR ===================================================================


Pcint1_isr:
   If Second_interrupt = 0 Then New_second = 1
   If Dcf_interrupt = 0 Then Dcf_time = 0
Return