$total=((Get-WmiObject Win32_PhysicalMemory).Capacity)/1024
$free=(Get-Counter '\Memory\Available KBytes').CounterSamples.CookedValue
$used_kbytes=$total-$free
$used_percent=($used_kbytes/$total)*100
$used_percent=[math]::Round($used_percent, 2)
Write-Host -NoNewline "memory,host=windows usage_percent=$used_percent,usage_kbytes=$used_kbytes $(get-date -UFormat %s)"
