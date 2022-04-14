$OS = "Windows"
$HOSTNAME = (hostname)
$CompName  = "localhost"
$CPU = ([math]::round($(Get-Counter '\Processor(*)\% Processor Time' | select -expand CounterSamples | where{$_.InstanceName -eq '_total'} | Measure-Object -Property CookedValue -Average).Average,2))
		
Write-Host "measurement_cpu_custom,host=$HOSTNAME,os=$OS custom_cpu_total=$CPU $( [long](([datetime]::UtcNow)-(Get-Date -Date '1/1/1970')).TotalMilliseconds * 1000000)"