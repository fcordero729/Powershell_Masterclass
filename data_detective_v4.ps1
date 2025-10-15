# Notlike operator Example
$documentName = Read-Host "Enter the name of a document"

if ($documentName -notlike "*.txt") {
    Write-Host "The document is not a text file."
} else {
    Write-Host "The document is a text file."
}