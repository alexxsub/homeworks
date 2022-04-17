$usage=(Get-WmiObject Win32_Processor).LoadPercentage
Write-Host -NoNewline "cpu,host=windows usage_percent=$usage $(get-date -UFormat %s)"