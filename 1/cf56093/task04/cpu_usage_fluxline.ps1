$str_top_out=top -bn1

$str_cpu = $str_top_out -match "\d\d,\d id,"
$str_meshures = $str_cpu -split ", "
$str_cpu_idle=$str_meshures[3] -replace ' id'

[double]$cpu_idle=$str_cpu_idle -replace ',', '.'

$cpu_usage=[math]::round((100-$cpu_idle),1)


$utime = [int64](([datetime]::UtcNow)-(get-date "1/1/1970")).TotalMilliseconds*1000000


Write-Host  cpu_usage","cpu_usage=$cpu_usage $utime
