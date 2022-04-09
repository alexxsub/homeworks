$OS = "Windows"
$HOSTNAME = (hostname)
$MEASURE = "Kb"
$CompName  = "localhost"
$CompObject =  Get-WmiObject -Class WIN32_OperatingSystem -ComputerName $CompName

Write-Host "measurement_memory,host=$HOSTNAME,os=$OS,measure=$MEASURE total=$([math]::Round($CompObject.TotalVisibleMemorySize / 1024)),free=$([math]::Round($CompObject.FreePhysicalMemory / 1024)),used=$([math]::Round(($CompObject.TotalVisibleMemorySize - $CompObject.FreePhysicalMemory) / 1024)) $( [long](([datetime]::UtcNow)-(Get-Date -Date '1/1/1970')).TotalMilliseconds * 1000000)"