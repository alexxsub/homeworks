$timestamp = Get-Date (Get-Date).ToUniversalTime() -UFormat %s -Millisecond 0

Get-Counter -Counter "\4\% использования выделенной памяти" | ForEach {
    
      $met = @(
          "memory_usage",  ' ', "percent=", [Math]::Round($_.CounterSamples.CookedValue, 2), ' ', $timestamp
            
        )
    } 
$met -join ''

