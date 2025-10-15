# 1. Create a new directory named "Backup"
New-Item Backup -ItemType "Directory"

# 2. Creates Parameters for script
$folderPath = "C:\temp\PScripts\Backup"
$fileNames = @("File1.txt", "File2.txt", "File3.txt")

# 3. Create each file and add content
foreach ($fileName in $fileNames) {
    New-Item -Path "$folderPath\$fileName" -ItemType File -Value "This is file $filename"
}

# List the contents of the Backup Folder
Get-ChildItem -Path ".\Backup"
