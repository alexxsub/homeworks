#Скрипт вычисляет количество логических ядер в системе и запускает задачу в несколько потоков. 
#Изменяя значение переменной iterator, можно моделировать разную нагрузку.Значение переменной должно быть строго ниже количества логических ядер в системе.

$iterator = 2

$NumberOfLogicalProcessors = Get-WmiObject win32_processor | Select-Object -ExpandProperty NumberOfLogicalProcessors
ForEach ($core in 1..($NumberOfLogicalProcessors - $iterator)){ 
start-job -ScriptBlock{
    $result = 1;
    foreach ($loopnumber in 1..2147483647){
        $result=1;
        
        foreach ($loopnumber1 in 1..2147483647){
        $result=1;
            
            foreach($number in 1..2147483647){
                $result = $result * $number
            }

        }

            $result
        }
    }
}
Read-Host "Press any key to exit..."
Stop-Job * 

