# Get Free Space in GB on the C drive
$freespace = [Math]::Round((Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object DeviceID -eq 'C:').FreeSpace / 1GB)

# Check free space and provide appropriate message
if ($freespace -gt 50) {
    Write-Host "Plenty of Space Available! You have $freespace GB Free"
}
elseif ($freespace -gt 20) {
    Write-Host "You're doing okay, but might want to think about clearing out some space soon. You have $freespace available free."
}
elseif ($freespace -gt 5) {
    Write-Host "Warning: You're running low on space. You have $freespace GB available"
}
else {
    Write-Host "Critical: Almost full! Time to delete some Files, you have $freespace GB available."
}