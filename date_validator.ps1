# Exercise to create script that validates a user-entered date
$userdate = Read-Host "Enter Date example YYYY-MM-DD"

# Check if the user input is a string

if ($userdate -as [string]) {
    Write-Host "Good Start! You entered a string."
    # Use a wildcard pattern to check if the input matches the YYYY-MM-DD format
    # ???? represents any four characters (for the year)
    # ?? represents any two characters (for the month and day)
    if ($userdate -like "????-??-??") {
        Write-Host "Fantastic! That is the correct format."
    } else {
        Write-Host "Nice try, but that's not quite the right format. Remember, we need YYYY-MM-DD!"
    }
} else {
    # If the input is not a string, inform the user and exit the script
    Write-Host "Oops! That's not a string. Try again!"
}