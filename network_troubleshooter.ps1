# Display menu options
Write-Host "Simple Network Troubleshooter"
Write-Host "1. Check Innternet Connection"
Write-Host "2. View IP Configuration"
Write-Host "3. Flush DNS"

# Get user input
$choice = Read-Host "Enter your choice (1-3)"

# Use a switch statement to handle user choice
switch ($choice) {
    "1" {
        #Check Internet Connection
        $testresult = Test-Connection -ComputerName www.google.com -Count 1 -Quiet
        if ($testresult -eq "true") {
            Write-Host "internet Connection is working."
        }
        else {
            Write-Host "Unable to connect to the internet."
        }
      }
    "2" {
        #Display IP Configuration
        $ipaddress = (Get-NetIPConfiguration).IPv4Address.IPAddress
        $DefaultGateway = (Get-NetIPConfiguration).IPv4DefaultGateway.NextHop
        Write-Host "IP Address: $ipAddress"
        Write-Host "Default Gateway: $DefaultGateway"
        }
    "3" {
        #Flush DNS Cache
        Clear-DnsClientCache
        Write-Host "DNS Cache has been flushed"
    }
    default {
        #Invalid Selection, Try Again
        Write-Host "Invalid choice, please run the script again."
       
    }
}