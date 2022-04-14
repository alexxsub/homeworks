$CurrentTimeStamp = [int][double]::Parse((Get-Date (get-date).touniversaltime() -UFormat %s))
$ComputerInfo = Get-WmiObject -Class win32_operatingsystem
$MemoryUsagePercentage = [math]::Round( ((($ComputerInfo.TotalVisibleMemorySize - $ComputerInfo.FreePhysicalMemory)*100)/ $ComputerInfo.TotalVisibleMemorySize))
Write-Output "mem,host=$($ComputerInfo.PSComputerName) Usage_percent=$($MemoryUsagePercentage) $($CurrentTimeStamp)000000000"