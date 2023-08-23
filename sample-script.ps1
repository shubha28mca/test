# Get the current date and time
$timestamp = Get-Date

# Format the timestamp as a string
$timestampString = $timestamp.ToString("yyyyMMddHHmmss")
$fileName = "FaultTestdummy"+$timestampString+".txt"
$filePath = Join-Path $env:TEMP $fileName
$content = "This is a test content from fault injection script."
$content | Set-Content -Path $filePath

$processList = Get-Process | Select-Object Name, Id

$processList | ForEach-Object {
    $_.Name + " (PID: " + $_.Id + ")" | Out-File -Append -FilePath $filePath
}
