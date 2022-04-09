<# 
requirements:
    windows :
        7,10 langue - RUS
    powershell:
        5.0+

example output:
    win_processor,devId=PC-ADM cpu_0=36.38,cpu_1=27.07,cpu_2=19.32,cpu_3=44.14,cpu_total=31.73 1648720856
#>


$cpu_path = Join-Path -Path '\\' -ChildPath $env:COMPUTERNAME | Join-Path  -ChildPath '\процессор(*)\% загруженности процессора'

$id = $env:COMPUTERNAME
$data = "win_processor,devId=$id "
$cpuraw = (Get-Counter $cpu_path).CounterSamples

for ($i = 0; $i -lt $cpuraw.count -1 ; $i++) {
    $data += "cpu_" + $cpuraw[$i].InstanceName + "="+ [math]::round($cpuraw[$i].CookedValue,2)+","

}
$data += "cpu" + $cpuraw[-1].InstanceName + "="+ [math]::round($cpuraw[-1].CookedValue,2) + " "+ [DateTimeOffset]::Now.ToUnixTimeSeconds()

Write-Host $data