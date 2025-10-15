# Display Menu Option
Write-Host "What system information would you like to see?`n1. Operating System `n2. CPU `n3. Total Memory `n4. Current User"

# Get User Input
$choice = Read-Host "Enter your choice (1-4)"

# Use a Switch statement to handle user choice
switch ($choice) {
    "1" {
        # Retrive Operating System Information
        $OS = Get-CimInstance Win32_OperatingSystem
        $OS_Name = $OS.Caption
        $OS_version = $os.Version
        Write-Host "Operating System: $OS_name"
        Write-Host "Version: $OS_Version"
      }
    "2" {
        # Retrive CPU Information
        $cpu = Get-CimInstance Win32_Processor
        $cpu_name = $cpu.Name
        $cpu_cores = $cpu.NumberOfCores
        $cpu_speed = $cpu.MaxClockSpeed
        Write-Host "CPU: $cpu_name"
        Write-Host "CPU Cores: $cpu_cores"
        Write-host "CPU Speed: ($cpu_speed / 1000) GHz" # Convert MHz to GHz
    }
    "3" {
        # Calculate and display total physical memory in GB
        $totalmemorygb = [Math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)
        Write-Host "Total Physical Memory: $totalmemorygb GB"

    }
    "4" {
        # Display Current User
        $currentuser = $env:USERNAME
        Write-Host "Current User: $currentuser"
    }
    Default {}
}