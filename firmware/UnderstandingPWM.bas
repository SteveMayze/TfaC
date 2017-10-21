

$crystal = 1000000
$regfile = "m88adef.dat"
$hwstack = 40
$swstack = 40
$framesize = 60

Piezo Alias Portb.1
Config Piezo = Output

Dim A As Byte

Config Timer1 = Timer , Compare A = Toggle , Prescale = 1 , Clear Timer = 1

Do

   Gosub Buzzer_on
   Waitms 250

   Gosub Buzzer_off
   Wait 5


Loop
End


Buzzer_on:
   Compare1a = 397
   Tccr1a.6 = 1
   ' Tccr1a.7 = 0
Return

Buzzer_off:
   Tccr1a.6 = 0
   ' Tccr1a.7 = 0
Return