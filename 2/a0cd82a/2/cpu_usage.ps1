$timestamp = [long]((New-TimeSpan -Start (Get-Date -Date '1970-01-01') -End ((Get-Date).ToUniversalTime())).TotalSeconds * 1E9)
$hostname=$env:computername.ToLower()

Get-Counter -Counter "\238(_total)\6"  | ForEach {
    
      $met = @(
            "cpu,cpu=cpu_total,host=$hostname usage_percent=",[Math]::Round($_.CounterSamples.CookedValue), " $timestamp"
            
        )
    } 
$met -join ''
