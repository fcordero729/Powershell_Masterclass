# Welcome Message
Write-Host "Welcome to the File Renamer"

# Prompt the user for the filename
$filename = Read-Host "Enter the name of the file you want to rename (including extension)"

# Check if the file exists
if (Test-Path $filename) {
    Write-Host "File Found! Preparing to rename"

    #Retrieve the file's object
    $fileinfo = Get-Item $filename

    #Extract the creation time
    $creationdate = $fileinfo.CreationTime

    # Display the creation date to the user
    Write-Host "File was created on: $((Get-Date $creationdate -Format 'yyyy-MM-dd'))"

    # Construct the new filename using the creation data
    $newfilename = "$(($creationdate).ToString('yyyyMMdd'))_$($fileinfo.BaseName)$($fileinfo.Extension)"

    # Rename the file
    Rename-Item $filename $newfilename

    # Inform the user of sccessful renaming
    Write-Host "File successfully renamed from $($fileinfo.Name) to $newfilename"

} else {
    # Inform the user if file doesn't exist and exit script
    Write-Host "Error: The file $filename does not exist in the current directory"
}