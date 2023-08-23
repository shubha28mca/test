$filePath = "C:\FaultTestdummy.txt"
$content = "This is a test content from fault injection script."
$content | Set-Content -Path $filePath

$processList = Get-Process | Select-Object Name, Id

$processList | ForEach-Object {
    $_.Name + " (PID: " + $_.Id + ")" | Out-File -Append -FilePath $filePath
}
