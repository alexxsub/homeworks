
$Processor = (Get-WmiObject -Class win32_processor -ErrorAction Stop | Measure-Object -Property LoadPercentage -Average | Select-Object Average).Average

$Timestamp = (New-TimeSpan -Start (Get-Date "01/01/1970") -End (Get-Date)).TotalSeconds -replace ',',''

Write-Host "cpu cpu_usage_percent=" $Processor " " $Timestamp -Separator ""

