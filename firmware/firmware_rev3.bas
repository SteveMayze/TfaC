

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

Dfc_ss Alias Portb.1
Config Dfc_ss = Output : Dfc_ss = 1

Config Spi = Soft , Din = Pinb.4 , Dout = Portb.3 , Ss = None , Clock = Portb.5 , Setup = 40 , Mode = 1


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
Config Pinc.1 = Input
Dfc_interrupt Alias Pinc.1
Config Pinc.2 = Input
Dfc_alarm Alias Pinc.2

' Time set etc. buttons ...........
Ddrd = &B10000000
Portd = &B01111111
Time_set Alias Pind.0
Fast_set Alias Pind.4
Slow_set Alias Pind.2
Alarm_switch Alias Pind.3
Alarm_set Alias Pind.1
Sleep_btn Alias Pind.5
Summertime Alias Pind.6


Heartbeat Alias Portb.0
Config Heartbeat = Output : Heartbeat = 0
Btn_ack Alias Portb.6                                       ' Temporary output
Config Btn_ack = Output : Btn_ack = 0

Dfc_received Alias Portd.7
Config Dfc_received = Output : Dfc_received = 0

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
Dim Display_time(3) As Byte

Const Seconds_i = 1
Const Minutes_i = 2
Const Hours_i = 3

Dim Time_seconds As Byte
Dim Time_minutes As Byte
Dim Time_hours As Byte

Dim Alarm_seconds As Byte
Dim Alarm_minutes As Byte
Dim Alarm_hours As Byte

Dim Rtc_interrupt_fired As Bit
Rtc_interrupt_fired = 0
Dim Dfc_time As Byte
Dfc_time = 250
Dim Periodic_int As Bit
Periodic_int = 0

Dim Btn_interrupt_fired As Bit
Btn_interrupt_fired = 0
Dim Btn_state As Byte


Dim Alarmdisplay As Bit

Dim Isfastpressed As Bit
Dim Isslowpressed As Bit
Dim Wasfastalreadyset As Bit
Dim Wasslowalreadyset As Bit
Dim Fastlongpresscounter As Long
Dim Slowlongpresscounter As Long
Const Longthreshold = 3


' Main Loop ===================================================================


' Bring the slave select lines high.
Set Dfc_ss
Set Display_ss

Time_seconds = 0
Time_minutes = 00
Time_hours = 12

Alarm_seconds = 0
Alarm_minutes = 00
Alarm_hours = 06


Set Heartbeat
Set Btn_ack
Wait 2
Reset Heartbeat
Reset Btn_ack
Wait 2

Gosub Rtc_dfc_initialisation
Gosub Write_alarm_to_rtc

Alarm_seconds = 0
Alarm_minutes = 00
Alarm_hours = 00



Gosub Init_display

Do

   ' Debounce Summertime , 0 , Summerwinter_action , Sub
   If Alarmdisplay = 0 Then
      Debounce Alarm_set , 0 , Alarmdisplayset_action , Sub
   End If
   If Alarmdisplay = 1 Then
      Debounce Alarm_set , 1 , Alarmdisplayreset_action , Sub
   End If
   Debounce Fast_set , 0 , Fast_set_action , Sub
'   Debounce Fast_set , 1 , Fast_reset_action , Sub
   Debounce Slow_set , 0 , Slow_set_action , Sub
'   Debounce Slow_set , 1 , Slow_reset_action , Sub


   Gosub Evaluate_timeset

   If Rtc_interrupt_fired = 1 Then
      Rtc_interrupt_fired = 0
      If Periodic_int = 1 Then
         Periodic_int = 0
         If Alarmdisplay = 1 Then
            Set Btn_ack
            Display_time(seconds_i) = Makebcd(alarm_seconds)
            Display_time(minutes_i) = Makebcd(alarm_minutes)
            Display_time(hours_i) = Makebcd(alarm_hours)
            Gosub Write_time_to_display
            If Isslowpressed = 1 Then
               Incr Alarm_minutes
               If Alarm_minutes > 59 Then
                  Alarm_minutes = 0
                  Incr Alarm_hours
                  If Alarm_hours > 23 Then
                     Alarm_hours = 0
                  End If
               End If
            Else
               If Isfastpressed = 1 Then
                  Alarm_minutes = Alarm_minutes + 10
                  If Alarm_minutes > 59 Then
                     Alarm_minutes = 0
                     Incr Alarm_hours
                     If Alarm_hours > 23 Then
                        Alarm_hours = 0
                     End If
                  End If
               End If
            End If
         Else
            Reset Btn_ack
            Gosub Rtc_fired
         End If
      End If
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
   Mosi(2) = Display_time(hours_i)
   Shift Mosi(2) , Right , 4
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Set Display_ss

   ' hours units
   Reset Display_ss
   Mosi(1) = Digit2_addr
   Mosi(2) = Display_time(hours_i)
   Shift Mosi(2) , Left , 4
   Shift Mosi(2) , Right , 4
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Set Display_ss

   ' Minutes 10s
   Reset Display_ss
   Mosi(1) = Digit3_addr
   Mosi(2) = Display_time(minutes_i)
   Shift Mosi(2) , Right , 4
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Set Display_ss

   ' Minutes units
   Reset Display_ss
   Mosi(1) = Digit4_addr
   Mosi(2) = Display_time(minutes_i)
   Shift Mosi(2) , Left , 4
   Shift Mosi(2) , Right , 4
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Waitus 50
   Set Display_ss

Return



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
   Time_seconds = Miso(1)                                   'And &B01111111
   Time_minutes = Miso(2)                                   'And &B01111111
   Time_hours = Miso(3)                                     'And &B01111111
   Set Dfc_ss
Return

Read_alarm_from_dfc:
   Reset Dfc_ss
   Mosi(1) = &H47                                           ' Burst read, starting from register &H00 (Seconds)
   Mosi(2) = &HC1
   Mosi(3) = &HC2
'   Mosi(4) = &HC3
   Spiout Mosi(1) , 1
   Spiin Miso(1) , 1
   Spiin Miso(2) , 1
   Alarm_seconds = 0                                        'And &B01111111
   Alarm_minutes = Makedec(miso(1))                         'And &B01111111
   Alarm_hours = Makedec(miso(2))                           'And &B01111111
   Set Dfc_ss
Return

Delete_dfc_interrupt_flag:
   Reset Dfc_ss
   Mosi(1) = &H8E
   Mosi(2) = &B00000001
   Spiout Mosi(1) , 2
   Set Dfc_ss
Return

Write_alarm_to_rtc:
   Reset Dfc_ss
   Mosi(1) = &H07
   Mosi(2) = Makebcd(alarm_minutes)
   Mosi(3) = Makebcd(alarm_hours)
   Mosi(4) = &HFF
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Spiout Mosi(3) , 1
   Spiout Mosi(4) , 1
   Set Dfc_ss

   ' TODO This has to move to the alarm enable swtich handler.
   '(
   Reset Dfc_ss
   Mosi(1) = &H8B
   Mosi(2) = &H06
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Set Dfc_ss
')
Return


Delete_periodic_interrupt_flag:
   Reset Dfc_ss
   Mosi(1) = &H8E
   Mosi(2) = &B0000010
   Spiout Mosi(1) , 2
   Set Dfc_ss
Return

Rtc_fired:
      'If Periodic_int = 1 Then
         Toggle Heartbeat

         'Disable Pcint1
         Gosub Read_time_from_dfc
         Waitms 50
         Display_time(seconds_i) = Time_seconds
         Display_time(minutes_i) = Time_minutes
         Display_time(hours_i) = Time_hours
         Gosub Write_time_to_display
         'Enable Pcint1

         If Dfc_time = 0 Then
            Gosub Delete_dfc_interrupt_flag
            Set Dfc_received
            Waitms 250
            Reset Dfc_received
         End If
         If Dfc_time < 250 Then Incr Dfc_time
          If Dfc_time < 240 Then                            ' Time since last DFC
             Reset Dfc_received
          Else
             Set Dfc_received
          End If
      'End If
Return

' Evaluate if the time-set buttons are held down long enough to start the
' fast or slow time change.
'
Evaluate_timeset:
   ' Fast time change
   If Fast_set = 0 Then
      If Wasfastalreadyset = 0 Then
         Incr Fastlongpresscounter
         If Fast_set = 0 And Fastlongpresscounter > Longthreshold Then
            Set Isfastpressed
         End If
      Else
         Set Wasfastalreadyset
      End If
   Else
      Reset Isfastpressed
      Reset Wasfastalreadyset
      Fastlongpresscounter = 0
   End If

   ' Slow time change
   If Slow_set = 0 Then
      If Wasslowalreadyset = 1 Then
         Incr Slowlongpresscounter
         If Slow_set = 0 And Slowlongpresscounter > Longthreshold Then
            Set Isslowpressed
         End If
      Else
         Set Wasslowalreadyset
      End If
   Else
      Reset Isslowpressed
      Reset Wasslowalreadyset
      Slowlongpresscounter = 0
   End If
Return

Alarmdisplayset_action:
   ' Rtc_interrupt_fired = 1
   If Alarm_set = 0 Then Set Alarmdisplay
   Gosub Read_alarm_from_dfc
Return

Alarmdisplayreset_action:
   ' Rtc_interrupt_fired = 1
   If Alarm_set = 1 Then Reset Alarmdisplay
   ' TODO Write the alarm to the RTC
   Gosub Write_alarm_to_rtc
Return


Fast_set_action:
   ' Rtc_interrupt_fired = 1
   If Fast_set = 0 Then Set Isfastpressed
Return

Slow_set_action:
   Rtc_interrupt_fired = 1
   If Slow_set = 0 Then Set Isslowpressed
Return

Fast_reset_action:
   ' Rtc_interrupt_fired = 1
   If Fast_set = 1 Then Reset Isfastpressed
Return

Slow_reset_action:
   Rtc_interrupt_fired = 1
   If Slow_set = 1 Then Reset Isslowpressed
Return

' Timer ISR ===================================================================


Pcint1_isr:
   Rtc_interrupt_fired = 1
   If Second_interrupt = 0 Then Periodic_int = 1
   If Dfc_interrupt = 0 Then Dfc_time = 0
Return

