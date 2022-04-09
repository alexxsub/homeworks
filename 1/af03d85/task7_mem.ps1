
$ComputerMemory = Get-WmiObject -Class win32_operatingsystem -ErrorAction Stop
$Memory = ((($ComputerMemory.TotalVisibleMemorySize - $ComputerMemory.FreePhysicalMemory)*100)/ $ComputerMemory.TotalVisibleMemorySize)
$Total = [math]::Round($ComputerMemory.TotalVisibleMemorySize, 2)
$Used = [math]::Round($ComputerMemory.TotalVisibleMemorySize - $ComputerMemory.FreePhysicalMemory, 2)
$Free = [math]::Round($ComputerMemory.FreePhysicalMemory, 2)
echo "mem,host=host=$env:COMPUTERNAME,total=$Total,used=$Used,free=$Free,$([int64](Get-Date -UFormat %s))"
