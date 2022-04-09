$timestamp = "$(([DateTimeOffset](Get-Date)).ToUnixTimeMilliseconds())000000"
$cpu_utilization = (Get-WmiObject -Class win32_processor -ErrorAction Stop | Measure-Object -Property LoadPercentage -Average | Select-Object Average).Average

Write-Output "cpu utilization=$cpu_utilization $timestamp"
