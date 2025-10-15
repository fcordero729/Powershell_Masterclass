# Like Operator Example
$filename = Read-Host "Enter the name of a file in this format: report_YYYY_MM_DD.xlsx"
if ($filename -like "reprot_*.xlsx") {
    Write-Host "Valid report filename."
} else {
    Write-Host "Invalid report filename. It should be in the format 'report_YYYY_MM_DD.xlsx"
}