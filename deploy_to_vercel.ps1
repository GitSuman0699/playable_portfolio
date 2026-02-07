$ErrorActionPreference = "Stop"

Write-Host "----------------------------------------------------------------"
Write-Host "       Playable Portfolio Vercel Deployer"
Write-Host "----------------------------------------------------------------"

# 1. Build Embedded Flutter Apps
Write-Host "Building Embedded Flutter Apps..."
try {
    .\build_apps.ps1
} catch {
    Write-Error "Failed to build embedded apps. Check the output above."
    exit 1
}

# 2. Build Jaspr Portfolio
Write-Host "Building Jaspr Portfolio Site..."
Push-Location portfolio
try {
    # Ensure dependencies are installed
    dart pub get
    
    # Build for static web
    jaspr build
    
    if ($LASTEXITCODE -ne 0) { throw "Jaspr build command returned error code $LASTEXITCODE" }
} catch {
    Write-Error "Failed to build Jaspr site. $_"
    Pop-Location
    exit 1
}
Pop-Location

# 2.5 Copy Embedded Apps to Build Output
Write-Host "Copying Embedded Apps to Build Output..."
$destApps = "portfolio/build/jaspr/apps"
if (-not (Test-Path $destApps)) {
    New-Item -ItemType Directory -Force -Path $destApps | Out-Null
}

$apps = @("Aero-Lounge")
foreach ($app in $apps) {
    $appSource = "apps/$app/build/web"
    $appDest = "$destApps/$app"
    
    if (Test-Path $appSource) {
        Write-Host "Copying $app..."
        if (-not (Test-Path $appDest)) {
            New-Item -ItemType Directory -Force -Path $appDest | Out-Null
        }
        Copy-Item -Path "$appSource/*" -Destination $appDest -Recurse -Force
        
        # Patch index.html for relative base href
        $indexHtml = "$appDest/index.html"
        if (Test-Path $indexHtml) {
            $content = Get-Content $indexHtml -Raw
            $content = $content -replace '<base href="[^"]*">', '<base href="./">'
            $content | Set-Content $indexHtml
            Write-Host "Patched base href for $app"
        }
    } else {
        Write-Warning "Source not found for $app at $appSource"
    }
}

# 3. Deploy to Vercel
Write-Host "Uploading to Vercel..."
$buildDir = "portfolio/build/jaspr"

if (-not (Test-Path $buildDir)) {
    Write-Error "Build directory not found at $buildDir. Build might have failed."
    exit 1
}

Write-Host "Starting Vercel CLI..."
Write-Host 'NOTE: If this is your first time, a browser window will open to log in.'
Write-Host 'NOTE: You will be asked to confirm settings. Accept the defaults (Y).'

# We use npx to run vercel without installing it globally
# --prod deploys directly to production url
npx -y vercel deploy $buildDir --prod --yes
