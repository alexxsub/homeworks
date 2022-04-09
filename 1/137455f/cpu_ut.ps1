$cpu_ut=(Get-WmiObject win32_processor).LoadPercentage
$mem=(Get-WmiObject win32_operatingsystem).TotalVisibleMemorySize-(Get-WmiObject win32_operatingsystem).FreePhysicalMemory
$meas_time=[math]::Round((New-TimeSpan -Start (Get-Date "01/01/1970") -End (Get-Date)).TotalSeconds)
$cpu_meas="cpu, host=$env:computername,contur=prod cpu_used=$cpu_ut $meas_time"
Write-Output $cpu_meas
