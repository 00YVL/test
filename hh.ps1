Add-Type -AssemblyName System.Windows.Forms

function Show-MessageBox {
    param (
        [string]$message
    )
    [System.Windows.Forms.MessageBox]::Show($message)
}

function Download-And-Extract {
    $zipUrl = "https://github.com/static-archives/Celery/raw/main/Release.zip"
    $outputPath = "D:\Celery\Release.zip"
    $extractPath = "D:\Celery"

    # Download the ZIP file
    try {
        Invoke-WebRequest -Uri $zipUrl -OutFile $outputPath
        Show-MessageBox -message "Download complete."
    } catch {
        Show-MessageBox -message "Failed to download the file."
        return
    }

    # Extract the ZIP file
    try {
        Expand-Archive -Path $outputPath -DestinationPath $extractPath -Force
        Show-MessageBox -message "Extraction complete."
    } catch {
        Show-MessageBox -message "Failed to extract the file."
    }
}

function Check-Installation {
    $checkPath = "D:\Celery\SomeFile.txt" # Adjust to check for a specific file indicating installation
    if (Test-Path $checkPath) {
        Show-MessageBox -message "Celery is already installed."
    } else {
        Show-MessageBox -message "Celery is not installed."
    }
}

$form = New-Object System.Windows.Forms.Form
$form.Text = "Celery Installer"
$form.Size = New-Object System.Drawing.Size(300, 200)
$form.StartPosition = "CenterScreen"

$installButton = New-Object System.Windows.Forms.Button
$installButton.Location = New-Object System.Drawing.Point(10, 10)
$installButton.Size = New-Object System.Drawing.Size(260, 40)
$installButton.Text = "Download and Extract Celery"
$installButton.Add_Click({ Download-And-Extract })
$form.Controls.Add($installButton)

$checkButton = New-Object System.Windows.Forms.Button
$checkButton.Location = New-Object System.Drawing.Point(10, 60)
$checkButton.Size = New-Object System.Drawing.Size(260, 40)
$checkButton.Text = "Check Installation"
$checkButton.Add_Click({ Check-Installation })
$form.Controls.Add($checkButton)

$form.ShowDialog()
