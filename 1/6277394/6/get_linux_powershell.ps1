<#
Tested on:

Name                           Value
----                           -----
PSVersion                      7.1.3
PSEdition                      Core
GitCommitId                    7.1.3
OS                             Linux 3.10.0-1160.25.1.el7.x86_64 #1 SMP Wed Apr 28 21:49:45 UTC 2021
Platform                       Unix
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0…}
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1
WSManStackVersion              3.0

#>

$z = free --mega | Select-String -Pattern "Mem:\s+(?<total>\d+)\s+(?<used>\d+)\s+(?<free>\d+)\s+(?<shared>\d+)\s+(?<buff>\d+)\s+(?<aval>\d+)"
# get mem data
$aval = $z.Matches[0].Groups['aval'].value
$totalmemory = $z.Matches[0].Groups['total'].value
$used = $z.Matches[0].Groups['used'].value
$freememory = $z.Matches[0].Groups['free'].value
# get hostname
$id = $env:HOSTNAME

Write-host ("posix_mem,devId=$id total_mem=$totalmemory,free_mem=$freememory,used=$used "+ [DateTimeOffset]::Now.ToUnixTimeSeconds())
