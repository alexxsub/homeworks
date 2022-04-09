$Time = "$(([DateTimeOffset](Get-Date)).ToUnixTimeMilliseconds())000000"

$Computer_memory = Get-WmiObject -Class win32_operatingsystem -ErrorAction Stop
$Memory = ((($Computer_memory.TotalVisibleMemorySize - $Computer_memory.FreePhysicalMemory)*100)/ $Computer_memory.TotalVisibleMemorySize)

Write-Host "memory used=$Memory $Time"
