$cores = (Get-WmiObject -Query "select Name, PercentProcessorTime from Win32_PerfFormattedData_PerfOS_Processor")
$cores | foreach-object {
    If ($_.Name -ne "_Total") {
        $timestamp = [int](New-TimeSpan -Start (Get-Date "01/01/1970") -End (Get-Date)).TotalSeconds
        Write-Host "cpu,core_num=$($_.Name),type=cpu cpuload=$($_.PercentProcessorTime) $($timestamp)"
    }
};
