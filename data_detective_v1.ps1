# Conversion Operator Example
$userinput = Read-Host "Enter a Number"
if ($userinput -match '^\d+$') {
    Write-Host "Good job! You entered a valid whole number: $userinput"
} else {
    Write-Host "Try again! You didn't enter a whole number."
}
