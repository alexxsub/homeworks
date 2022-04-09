$us=(Get-WmiObject -Class win32_processor -ErrorAction Stop | Measure-Object -Property LoadPercentage -Average | Select-Object Average).Average
echo "cpu,host=$env:COMPUTERNAME,usage=$us,$([int64](Get-Date -UFormat %s))"
