# Get the total space on the C drive (in GB), rounded to 2 decimal places
$totalspace = [Math]::Round((Get-CimInstance -ClassName Win32_LogicalDisk -Filter "Deviceid='C:'").Size / 1GB, 2)

# Get free space on C Drive in GB, rounded to 2 decimal places
$freespace = [Math]::Round((Get-CimInstance -ClassName Win32_LogicalDisk | Where-Object DeviceID -eq 'C:').FreeSpace / 1GB, 2)


# Calculate the percentage of free space
$freepercentage = ($freespace / $totalspace) * 100

# Calculate used space
$usedspace = $totalspace - $freespace

# Calculate used percentage
$usedpercentage = ($usedspace / $totalspace) * 100

# Check free space and provide appropriate message
if ($usedpercentage -gt 90) {
    Write-Host "Critical: Your C drive is nearly full! $([Math]::Round($usedpercentage, 2))% of space is used!"
}
elseif ($usedpercentage -gt75) {
    Write-Host "Warning: Your C drive is getting full. $([Math]::Round($usedpercentage, 2))% of space is used."
}
else {
    Write-Host "Ok: Your C drive has plenty of space. Only $([Math]::Round($usedpercentage, 2))% of space is used."
}