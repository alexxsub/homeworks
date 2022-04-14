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
# $used = [math]::round(($totalmemory - $freememory)/1024,2)
$used = [math]::round(( $totalmemory-$freememory ),2)
$usepercent = [math]::round(( $used/$totalmemory )*100,2)

$id = $env:COMPUTERNAME
# $data = "win_mem,devId=$id total_mem=$totalmemory,free_mem=$freememory "+ [DateTimeOffset]::Now.ToUnixTimeSeconds()*1000000000
$data = "win_mem,devId=$id use_mem_percent=$usepercent" + " "+ [DateTimeOffset]::Now.ToUnixTimeSeconds()*1000000000
Write-Host $data