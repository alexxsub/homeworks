$OS = "Windows"
$HOSTNAME = (hostname)
$CompName  = "localhost"
$CompObject =  Get-WmiObject -Class WIN32_OperatingSystem -ComputerName $CompName
$Counters = (Get-Counter -ListSet Processor).PathsWithInstances | ? {$_ -match [RegEx]::Escape("\Processor(_Total)\% Processor Time")}
$CPU = ([math]::round($(Get-Counter '\Processor(*)\% Processor Time' | select -expand CounterSamples | where{$_.InstanceName -eq '_total'} | Measure-Object -Property CookedValue -Average).Average,2))
		
Write-Host "measurement_cpu_memory,host=$HOSTNAME,os=$OS custom_cpu_total=$CPU,custom_used_memory=$([math]::Round($($($CompObject.TotalVisibleMemorySize - $CompObject.FreePhysicalMemory) / 1024 / 1024),2)) $( [long](([datetime]::UtcNow)-(Get-Date -Date '1/1/1970')).TotalMilliseconds * 1000000)"