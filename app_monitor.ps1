# Ask the user for the process name
$process_name = Read-Host "Enter the name of the application"

# Try to get the process
$process_object = Get-Process $process_name

# Check if the process is running and responding
if (!$process_object) {
    Write-Host "$process_name is not currently running"
}
elseif ($process_object.Responding) {
    Write-Host "$process_name is working correctly"
}
else {
    Write-Host "$process_name is unresponsive, closing..."
    $process_object.kill()
}