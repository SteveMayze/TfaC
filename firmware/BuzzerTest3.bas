$crystal = 1000000
$regfile = "m88pdef.dat"
$hwstack = 40
$swstack = 40
$framesize = 60

' $baud = 4800


Buzzer Alias Portb.1
Config Buzzer = Output
Config Timer1 = Timer , Compare A = Toggle , Prescale = 1 , Clear Timer = 1

Const Tone_pitch = 200

Dim Tone As Byte
Dim Tone_length As Integer

Const Base_length = 25

Do

   Gosub Buzzer_on
   Wait 10
   Gosub Buzzer_off
   Wait 5

'(
   Restore Melody
   Do

      Read Tone
      Tone_length = Tone And &H0F
      Tone_length = Base_length * Tone_length
      If Tone > &H80 Then
         Gosub Buzzer_off
         Waitms Tone_length
      Else
         Gosub Buzzer_on
         Waitms Tone_length
      End If
      Gosub Buzzer_off
      Tone_length = Base_length * 3
      Waitms Tone_length

   Loop Until Tone = &HFF

   Wait 5
')

Loop

End

Buzzer_on:
   Compare1a = Tone_pitch
   Tccr1a.6 = 1
   ' Tccr1a.7 = 0
Return

Buzzer_off:
   Tccr1a.6 = 0
   ' Tccr1a.7 = 0
Return

Melody:                                                     ' Wake up - Morse code
Data &H01 , &H03 , &H03 , &H83 , &H01 , &H03 , &H83 , &H03 , &H01 , &H03 , &H83 , &H01 , &H87 , &H01 , &H01 , , &H03 , &H87 , &H01 , &H03 , &H03 , &H01 , &HFF