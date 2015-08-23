

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



' Timer and interrupt Configuration ==========================================

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

Config Portc = Output
Config Portd = Output



' Holding the values of the time as fields.
Dim Seconds As Byte
Dim Minutes As Byte
Dim Hours As Byte

Dim Hour_bcd As Byte
Dim Minute_bcd As Byte
Dim Second_bcd As Byte

Dim Tmins As Byte
Dim Thours As Byte

Dim Position As Byte
Position = 1

Dim Displaystr As String * 4
Dim Digitstring As String * 1
Dim Tempstr As String * 4
Dim Timestr As String * 4

Dim Value As Byte

Dim Tenthcount As Byte

Dim Time_dcf As Byte
Time_dcf = 250



' Main Loop ===================================================================

Seconds = 0
Minutes = 6
Hours = 18

Displaystr = "1806"





Tenthcount = 0


' Subroutines =================================================================






' Timer ISR ===================================================================

Renderdisplay_isr:                                          '50 Hz
   Timer0 = Timer0_count

   Incr Position
   If Position > 4 Then
      Position = 0
   End If

   Digitstring = Mid(displaystr , Position , 1 )

   Portc = Position

   Shift Value , Left , 4
   Value = Value Or Val(digitstring)
   Portd = Value
Return


Tenthsecondtimer_isr:
   Timer1 = Timer1_tenthsecondcount

   Incr Tenthcount
   Timestr = Displaystr
   If Tenthcount = 5 Or Tenthcount = 10 Then
   End If

   If Tenthcount > 9 Then                                   ' One Second

      Tenthcount = 0
      Timestr = Str(minutes)
      If Len(timestr) < 2 Then Timestr = "0" + Timestr
      Tempstr = Str(hours)
      Timestr = Tempstr + Timestr
      If Len(timestr) < 4 Then Timestr = "0" + Timestr
      Displaystr = Timestr
   End If

 Return
