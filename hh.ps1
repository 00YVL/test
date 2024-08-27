# PowerShell script for installing Celery from a ZIP file

# Define paths and URLs
$zipUrl = "https://github.com/static-archives/Celery/raw/main/Release.zip"
$localAppData = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::LocalApplicationData)
$installPath = Join-Path $localAppData "Celery"
$zipPath = Join-Path $installPath "Release.zip"

# Create the installation directory if it doesn't exist
if (-not (Test-Path $installPath)) {
    New-Item -ItemType Directory -Path $installPath -Force
}

# Download the ZIP file
Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath

# Extract the ZIP file
Expand-Archive -Path $zipPath -DestinationPath $installPath -Force

# Optionally run the application (if applicable)
# Start-Process -FilePath (Join-Path $installPath "Celery.exe")

Write-Host "Celery installation complete."
