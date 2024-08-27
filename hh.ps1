# Define paths
$localAppData = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::LocalApplicationData)
$zipPath = "D:\Celery\Release.zip"
$extractPath = "D:\Celery"

# Function to handle installation
function Install-Celery {
    Write-Host "Starting Celery installation..." -ForegroundColor Green

    # Check if the ZIP file exists
    if (Test-Path -Path $zipPath) {
        Write-Host "ZIP file found. Extracting..." -ForegroundColor Yellow

        # Extract the ZIP file
        Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force
        Write-Host "Extraction complete." -ForegroundColor Green

        # Optional: Run something from the extracted content
        # Start-Process -FilePath (Join-Path $extractPath "CeleryApp.exe")
    } else {
        Write-Host "ZIP file not found. Please ensure the file is located at $zipPath" -ForegroundColor Red
    }
}

# GUI code to handle user interaction
Add-Type -AssemblyName System.Windows.Forms

[System.Windows.Forms.MessageBox]::Show("Click OK to install Celery.", "Install Celery", [System.Windows.Forms.MessageBoxButtons]::OKCancel)

# Call the installation function
Install-Celery
