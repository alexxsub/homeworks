
$CompObject =  Get-WmiObject -Class WIN32_OperatingSystem 
$mem_total = $CompObject.TotalVisibleMemorySize*1024
$mem_free = $CompObject.FreePhysicalMemory*1024

[int]$mem_usage_percent=[math]::Round(($mem_total-$mem_free)/$mem_total*100)

$utime = [int64](([datetime]::UtcNow)-(get-date "1/1/1970")).TotalMilliseconds*1000000

[string]$str_mem_total=$mem_total

Write-Host  mem_usage","totalmem=$str_mem_total","freemem=$mem_free","mem_usage_percent=$mem_usage_percent $utime
