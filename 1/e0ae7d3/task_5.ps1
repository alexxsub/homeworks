$cpu_usage = Get-WmiObject Win32_Processor | Select-Object LoadPercentage | Format-Wide | Out-String
$cpu_usage = $cpu_usage.Trim()
$time_marker = "$([DateTimeOffset]::Now.ToUnixTimeMilliseconds())000000"
"cpu_usage percent=`"$cpu_usage`" $time_marker"