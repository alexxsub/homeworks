$MEASUREMENT = "MEMORY-PS"
$TAG_KEYS = 'host="Windows10"'

$CompObject =  Get-WmiObject -Class WIN32_OperatingSystem

$TOTAL =$CompObject.TotalVisibleMemorySize
$FREE = $CompObject.FreePhysicalMemory
$USED = ($TOTAL - $FREE)
$FIELD_KEYS = [string]("Total="+$TOTAL+",Free="+$FREE+",Used="+$USED)
$TIME = [int64]([double](Get-Date(Get-Date).ToUniversalTime() -uformat "%s")*1000000000)
Write-Host $MEASUREMENT","$TAG_KEYS $FIELD_KEYS $TIME
