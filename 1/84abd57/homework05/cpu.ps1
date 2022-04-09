$OS = "Windows"
$HOSTNAME = (hostname)
$MEASURE = "%"

$CPU = $(Get-Counter $Counters |
        Select-Object -ExpandProperty CounterSamples |
        Select-Object InstanceName, CookedValue |
        Group-Object -Property InstanceName |
        ForEach-Object {
            $Stats = $_.Group | Measure-Object -Property CookedValue -Average
            "cpu$($_.Name)=$([math]::round(($Stats).Average,2))$(if ($_.Name -ne '_total') { Write-Output "," })"
        } | Out-String |  ForEach-Object{$_ -replace "\r\n",""})

Write-Host "measurement_cpu,host=$HOSTNAME,os=$OS,measure=$MEASURE $CPU $( [long](([datetime]::UtcNow)-(Get-Date -Date '1/1/1970')).TotalMilliseconds * 1000000)"
