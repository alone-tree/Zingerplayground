# Run command: .\stop-hugo.ps1

Write-Host "Stopping Hugo server..." -ForegroundColor Yellow

# Find and stop all Hugo processes
$hugoProcesses = Get-Process -Name "hugo" -ErrorAction SilentlyContinue
if ($hugoProcesses) {
    $hugoProcesses | Stop-Process -Force
    Write-Host "Hugo process stopped successfully!" -ForegroundColor Green
} else {
    Write-Host "No running Hugo process found" -ForegroundColor Gray
}

