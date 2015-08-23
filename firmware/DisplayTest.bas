

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

$regfile = "m88pdef.dat"
$crystal = 1000000

$hwstack = 40
$swstack = 40
$framesize = 64


Config Timer0 = Timer , Prescale = 256
On Timer0 Renderdisplay_isr
Const Timer0_count = 236                                    '200Hz For The Display


Config Timer1 = Timer , Prescale = 64
On Timer1 Tenthsecondtimer_isr
Const Timer1_tenthsecondcount = 63973                       ' 65535 - 1563


Enable Timer0
Enable Timer1
Enable Interrupts

' I/O Configuration ===========================================================

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




' Holding the values of the time as fields.
Dim Seconds As Byte
Dim Minutes As Byte
Dim Hours As Byte

Dim Position As Byte
Position = 0

Dim Displaystr As String * 4
Dim Digitstring As String * 1
Dim Tempstr As String * 4
Dim Timestr As String * 4

Dim Tenthcount As Byte


Dim Value As Byte



' Main Loop ===================================================================

Seconds = 0
Minutes = 59
Hours = 6
Displaystr = "0659"

Do
   Waitms 50
   ' Gosub Incrseconds
   Loop
End




' Subroutines =================================================================


' -----------------------------------------------------------------------------
' Time increment sub-routines.
' There are two entry points. One for seconds as normal. The other
' is for minutes for time setting.

Incrhours:
Return



' Timer ISR ===================================================================

Renderdisplay_isr:                                          '50 Hz
   Timer0 = Timer0_count

   ' Displaystr = Hours_time + Minutes_time

   Incr Position
   If Position > 4 Then
      Position = 0
   End If

   Digitstring = Mid(displaystr , Position , 1 )

   Value = Position - 1

   Shift Value , Left , 4
   Value = Value Or Val(digitstring)
   Portd = Value
Return



Tenthsecondtimer_isr:
   Timer1 = Timer1_tenthsecondcount

   Timestr = Displaystr
   Incr Tenthcount
   If Tenthcount = 5 Or Tenthcount = 10 Then
      ' Toggle Colonmarker
      Toggle Led2
   End If
   If Tenthcount > 9 Then                                   ' One Second
      Tenthcount = 0
      Incr Seconds                                          'Keep this in line and don't use a subroutine
      If Seconds > 59 Then
         Seconds = 0
         Incr Minutes
         If Minutes > 59 Then
           Minutes = 0
           Incr Hours
           If Hours > 23 Then
              Hours = 0
           End If
         End If
         Timestr = Str(minutes)
         If Len(timestr) < 2 Then Timestr = "0" + Timestr
         Tempstr = Str(hours)
         Timestr = Tempstr + Timestr
         If Len(timestr) < 4 Then Timestr = "0" + Timestr
      End If
   End If
   Displaystr = Timestr
 Return