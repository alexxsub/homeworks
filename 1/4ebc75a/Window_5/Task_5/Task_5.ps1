$Time = "$(([DateTimeOffset](Get-Date)).ToUnixTimeMilliseconds())000000"

$CpuLoad = (Get-WmiObject win32_processor | Measure-Object -property LoadPercentage -Average | Select Average ).Average

Write-Host "CPU load is" $CpuLoad "%" $Time
