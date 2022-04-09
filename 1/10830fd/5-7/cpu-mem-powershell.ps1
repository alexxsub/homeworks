$CpuLoad = (Get-WmiObject win32_processor | Measure-Object -property LoadPercentage -Average | Select Average ).Average
$Utime = [math]::floor([int64](Get-Date -uformat '%s')/100000)
$CompObject =  Get-WmiObject -Class WIN32_OperatingSystem
#$Memory = ((($CompObject.TotalVisibleMemorySize - $CompObject.FreePhysicalMemory)*100)/ $CompObject.TotalVisibleMemorySize)
$MemFull = $CompObject.TotalVisibleMemorySize
$MemFree = $CompObject.FreePhysicalMemory
$MemUS = ((($MemFull - $MemFree)*100)/$MemFull)
$HostName = $CompObject.PSComputerName
"CPU, host={0}, bysy_procent={1}, unixtime={2}" -f $HostName, $CpuLoad, $Utime
"Memory, host={0}, mem-full={1} mem-usage-proc={2:n2}, unixtime={3}" -f $HostName, $MemFull, $MemUS, $Utime                                                                                                                                                          
