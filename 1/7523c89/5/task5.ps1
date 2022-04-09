Remove-Variable -Name * -Force -ErrorAction SilentlyContinue

$cpu_counter = Get-Counter "\процессор(_total)\% загруженности процессора" #Get-Counter "\processor(_total)\% processor time"
$cpu = $cpu_counter.Readings.Split()[4]
$cpu = $cpu.Split(',')
$cpu = $cpu[0]+"."+$cpu[1].Remove(2)

$ts = (New-TimeSpan -Start (Get-Date "01/01/1970") -End ($cpu_counter.Timestamp)).TotalSeconds
$ts = [string]$ts
$out = "CPU_used,task=5"+" %CPU_time="+"$cpu"+" "+ $ts.Replace('.','')+'0000'

Write-Output $out
Remove-Variable -Name * -Force -ErrorAction SilentlyContinue
