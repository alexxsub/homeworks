<# 
requirements:
    windows :
        7,10 langue - RUS
    powershell:
        5.0+

example output:
    win_mem,devId=PC-ADM total_mem=8072,free_mem=920 1648722450
#>

$totalmemory = [math]::round((Get-WMIObject Win32_OperatingSystem).TotalVisibleMemorySize/1024,0)
$freememory = (get-counter -counter "\память\доступно мб").CounterSamples[0].CookedValue

$id = $env:COMPUTERNAME
$data = "win_mem,devId=$id total_mem=$totalmemory,free_mem=$freememory "+ [DateTimeOffset]::Now.ToUnixTimeSeconds()

Write-Host $data