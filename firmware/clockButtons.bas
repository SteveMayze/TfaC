

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
$regfile = "m8def.dat"
$hwstack = 64
$swstack = 64
$framesize = 64

' $baud = 4800

' I/O Configuration ===========================================================

' Config Portb = Output
' Colon Alias Portb.0
' Alarmset Alias Portb.1
' Buzzer Alias Portb.2

' Port D will represent the BCD value for the numbers to display
' 3 bits.
' 7 6 5 4 3 2 1 0
' D M M M V V V V
' D - Decimal point
' M - Multiplexor value - 3 bits
' V - Value 4 bits

Config Portd = Output

Config Portb.3 = Output
Led1 Alias Portb.3
Config Portb.4 = Output
Led2 Alias Portb.4
Config Portb.5 = Output
Led3 Alias Portb.5



Config Portc = Input
Alarmenabled_inp Alias Pinc.0
Portc.0 = 1
Alarmdisplay_inp Alias Pinc.1
Portc.1 = 1

Fastset_inp Alias Pinc.2
Portc.2 = 1
Slowset_inp Alias Pinc.3
Portc.3 = 1
Summerwinter_inp Alias Pinc.4
Portc.4 = 1


' Timer Configuration =========================================================

Config Timer0 = Timer , Prescale = 256
On Timer0 Renderdisplay_isr
Const Timer0_count = 236                                    '200Hz For The Display

Config Timer1 = Timer , Prescale = 64
On Timer1 Tenthsecondtimer_isr
Const Timer1_tenthsecondcount = 63973                       ' 65535 - 1563


Enable Timer0
Enable Timer1
Enable Interrupts



' Data ============================================================================

' Holding the values of the time as fields.
Dim Seconds As Byte
Dim Minutes As Byte
Dim Hours As Byte

Dim Tmins As Byte
Dim Thours As Byte

Dim Alarmseconds As Byte
Dim Alarmminutes As Byte
Dim Alarmhours As Byte
Dim Alarmenabled As Bit
Dim Alarmdisplay As Bit
Dim Alarmstr As String * 4

Dim Position As Byte
Dim Displaystr As String * 4
Dim Digitstring As String * 1
Dim Tempstr As String * 4
Dim Timestr As String * 4

Dim Value As Byte

Dim Tenthcount As Byte

Dim Isfastpressed As Bit
Dim Isslowpressed As Bit
Dim Wasfastalreadyset As Bit
Dim Wasslowalreadyset As Bit
Dim Fastlongpresscounter As Long
Dim Slowlongpresscounter As Long
Const Longthreshold = 30

Dim Daylightsavings As Bit
Const Summer = 1
Const Winter = 0

Dim Soundalarm As Bit
Dim Buzzercount As Word
Const Buzzerlength = 500


' Main Loop ===================================================================

Seconds = 0
Minutes = 59
Hours = 5
Alarmminutes = 0
Alarmhours = 6

Reset Alarmenabled

Daylightsavings = Winter                                    ' Assume that daylight savings is not in force.

Reset Isfastpressed
Reset Isslowpressed
Reset Wasfastalreadyset
Reset Wasslowalreadyset
Fastlongpresscounter = 0
Slowlongpresscounter = 0
Position = 1
' Reset Buzzer
Reset Soundalarm
Buzzercount = 0

Do
   Debounce Summerwinter_inp , 0 , Summerwinter_action , Sub
   Debounce Alarmdisplay_inp , 0 , Alarmdisplayset_action , Sub
   Debounce Alarmdisplay_inp , 1 , Alarmdisplayreset_action , Sub
   Debounce Alarmenabled_inp , 0 , Enablealarm_action , Sub

   Gosub Evaluate_timeset

   If Alarmenabled = 1 Then
      If Hours = Alarmhours And Minutes = Alarmminutes Then
      'soundalarm has not been prevously set, so set it now
      'and sound the buzzer.
         If Soundalarm = 0 Then
            Set Soundalarm
            ' Set Buzzer
         End If
      End If
   Else
      ' Reset Buzzer
      Reset Soundalarm
   End If

   'The alarm has been sounded, but is it now still needed?
   If Soundalarm = 1 Then
      Incr Buzzercount
      If Buzzercount > Buzzerlength Then
         ' Reset Buzzer
         Reset Soundalarm
         Reset Alarmenabled
         ' Reset Alarmset
         Buzzercount = 0
      End If
   End If

Loop


End




' Subroutines =================================================================

' Evaluate if the time-set buttons are held down long enough to start the
' fast or slow time change.
'
Evaluate_timeset:

   ' Fast time change
   If Fastset_inp = 0 Then
      If Wasfastalreadyset = 0 Then
         Incr Fastlongpresscounter
         If Fastset_inp = 0 And Fastlongpresscounter > Longthreshold Then
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
   If Slowset_inp = 0 Then
      If Wasslowalreadyset = 1 Then
         Incr Slowlongpresscounter
         If Slowset_inp = 0 And Slowlongpresscounter > Longthreshold Then
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



Summerwinter_action:
   ' The summerwinter button has been pressed (short) toggle
   ' the summer winter time flag.
   Toggle Daylightsavings
   If Daylightsavings = Summer Then
      Gosub Incrhours
   Else
      Gosub Decrhours
   End If
Return


Alarmdisplayset_action:
   If Alarmdisplay_inp = 0 Then Set Alarmdisplay
Return

Alarmdisplayreset_action:
   If Alarmdisplay_inp = 1 Then Reset Alarmdisplay
Return


Enablealarm_action:
   Toggle Alarmenabled
   ' Alarmset = Alarmenabled
Return


' -----------------------------------------------------------------------------
' Time increment sub-routines.
' There are two entry points. One for seconds as normal. The other
' is for minutes for time setting.
Incrminutes:
   Incr Minutes
   If Minutes > 59 Then
      Minutes = 0
      Gosub Incrhours
   End If
Return

Incrhours:
   Incr Hours
   If Hours > 23 Then
      Hours = 0
   End If
Return

Decrminutes:
   Decr Minutes
   If Minutes < 0 Then
      Minutes = 59
      Gosub Decrhours
   End If
Return

Decrhours:
   Decr Hours
   If Hours < 0 Or Hours > 23 Then
      Hours = 23
   End If
Return



'========

Incralarmminutes:
   Incr Alarmminutes
   If Alarmminutes > 59 Then
      Alarmminutes = 0
      Gosub Incralarmhours
   End If
Return

Incralarmhours:
   Incr Alarmhours
   If Alarmhours > 23 Then
      Alarmhours = 0
   End If
Return

Decralarmminutes:
   Decr Alarmminutes
   If Alarmminutes < 0 Then
      Alarmminutes = 59
      Gosub Decralarmhours
   End If
Return

Decralarmhours:
   Decr Alarmhours
   If Alarmhours < 0 Or Alarmhours > 23 Then
      Alarmhours = 23
   End If
Return



' Timer ISR ===================================================================

Renderdisplay_isr:                                          '50 Hz
   Timer0 = Timer0_count

   If Isfastpressed = 1 Then                                ' Fast time set ( 1:10 of a second)
      Seconds = 0
      If Alarmdisplay = 0 Then
            Gosub Incrminutes
      Else
            Gosub Incralarmminutes
      End If
   End If

   Incr Position
   If Position > 4 Then
      Position = 1
   End If

   Digitstring = Mid(displaystr , Position , 1 )

   Value = Position + 1
   Shift Value , Left , 4
   Value = Value Or Val(digitstring)
   Portd = Value
Return


Tenthsecondtimer_isr:
   Timer1 = Timer1_tenthsecondcount

   Incr Tenthcount
   If Tenthcount = 5 Or Tenthcount = 10 Then
      ' Toggle Colonmarker
      Toggle Led1
   End If
   If Tenthcount > 9 Then                                   ' One Second
      Tenthcount = 0
 '      Toggle Colon

      If Isslowpressed = 1 Then                             ' Slow time set
         If Alarmdisplay = 0 Then
            Seconds = 0
            Gosub Incrminutes
         Else
            Gosub Incralarmminutes
         End If
      End If
      Incr Seconds                                          'Keep this in line and don't use a subroutine
      If Seconds > 59 Then
         Seconds = 0
         Gosub Incrminutes
      End If
   End If


   If Alarmdisplay = 1 Then
      Tmins = Alarmminutes
      Thours = Alarmhours
   Else
      Tmins = Minutes
      Thours = Hours
   End If

   Timestr = Str(tmins)
   If Len(timestr) < 2 Then Timestr = "0" + Timestr
   Tempstr = Str(thours)
   Timestr = Tempstr + Timestr
   If Len(timestr) < 4 Then Timestr = "0" + Timestr
   Displaystr = Timestr


 Return