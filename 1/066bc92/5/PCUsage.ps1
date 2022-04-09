if ($args.Count -eq 1 -and (($args -eq "cpu") -or ($args -eq "mem")) ) {
    $CurrentTimeStamp = [math]::Round( (New-TimeSpan -Start (get-date -Date "01.01.1970") -End (get-date)).TotalSeconds)
    $ComputerInfo = Get-WmiObject -Class win32_operatingsystem
    if ($args -eq "cpu") {
        $ComputerCPU = Get-WmiObject -Class win32_processor
        $CPUUsagePercentage = $ComputerCPU.LoadPercentage
        $ReturnedMessage = "cpu, host=$($ComputerInfo.PSComputerName) Usage_percent=$($CPUUsagePercentage) $($CurrentTimeStamp)"
        Write-Host $ReturnedMessage -ForegroundColor Green
    }
    else {
        $MemoryUsagePercentage = [math]::Round( ((($ComputerInfo.TotalVisibleMemorySize - $ComputerInfo.FreePhysicalMemory)*100)/ $ComputerInfo.TotalVisibleMemorySize))
        $ReturnedMessage = "mem, host=$($ComputerInfo.PSComputerName) Usage_percent=$($MemoryUsagePercentage) $($CurrentTimeStamp)"
        Write-Host $ReturnedMessage -ForegroundColor Green
    }
}

elseif ($args -eq "-help" -or $args -eq "help" ) {
    Write-Host "Script shows CPU or Memory usage parameter" -ForegroundColor Yellow
    Write-Host ("Example: `"PCUsage.ps cpu`" - will return CPU usage") -ForegroundColor Yellow
    Write-Host ("Example: `"PCUsage.ps mem`" - will return memory usage") -ForegroundColor Yellow
} 

else {
    Write-Host ("Bad parameters! Use help for more information") -ForegroundColor Red
}
