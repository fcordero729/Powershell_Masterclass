# Get System Information
$computername = $env:COMPUTERNAME
$osinfo = Get-CimInstance Win32_OperatingSystem
$cpu = (Get-CimInstance Win32_Processor).LoadPercentage
$totalmemory = $osinfo.TotalVisibleMemorySize / 1MB
$freememory = $osinfo.FreePhysicalMemory / 1MB
$totalspace = (Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object DeviceID -eq 'C:').Size / 1GB
$freespace = (Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object DeviceID -eq 'C:').FreeSpace / 1GB

# Calculate system uptime
$uptime = (Get-Date) - $osinfo.LastBootUpTime
$uptimedays = $uptime.days
$uptimehours = $uptime.Hours
$uptimeminutes = $uptime.Minutes

# Create the report
$report = "System Health Report`n"
$report += "-----------------------------------`n"
$report += "Generated on: {0:yyyy-MM-dd HH:mm:ss}`n" -f (Get-Date)
$report += "-----------------------------------`n"
$report += "Computer Name: {0}`n" -f $computername
$report += "OS Name: {0}`n" -f $osinfo
$report += "OS Version: {0}`n" -f $osinfo.Version
$report += "CPU Usage: {0}%`n" -f $cpu
$report += "Memory: {0:N2} GB free of {1:N2} GB`n" -f $freememory, $totalmemory
$report += "Disk (C:): {0:N2} GB free of {1:N2} GB`n" -f $freespace, $totalspace
$report += "-----------------------------------`n"
# Advanced uptime formatting with conditional statements
$report += "System Uptime: {0}`n`n" -f $(
    $uptimestring = ""
    if ($uptimedays -gt 0) {
        $uptimestring += "$uptimedays days, "
    }
    if ($uptimehours -gt 0 -or $uptimedays -gt 0) {
        $uptimestring += "$uptimehours hours, "
    }
    $uptimestring += "$uptimeminutes minutes"
    $uptimestring
)
# Add last boot time to the report
$report += "Last Boot Time: {0:yyyy-MM-dd HH:mm:ss}`n" -f $osinfo.LastBootUpTime
$report += "-----------------------------------`n"
# Calculate and add usage percentages
$memoryusagepercent = 100 - (($freememory / $totalmemory) * 100)
$diskusagepercent = 100 - (($freespace / $totalspace) * 100)
$report += "Usage Percentages:`n"
$report += "Memory: {0:N2}% used`n" -f $memoryusagepercent
$report += "Disk (C:): {0:N2}% used`n" -f $diskusagepercent

# Display the report
Write-Host $report

# Optionally, save the report to a file
$report | Out-File -FilePath "SimpleSystemHealthReport.txt"