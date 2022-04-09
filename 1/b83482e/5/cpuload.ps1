Add-Type -AssemblyName System.Runtime

"cpuinfo cpuloadpercentage=$((Get-CimInstance -ClassName Win32_Processor).LoadPercentage) $([DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds()*1000000)"