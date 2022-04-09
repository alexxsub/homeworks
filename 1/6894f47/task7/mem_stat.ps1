$Memory = Get-WmiObject -Class win32_operatingsystem -ErrorAction Stop
$timestamp = [int](New-TimeSpan -Start (Get-Date "01/01/1970") -End (Get-Date)).TotalSeconds

$MemUsed = ($Memory.TotalVisibleMemorySize - $Memory.FreePhysicalMemory)
$TotalSwap = ($Memory.TotalVirtualMemorySize - $Memory.TotalVisibleMemorySize)
$SwapUsed = ($TotalSwap - ($Memory.FreeVirtualMemory - $Memory.FreePhysicalMemory))

Write-Host "memory,type=memory memtotalkb=$($Memory.TotalVisibleMemorySize) $($timestamp)"
Write-Host "memory,type=memory memusedkb=$($MemUsed) $($timestamp)"
Write-Host "memory,type=swap swaptotalkb=$($TotalSwap) $($timestamp)"
Write-Host "memory,type=swap swapusedkb=$($SwapUsed) $($timestamp)"
