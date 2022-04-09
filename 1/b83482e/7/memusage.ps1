Add-Type -AssemblyName System.Runtime
$w32os = Get-CimInstance -ClassName Win32_OperatingSystem
$memusage = 100 - $w32os.FreePhysicalMemory * 100 / $w32os.TotalVisibleMemorySize

"meminfo memusagepercentage=$memusage $([DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()*1000000)"