$cpu_usage = Get-WmiObject Win32_Processor | Select-Object LoadPercentage | Format-Wide | Out-String
$cpu_usage = $cpu_usage.Trim()


$os = Get-Ciminstance Win32_OperatingSystem

$total_mem = $os | Select-Object TotalVisibleMemorySize | Format-Wide | Out-String
$free_mem = $os | Select-Object FreePhysicalMemory | Format-Wide | Out-String

$total_mem = $total_mem.Trim()
$free_mem = $free_mem.Trim()
$usage_mem = $total_mem - $free_mem

$usage_mem_percent = [math]::Round($usage_mem * 100 / $total_mem, 1)
$time_marker = "$([DateTimeOffset]::Now.ToUnixTimeMilliseconds())000000"

"cpu_usage percent=$cpu_usage $time_marker"
"mem_usage percent=$usage_mem_percent $time_marker"
