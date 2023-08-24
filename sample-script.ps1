# Get the current date and time
Write-Host "START Script for Fault."
$timestamp = Get-Date

# Format the timestamp as a string
$timestampString = $timestamp.ToString("yyyyMMddHHmmss")
$fileName = "FaultTestdummy"+$timestampString+".txt"
$filePath = Join-Path $env:TEMP $fileName
$content = "This is a test content from fault injection script."
$content | Set-Content -Path $filePath

$fileItem = Get-Item -Path $filePath 
Write-Host "Full Path: $($fileItem.FullName)"


$processList = Get-Process | Select-Object Name, Id

$processList | ForEach-Object {
    $_.Name + " (PID: " + $_.Id + ")" | Out-File -Append -FilePath $filePath
}
Write-Host "End Script for Fault."
