$timestamp = "$(([DateTimeOffset](Get-Date)).ToUnixTimeMilliseconds())000000"

$ComputerMemory = Get-WmiObject -Class win32_operatingsystem -ErrorAction Stop
$memory_used = ((($ComputerMemory.TotalVisibleMemorySize - $ComputerMemory.FreePhysicalMemory)*100)/ $ComputerMemory.TotalVisibleMemorySize)

Write-Output "memory used=$memory_used $timestamp"
