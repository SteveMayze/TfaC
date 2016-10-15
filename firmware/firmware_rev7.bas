

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

Dfc_ss Alias Portb.6
Config Dfc_ss = Output : Dfc_ss = 1

Config Spi = Soft , Din = Pinb.4 , Dout = Portb.3 , Ss = None , Clock = Portb.5 , Setup = 40 , Mode = 1


Spiinit



Buzzer Alias Portb.1
Config Buzzer = Output
Config Timer1 = Timer , Compare A = Toggle , Prescale = 1 , Clear Timer = 1

Const Timer0_startvalue = 100                               ' 0.01 seconds
Config Timer0 = Timer , Prescale = 64
Timer0 = Timer0_startvalue
On Timer0 Timer0_isr
Enable Timer0
Start Timer0


' Timer and interrupt Configuration ==========================================

On Pcint1 Pcint1_isr
Pcmsk1.0 = 1                                                ' PCINT8  - 1 Second pulse
Pcmsk1.1 = 1                                                ' PCINT9  - DFC message
Pcmsk1.2 = 1                                                ' PCINT10 - Alarm interrupt

Enable Pcint1
Enable Interrupts

' I/O Configuration ===========================================================

Config Pinc.0 = Input
Second_interrupt Alias Pinc.0
Config Pinc.1 = Input
Dfc_interrupt Alias Pinc.1
Config Pinc.2 = Input
Dfc_alarm Alias Pinc.2
Dim Dfc_received As Bit


' Time set etc. buttons ...........
Ddrd = &B10000000
Portd = &B01111111
Time_set Alias Pind.0
Alarm_set Alias Pind.1
Slow_set Alias Pind.2
Alarm_disabled Alias Pind.3
Fast_set Alias Pind.4
Sleep_btn Alias Pind.5
Summertime Alias Pind.6

Heartbeat Alias Portc.3
Config Heartbeat = Output : Heartbeat = 0



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
Dim Dfc_time As Byte
Dfc_time = 5
Dim Periodic_int As Bit
Periodic_int = 0

Dim Interrupt_register As Byte
Dim Temp As Byte

Dim Alarm_fired As Bit
Alarm_fired = 0

Dim Alarmdisplay As Bit
Dim Alarm_enabled As Bit
Dim Alarm_configured As Bit
Dim Sleeppressed As Bit

Dim Isfastpressed As Bit
Dim Isslowpressed As Bit
Dim Wasfastalreadyset As Bit
Dim Wasslowalreadyset As Bit
Dim Fastlongpresscounter As Long
Dim Slowlongpresscounter As Long
Dim Press_delay As Integer
Const Longthreshold = 2

Const Tone_pitch = 500                                      ' 397

Dim Tone As Byte
Dim Tone_length As Integer
Dim Tone_idx As Byte
Dim Song(26) As Byte
Dim Songlen As Byte
Dim Song_finished As Byte
Const Song_repeat = 5

Const Base_length = 7


' Main Loop ===================================================================


' Bring the slave select lines high.
Set Dfc_ss
Set Display_ss

Set Dfc_received

Time_seconds = 0
Time_minutes = 0
Time_hours = 0

Alarm_seconds = 0
Alarm_minutes = 0
Alarm_hours = 0
Alarm_configured = 0

Set Heartbeat
Gosub Buzzer_on
Waitms 100
Gosub Buzzer_off
Waitms 1400

Reset Heartbeat
'Wait 2

Gosub Rtc_dfc_initialisation

' ============================================================================
' Load the alarm meloldy into the buffer
' ============================================================================
Songlen = 0
Restore Melody2
Do
   Read Tone
   If Tone <> &HFF Then
      Incr Songlen
      Song(songlen) = Tone
   End If
Loop Until Tone = &HFF
Tone_length = 1



Alarm_configured = Alarm_disabled
Rtc_interrupt_fired = 1

Display_time(seconds_i) = 0
Display_time(minutes_i) = 0
Display_time(hours_i) = 0
Reset Sleeppressed

Gosub Init_display

Gosub Read_time_from_dfc
Waitms 50
Display_time(seconds_i) = Time_seconds
Display_time(minutes_i) = Time_minutes
Display_time(hours_i) = Time_hours
Gosub Write_time_to_display

gosub Alarmdisplayreset_action

' Main loop
Do

   If Alarmdisplay = 0 Then
      Debounce Alarm_set , 0 , Alarmdisplayset_action , Sub
   End If
   If Alarmdisplay = 1 Then
      Debounce Alarm_set , 1 , Alarmdisplayreset_action , Sub
   End If
   Debounce Fast_set , 0 , Fast_set_action , Sub
   Debounce Slow_set , 0 , Slow_set_action , Sub
   Debounce Alarm_disabled , 1 , Alarmenabled_action , Sub
   Debounce Alarm_disabled , 0 , Alarmenabled_action , Sub

   Debounce Sleep_btn , 0 , Sleeppressed_action , Sub


   If Rtc_interrupt_fired = 1 Then
      Rtc_interrupt_fired = 0

      Gosub Read_time_from_dfc

      Waitms 50

      Display_time(seconds_i) = Time_seconds
      Display_time(minutes_i) = Time_minutes
      Display_time(hours_i) = Time_hours
      Gosub Write_time_to_display

      Waitms 50

      Gosub Read_dfc_interrupt_flag

      If Periodic_int = 1 Then
         Periodic_int = 0
         Gosub Rtc_fired
      End If
   End If

   If Alarm_disabled = 0 Then                ' The alarm is enabled
      If Alarm_configured = 0 Then
         Set Alarm_configured
         Song_finished = Song_repeat
         Tone_idx = 0
      End If
      If Song_finished < 1 Then
         Reset Alarm_fired
         Tone_idx = 0
         Gosub Delete_dfc_alarm_interrupt_flag
         Gosub Buzzer_off
      End If
   Else
      If Alarm_configured = 1 Then

         Display_time(seconds_i) = Time_seconds
         Display_time(minutes_i) = Time_minutes
         Display_time(hours_i) = Time_hours
         Gosub Write_time_to_display

         Gosub Disable_alarm
         Reset Alarm_configured
         Song_finished = 0
         Tone_idx = 0
      End If
   End If

   Gosub Evaluate_timeset

   If Alarmdisplay = 1 Then

      Display_time(seconds_i) = Makebcd(alarm_seconds)
      Display_time(minutes_i) = Makebcd(alarm_minutes)
      Display_time(hours_i) = Makebcd(alarm_hours)
      Gosub Write_time_to_display

      If Alarm_disabled = 0 Then
         If Isslowpressed = 1 Then
            Press_delay = 500
         Else
            If Isfastpressed = 1 Then
               Press_delay = 10
            End If
         End If
         If Isslowpressed = 1 Or Isfastpressed = 1 Then
            Incr Alarm_minutes
            If Alarm_minutes > 59 Then
               Alarm_minutes = 0
               Incr Alarm_hours
               If Alarm_hours > 23 Then
                  Alarm_hours = 0
               End If
            End If
            Waitms Press_delay
         End If
      End If
   End If
Loop
End

' Subroutines =================================================================



' Initialise the display
' Run through the lamp test and then enable the colon
' and set this to blink mode.
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

   Wait 1

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


' Write the content of the display_time array
' to the display
' also the dfc_received and alarm enabled status display
' will also be displayed
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
   Set Display_ss

   ' DFC Received Indicator
   Reset Display_ss
   Mosi(1) = Display_indicators_register
   If Dfc_received = 1 Then
      Mosi(2) = &H02
   Else
      Mosi(2) = &H00
   End If
   Alarm_enabled = Not Alarm_disabled
   Mosi(2) = Mosi(2) Or Alarm_enabled
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Waitus 50
   Set Display_ss
Return


' Display only the dfc_received on the display
Indicate_dfc:
   Reset Display_ss
   Waitus 50

   ' DFC Received Indicator
   Mosi(1) = Display_indicators_register
   If Dfc_received = 1 Then
      Mosi(2) = &H02
   Else
      Mosi(2) = &H00
   End If
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Waitus 50
   Set Display_ss
Return


' Set up the RTC for a one minute interrupt, no alarm initially
' and enable the dfc'
Rtc_dfc_initialisation:
   Reset Dfc_ss
   Mosi(1) = &H0A                                           ' Bulk write, starting at register &H0A
   Mosi(2) = &B00000011                                     ' Periodic interupt 1Minute - Register &H0A
   Mosi(3) = &B00000000                                     ' No alarm - Register &H0B
   Mosi(4) = &B00000010                                     ' Enable the periodic interrupt - Register &H0C
   Mosi(5) = &B00000111                                     ' Enable the DFC interrup - Register &H0D
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
   Spiout Mosi(1) , 1
   Spiin Miso(1) , 1
   Spiin Miso(2) , 1
   Alarm_seconds = 0                                        'And &B01111111
   Alarm_minutes = Makedec(miso(1))                         'And &B01111111
   Alarm_hours = Makedec(miso(2))                           'And &B01111111
   Set Dfc_ss
Return


Write_alarm_to_rtc:

   If Alarm_disabled = 0 Then
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
      Gosub Enable_alarm
   End If

Return

Enable_alarm:
      Reset Dfc_ss
      Mosi(1) = &H8B
      Mosi(2) = &B00000110
      Spiout Mosi(1) , 1
      Spiout Mosi(2) , 1
      Set Dfc_ss
Return

Disable_alarm:
      Reset Dfc_ss
      Mosi(1) = &H8B
      Mosi(2) = &B00000000
      Spiout Mosi(1) , 1
      Spiout Mosi(2) , 1
      Set Dfc_ss
Return


Delete_dfc_interrupt_flag:
   Reset Dfc_ss
   Mosi(1) = &H8E
   Mosi(2) = &B0000011
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Set Dfc_ss
Return

Delete_dfc_alarm_interrupt_flag:
   Reset Dfc_ss
   Mosi(1) = &H8E
   Mosi(2) = &B0000100
   Spiout Mosi(1) , 1
   Spiout Mosi(2) , 1
   Set Dfc_ss
Return

Read_dfc_interrupt_flag:
   Reset Dfc_ss
   Mosi(1) = &HCE
   Spiout Mosi(1) , 1
   Spiin Mosi(1) , 1
   Set Dfc_ss
   Interrupt_register = Mosi(1)

   If Alarm_disabled = 0 Then
      Temp = Interrupt_register And &B00000100
      If Temp = &B00000100 Then
         Set Alarm_fired
      End If
   End If

Return


Rtc_fired:
   Toggle Heartbeat
   Gosub Delete_dfc_interrupt_flag
   If Dfc_time = 0 Then
      Set Dfc_received
      Gosub Indicate_dfc
      Waitms 250
      Reset Dfc_received
      Gosub Indicate_dfc
   End If
   If Dfc_time < 5 Then Incr Dfc_time

   If Dfc_time < 3 Then                                     ' Time since last DFC
      Reset Dfc_received
   Else
      Set Dfc_received
   End If
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
   Set Alarmdisplay
   Reset Alarm_configured
   Gosub Read_alarm_from_dfc
Return

Alarmdisplayreset_action:
   Reset Alarmdisplay                                       ' Alarm set button released
   Gosub Write_alarm_to_rtc

Return


Alarmenabled_action:
   If Alarmdisplay = 0 Then
      Display_time(seconds_i) = Time_seconds
      Display_time(minutes_i) = Time_minutes
      Display_time(hours_i) = Time_hours
      Gosub Write_time_to_display
   End If
Return


Sleeppressed_action:
   If Alarm_fired = 1 Then
      Set Sleeppressed
   End If
Return

Fast_set_action:
   If Fast_set = 0 Then Set Isfastpressed
Return

Slow_set_action:
   If Slow_set = 0 Then Set Isslowpressed
Return

Fast_reset_action:
   If Fast_set = 1 Then Reset Isfastpressed
Return

Slow_reset_action:
   If Slow_set = 1 Then Reset Isslowpressed
Return

Buzzer_on:
   Compare1a = Tone_pitch
   Tccr1a.6 = 1
Return

Buzzer_off:
   Tccr1a.6 = 0
Return



' Timer ISR ===================================================================


Pcint1_isr:
   Rtc_interrupt_fired = 1
   If Second_interrupt = 0 Then Periodic_int = 1
   If Dfc_interrupt = 0 Then Dfc_time = 0
   If Dfc_alarm = 0 Then Set Alarm_fired
Return


Timer0_isr:
   Timer0 = Timer0_startvalue
   If Alarm_fired = 1 Then
      If Tone_length > 0 Then
         Decr Tone_length
         If Tone_length <= Base_length Then
            Gosub Buzzer_off
         End If
      Else
         If Sleeppressed = 0 Then
            If Tone_idx < Songlen Then
               Incr Tone_idx                                ' Get the next tone
               Tone = Song(tone_idx)
               Tone_length = Tone And &H0F                  ' Get the tone length
               Tone_length = Base_length * Tone_length      ' Factor the tone buy the base length
               Tone_length = Tone_length + Base_length      ' Build in a unit gap at the end

               If Tone > &H80 Then
                  Gosub Buzzer_off
               Else
                  Gosub Buzzer_on
               End If
            Else
               If Song_finished > 0 Then
                  Decr Song_finished
                  Tone_idx = 0
               End If
            End If
         Else
            Reset Sleeppressed
            Song_finished = 0
            Tone_idx = Songlen - 1
            Tone_length = 0
            Tone = &HFF
            Gosub Buzzer_off
         End If
      End If
   End If
Return

' Melody1:                                                    ' Wake up - Morse code
' Data &H01 , &H03 , &H03 , &H83 , &H01 , &H03 , &H83 , &H03 , &H01 , &H03 , &H83 , &H01 , &H87 , &H01 , &H01 , &H03 , &H83 , &H01 , &H03 , &H03 , &H01 , &H87 , &HFF


Melody2:                                                    ' Three chirps and a pause
Data &H01 , &H01 , &H01 , &H01 , &H87 , &HFF