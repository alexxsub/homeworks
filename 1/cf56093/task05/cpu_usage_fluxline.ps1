$cpu_usage = Get-WmiObject Win32_Processor | % { $_.LoadPercentage }


$utime = [int64](([datetime]::UtcNow)-(get-date "1/1/1970")).TotalMilliseconds*1000000


Write-Host  cpu_usage","cpu_usage=$cpu_usage $utime
