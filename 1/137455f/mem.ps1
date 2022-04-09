$mem=(Get-WmiObject win32_operatingsystem).TotalVisibleMemorySize-(Get-WmiObject win32_operatingsystem).FreePhysicalMemory
$meas_time=[math]::Round((New-TimeSpan -Start (Get-Date "01/01/1970") -End (Get-Date)).TotalSeconds)
$mem_meas="memory, host=$env:computername,contur=prod memory_used=$mem $meas_time"
Write-Output $mem_meas

