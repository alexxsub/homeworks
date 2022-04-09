$timestamp = Get-Date (Get-Date).ToUniversalTime() -UFormat %s -Millisecond 0

Get-Counter -Counter "\238(_total)\6"  | ForEach {
    
      $met = @(
          "cpu_usage",  ' ', "percent=", [Math]::Round($_.CounterSamples.CookedValue, 2), ' ', $timestamp
            
        )
    } 
$met -join ''
