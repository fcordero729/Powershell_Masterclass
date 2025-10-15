# Prompt the user for the application name
$appname = Read-Host "Enter the name of the application"

# Create the app data directory name
$appDataDir = "${appName}_Data"

# Prompt the user for a custom message
$customMessage = Read-Host "Enter a custom Message for the configuration File"

# 1. Create a new directory named "MyAwesomeAppData"
New-Item $appDataDir -ItemType "Directory"


# 2. Create a Configuration text file and write content
New-item -Path "$appDataDir\Config.txt" -ItemType "File"

# Add content to config file, including the custom message and timestamp
Add-Content -Path "$appDataDir\config.txt" -Value "Configuration for $appName`nCustom Message: $customMessage`nCreated on: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

# 3. Verify that the directory was created:
Get-ChildItem $appDataDir

# 4. Verify that the content was added:
Get-Content -Path "$appDataDir\config.txt"