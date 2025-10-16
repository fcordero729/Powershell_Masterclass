# Function to check the status of a given service
function Check-ServiceStatus {
    param ($serviceName)
    # Get the status of the specified service
    $service_status = (get-service -name $serviceName).status
    # If the service is stopped, return false; otherwise, return true
    if ($service_status -eq 'Stopped') {
        return $false
    } else {
       return $true
    } 
}

# Check the status of the Windows Update Service
if (Check-ServiceStatus "wuauserv") {
    Write-Host "Windows Update service is runnning."
}
else {
    Write-Host "Windows Update service is stopped. Attempting to start..."
    # Uncomment the following line to actually start the service
    #Start-Service -Name "wuauserv"
}
# Check the status of the Windows Defender Service
if (Check-ServiceStatus "windefend") {
    Write-Host "Windows Defender service is running. Attempting to stop..."

}
else {
    Write-Host "Windows Defender service is stopped."
}