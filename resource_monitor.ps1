# Get system resource information
$cpu = (Get-CimInstance Win32_Processor).LoadPercentage
$memory = (Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory / 1MB

# Display current resource usage
Write-Host "Current CPU Usage: $cpu %"
Write-Host "Available Memory: $memory GB"

# Check resource conditions and display appropriate message
if (($cpu -gt 90) -and ($memory -lt 2)) {
    Write-Host "Critical: High CPU usage and low memory. Consider closing some applications"
} elseif (($cpu -gt 90) -or ($memory -lt 2)) {
    Write-Host "Warning: System resources are strained. Check running process"
} elseif (($cpu -lt 20) -and ($memory -gt 8)) {
    Write-Host "System resources are optimal. Good time for system Updates."
} else {
    Write-Host "System resources are normal."
}

# Example of using parentheses to control operator precedence
if (($cpu -gt 80 -or $memory -lt 2) -and $cpu -lt 95) {
    Write-Host "High resource usage, but not critical."
}