$crystal = 1000000
$regfile = "m88pdef.dat"
$hwstack = 40
$swstack = 40
$framesize = 60

' $baud = 4800


Buzzer Alias Portb.1
Config Buzzer = Output
Config Timer1 = Timer , Compare A = Toggle , Prescale = 1 , Clear Timer = 1

Const Timer0_startvalue = 100                               ' 0.01 seconds
Config Timer0 = Timer , Prescale = 64
Timer0 = Timer0_startvalue
On Timer0 Timer0_isr
Enable Timer0
Start Timer0
Enable Interrupts

Heartbeat Alias Portc.3
Config Heartbeat = Output : Heartbeat = 0



Const Tone_pitch = 200                                      ' 397

Dim Tone As Byte
Dim Tone_length As Integer
Dim Tone_idx As Byte
Dim Song(40) As Byte
Dim Songlen As Byte
Dim Song_finished As Bit

Const Base_length = 7


' Load the song - Songlen should be used to know the length afterwards.

Wait 5
Songlen = 0
Restore Melody
Do
   Read Tone
   If Tone <> &HFF Then
      Incr Songlen
      Song(songlen) = Tone
   End If
Loop Until Tone = &HFF
Tone_length = 1

Set Heartbeat
Wait 1

Reset Heartbeat

Do


If Song_finished = 1 Then
   Wait 10
   Tone_idx = 0
   Reset Song_finished
End If

Loop

'(         Tone_length = Tone And &H0F
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
')




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


Timer0_isr:
   Timer0 = Timer0_startvalue
   If Tone_length > 0 Then
      Decr Tone_length
      If Tone_length <= Base_length Then
         Gosub Buzzer_off
      End If
   Else
      Toggle Heartbeat
      If Tone_idx < Songlen Then
         Incr Tone_idx                                      ' Get the next tone
         Tone = Song(tone_idx)
         Tone_length = Tone And &H0F                        ' Get the tone length
         Tone_length = Base_length * Tone_length            ' Factor the tone buy the base length
         Tone_length = Tone_length + Base_length            ' Build in a unit gap at the end

         If Tone > &H80 Then
            Gosub Buzzer_off
         Else
            Gosub Buzzer_on
         End If
      Else
         Set Song_finished
      End If
   End If


Return

Melody:                                                     ' Wake up - Morse code
Data &H01 , &H03 , &H03 , &H83 , &H01 , &H03 , &H83 , &H03 , &H01 , &H03 , &H83 , &H01 , &H87 , &H01 , &H01 , &H03 , &H83 , &H01 , &H03 , &H03 , &H01 , &HFF
