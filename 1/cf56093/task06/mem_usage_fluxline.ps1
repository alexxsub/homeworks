$str_mem_total = Get-Content -path /proc/meminfo | Where-Object {$_ -match "^MemTotal.*"}
$str_mem_free = Get-Content -path /proc/meminfo | Where-Object {$_ -match "^MemFree.*"}

[long]$mem_total=($str_mem_total -replace '\D+')
[long]$mem_free=($str_mem_free -replace '\D+')

$mem_total=$mem_total*1024
$mem_free=$mem_free*1024

[int]$mem_usage_percent=[math]::Round(($mem_total-$mem_free)/$mem_total*100)

$utime = [int64](([datetime]::UtcNow)-(get-date "1/1/1970")).TotalMilliseconds*1000000

[string]$str_mem_total=$mem_total

Write-Host  mem_usage","totalmem=$str_mem_total","freemem=$mem_free","mem_usage_percent=$mem_usage_percent $utime
