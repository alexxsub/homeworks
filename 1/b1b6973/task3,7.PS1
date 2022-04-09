CLS


$MEASUREMENT = "MEMORY"
$TAG_KEYS = "host=Windows"

$CompObject =  Get-WmiObject -Class WIN32_OperatingSystem

$TOTAL =$CompObject.TotalVisibleMemorySize
$FREE = $CompObject.FreePhysicalMemory
$USED = ($TOTAL - $FREE)
$FIELD_KEYS = [string]("Total="+$TOTAL+",Free="+$FREE+",Used="+$USED)
$TIME = [int64](New-TimeSpan -Start (Get-Date "01/01/1970") -End (Get-Date)).TotalMilliseconds*1000000
Write-Host $MEASUREMENT $TAG_KEYS $FIELD_KEYS $TIME


$MEASUREMENT = "CPU"
$TAG_KEYS = "host=Windows"

$CPU = Get-WmiObject -Class Win32_Processor | Select LoadPercentage
$FIELD_KEYS = [string]("percent="+$Proc.LoadPercentage)
$TIME = [int64](New-TimeSpan -Start (Get-Date "01/01/1970") -End (Get-Date)).TotalMilliseconds*1000000

Write-Host $MEASUREMENT $TAG_KEYS $FIELD_KEYS $TIME