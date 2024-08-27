# PowerShell script to download and extract files

# URL of the ZIP file
$zipUrl = "https://github.com/static-archives/Celery/raw/main/Release.zip"

# Destination paths
$outputPath = "D:\Celery\somefile.zip"
$extractPath = "D:\Celery"

# Download the ZIP file
Invoke-WebRequest -Uri $zipUrl -OutFile $outputPath

# Extract the ZIP file
Expand-Archive -Path $outputPath -DestinationPath $extractPath

# Optional: Run something from the extracted content
# Start-Process "$D:\Celery\CeleryApp.exe"
