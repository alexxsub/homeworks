$idle = ((top -n 1 -b)[2] | Select-String -Pattern ".*\s(\d+[,.]\d+).*id").Matches[0].Groups[1].Value -replace (',','.')
$usage = 100 - $idle
$id = $env:HOSTNAME
Write-Host ("posix_processor,devId=$id usage=$usage,idle=$idle "+ [DateTimeOffset]::Now.ToUnixTimeSeconds())