# Function to check the status of a given service
function Check-ServiceStatus {
    param ($serviceName)
    $service_status = (get-service -name $serviceName).status
    if ($service_status -eq 'Stopped') {
        Write-Host "$serviceName service is stopped. Attempting to start..."
        #Start-Service -name $serviceName
    } else {
        Write-Host "Windows update service is running. No action needed."
    } 
}

# Example usage:
Check-ServiceStatus "Wuauserv"
Check-ServiceStatus "windefend"
