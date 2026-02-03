$ErrorActionPreference = "Stop"
$originalLocation = Get-Location

# List of apps to build
$apps = @("Aero-Lounge")

try {
    foreach ($app in $apps) {
        Write-Host "========================================" -ForegroundColor Cyan
        Write-Host "Building $app..." -ForegroundColor Cyan
        Write-Host "========================================" -ForegroundColor Cyan
        
        # Ensure we start from the script location to handle paths correctly
        Set-Location "$PSScriptRoot/apps/$app"
        
        # Build with correct base-href for embedding in portfolio
        flutter build web --wasm --base-href "/apps/$app/"
        if ($LASTEXITCODE -ne 0) { throw "Flutter build failed for $app" }

        # Destination relative to the app folder
        $dest = "../../portfolio/web/apps/$app"
        if (!(Test-Path $dest)) { New-Item -ItemType Directory -Force -Path $dest | Out-Null }

        Write-Host "Deploying $app to Portfolio..." -ForegroundColor Green
        Copy-Item -Path "build/web/*" -Destination $dest -Recurse -Force

        Write-Host "Done! $app deployed to portfolio/web/apps/$app" -ForegroundColor Green
        Write-Host ""
        
        # Return to original location for next app
        Set-Location $originalLocation
    }
    
    Write-Host "========================================" -ForegroundColor Cyan
    Write-Host "All apps built successfully!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Cyan
} finally {
    # Always return to the original directory
    Set-Location $originalLocation
}
