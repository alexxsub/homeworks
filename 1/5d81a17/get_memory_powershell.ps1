
$ComputerMemory = Get-WmiObject -Class win32_operatingsystem -ErrorAction Stop
$Memory = ((($ComputerMemory.TotalVisibleMemorySize - $ComputerMemory.FreePhysicalMemory)*100)/ $ComputerMemory.TotalVisibleMemorySize) 

$RoundMemory = [math]::Round($Memory, 2)

$MemoryUsed = $RoundMemory -replace ',','.'

$Timestamp = (New-TimeSpan -Start (Get-Date "01/01/1970") -End (Get-Date)).TotalSeconds -replace ',',''

Write-Host "memory memory_usage_percent=" $MemoryUsed " " $Timestamp -Separator ""

