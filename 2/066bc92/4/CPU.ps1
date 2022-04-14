$CurrentTimeStamp = [int][double]::Parse((Get-Date (get-date).touniversaltime() -UFormat %s))
$ComputerInfo = Get-WmiObject -Class win32_operatingsystem
$ComputerCPU = Get-WmiObject -Class win32_processor
$CPUUsagePercentage = $ComputerCPU.LoadPercentage
Write-Output "cpu,host=$($ComputerInfo.PSComputerName) Usage_percent=$(`"$CPUUsagePercentage`") $($CurrentTimeStamp)000000000" 