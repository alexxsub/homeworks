$MEASUREMENT = "CPU-PS"
$TAG_KEYS = 'host="Windows10"'

$CPU = Get-WmiObject -Class Win32_Processor | Select LoadPercentage
$FIELD_KEYS = [string]("percent="+$CPU.LoadPercentage)
$TIME = [int64]([double](Get-Date(Get-Date).ToUniversalTime() -uformat "%s")*1000000000)

Write-Host $MEASUREMENT","$TAG_KEYS $FIELD_KEYS $TIME