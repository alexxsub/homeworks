<#
Нагрузочное тестирование максимум загрузки CPU в три потока все ядра
Системные требования.
Windows 7+ , powershell 5.1.X

#>
Write-Host Нагрузочное тестирование максимум загрузки CPU в три потока все ядра
$NumberOfLogicalProcessors = Get-WmiObject win32_processor | Select-Object -ExpandProperty NumberOfLogicalProcessors
& taskmgr
ForEach ($core in 1..$NumberOfLogicalProcessors){ 
 
start-job -ScriptBlock{
 
    $result = 123;
    foreach ($loopnumber in 1..2147483647){
        $result=123;
        
        foreach ($loopnumber1 in 1..2147483647){
        $result=123;
            
            foreach($number in 1..2147483647){
                $result = $result * $number
            }
        }
 
            $result
        }
    }
}
 
Read-Host "Для останова нажмите Enter ..."
Stop-Job *