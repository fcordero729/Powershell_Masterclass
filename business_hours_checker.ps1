# Get current day and hour
$currentday = (Get-Date).DayOfWeek
$currenthour = (Get-Date).Hour

# Check if it's a weekday
$isweekday = $currentday -ge 1 -and $currentday -le 5

# Check if it's business hours
$isbusinesshours = $currenthour -ge 9 -and $currenthour -lt 17

# Evaluate the conditions
if ($currentday -eq "Wednesday" -and $currenthour -ge 14 -and $currenthour -lt 15) {
    Write-Host "Team meeting time"
}
elseif ($isweekday -and $isbusinesshours) {
    Write-Host "Business hours"
}
else {
    Write-Host "Off hours"
}