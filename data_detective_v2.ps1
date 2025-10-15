# -Is Operator Example
$userinput = 43

if ($userinput -is [int]) {
        Write-Host "Good job! You entered an interger."
} else {
        Write-Host "Try again! You didn't enter an interger"
}