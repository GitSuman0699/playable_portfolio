$ErrorActionPreference = "Stop"
$originalLocation = Get-Location

try {
    Write-Host "Building Hello World App..."
    # Ensure we start from the script location to handle paths correctly
    Set-Location "$PSScriptRoot/apps/hello_world"
    
    flutter build web --wasm
    if ($LASTEXITCODE -ne 0) { throw "Flutter build failed" }

    # Destination relative to apps/hello_world
    $dest = "../../portfolio/web/apps/hello_world"
    if (!(Test-Path $dest)) { New-Item -ItemType Directory -Force -Path $dest | Out-Null }

    Write-Host "Deploying to Portfolio..."
    Copy-Item -Path "build/web/*" -Destination $dest -Recurse -Force

    Write-Host "Done! App deployed to portfolio/web/apps/hello_world"
} finally {
    # Always return to the original directory
    Set-Location $originalLocation
}
