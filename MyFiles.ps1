# 1. Creating Variable
$myfile = "myawesomefile.txt"

#2. Create txt file using variable
New-Item -Path ".\$myfile" -ItemType File -Value "I created this awesome file"

#3. Checking Content in the file.
Get-Content -Path $myfile