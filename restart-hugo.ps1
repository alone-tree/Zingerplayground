# Run command: .\restart-hugo.ps1

Write-Host "Stopping Hugo server..." -ForegroundColor Yellow

# Find and stop all Hugo processes
$hugoProcesses = Get-Process -Name "hugo" -ErrorAction SilentlyContinue
if ($hugoProcesses) {
    $hugoProcesses | Stop-Process -Force
    Write-Host "Hugo process stopped" -ForegroundColor Green
    Start-Sleep -Seconds 1
} else {
    Write-Host "No running Hugo process found" -ForegroundColor Gray
}

Write-Host "Starting Hugo server..." -ForegroundColor Yellow

# Start Hugo server
Start-Process -FilePath "hugo" -ArgumentList "server -D" -NoNewWindow

Write-Host "Hugo server restarted!" -ForegroundColor Green
Write-Host "Visit: http://localhost:1313" -ForegroundColor Cyan
