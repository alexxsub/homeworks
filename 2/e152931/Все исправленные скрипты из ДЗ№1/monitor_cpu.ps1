# Processor utilization
$Processor = (Get-WmiObject -Class win32_processor -ErrorAction Stop | Measure-Object -Property LoadPercentage -Average | Select-Object Average).Average

# Memory utilization
$ComputerMemory = Get-WmiObject -Class win32_operatingsystem -ErrorAction Stop
$Memory = ((($ComputerMemory.TotalVisibleMemorySize - $ComputerMemory.FreePhysicalMemory)*100)/ $ComputerMemory.TotalVisibleMemorySize)
$RoundMemory = [math]::Round($Memory, 1)

$host1=$env:computername | Select-Object

$timestamp=[DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()*1000000

$result="cpu,host="+$host1+",cpu=cpu_total1 busy_percent="+$Processor+" "+$timestamp 
#"memory,host="+$host1+" busy_percent="+$RoundMemory+" "+$timestamp
echo $result

