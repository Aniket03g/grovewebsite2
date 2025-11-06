# Grove Site Setup Script for Windows

Write-Host "🌳 Grove Technologies Website Setup" -ForegroundColor Green
Write-Host "====================================`n" -ForegroundColor Green

# Check if Go is installed
Write-Host "Checking for Go installation..." -ForegroundColor Cyan
$goVersion = go version 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Go is installed: $goVersion" -ForegroundColor Green
} else {
    Write-Host "✗ Go is not installed. Please install Go from https://golang.org/dl/" -ForegroundColor Red
    exit 1
}

# Check if templ is installed
Write-Host "`nChecking for templ CLI..." -ForegroundColor Cyan
$templVersion = templ version 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ templ is installed" -ForegroundColor Green
} else {
    Write-Host "✗ templ is not installed. Installing..." -ForegroundColor Yellow
    go install github.com/a-h/templ/cmd/templ@latest
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ templ installed successfully" -ForegroundColor Green
    } else {
        Write-Host "✗ Failed to install templ" -ForegroundColor Red
        exit 1
    }
}

# Download dependencies
Write-Host "`nDownloading Go dependencies..." -ForegroundColor Cyan
go mod download
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Dependencies downloaded" -ForegroundColor Green
} else {
    Write-Host "✗ Failed to download dependencies" -ForegroundColor Red
    exit 1
}

# Generate templ files
Write-Host "`nGenerating templ templates..." -ForegroundColor Cyan
templ generate
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Templates generated" -ForegroundColor Green
} else {
    Write-Host "✗ Failed to generate templates" -ForegroundColor Red
    exit 1
}

# Create placeholder images
Write-Host "`nCreating placeholder images..." -ForegroundColor Cyan
$imgDir = "static\img"

# Download placeholder images using PowerShell
try {
    Invoke-WebRequest -Uri "https://placehold.co/800x600/3B82F6/FFFFFF/png?text=Grove+Scheduler" -OutFile "$imgDir\product.png"
    Invoke-WebRequest -Uri "https://placehold.co/800x600/1E40AF/FFFFFF/png?text=Corporate+Boardroom" -OutFile "$imgDir\project1.jpg"
    Invoke-WebRequest -Uri "https://placehold.co/800x600/1E3A8A/FFFFFF/png?text=University+Auditorium" -OutFile "$imgDir\project2.jpg"
    Invoke-WebRequest -Uri "https://placehold.co/800x600/1E293B/FFFFFF/png?text=Digital+Signage" -OutFile "$imgDir\project3.jpg"
    Write-Host "✓ Placeholder images created" -ForegroundColor Green
} catch {
    Write-Host "⚠ Could not download placeholder images. You can add them manually later." -ForegroundColor Yellow
}

Write-Host "`n====================================`n" -ForegroundColor Green
Write-Host "✅ Setup complete!" -ForegroundColor Green
Write-Host "`nTo start the server, run:" -ForegroundColor Cyan
Write-Host "  go run main.go`n" -ForegroundColor White
Write-Host "Then open your browser to:" -ForegroundColor Cyan
Write-Host "  http://localhost:8080`n" -ForegroundColor White
