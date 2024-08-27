# Load the required assemblies
Add-Type -AssemblyName System.Windows.Forms

# Create a new form
$form = New-Object System.Windows.Forms.Form
$form.Text = "Install Celery"
$form.Size = New-Object System.Drawing.Size(300, 150)
$form.StartPosition = "CenterScreen"

# Create a button for installation
$buttonInstall = New-Object System.Windows.Forms.Button
$buttonInstall.Location = New-Object System.Drawing.Point(50, 30)
$buttonInstall.Size = New-Object System.Drawing.Size(200, 40)
$buttonInstall.Text = "Install Celery"
$form.Controls.Add($buttonInstall)

# Define the installation function
$buttonInstall.Add_Click({
    $url = "https://github.com/static-archives/Celery/raw/main/Release.zip"
    $installPath = [System.IO.Path]::Combine([System.Environment]::GetFolderPath('LocalApplicationData'), "Celery")
    $zipPath = [System.IO.Path]::Combine($installPath, "Release.zip")

    # Create installation directory if it doesn't exist
    if (-not (Test-Path $installPath)) {
        New-Item -ItemType Directory -Path $installPath -Force
    }

    # Download the ZIP file
    Invoke-WebRequest -Uri $url -OutFile $zipPath

    # Extract the ZIP file
    Expand-Archive -Path $zipPath -DestinationPath $installPath -Force

    [System.Windows.Forms.MessageBox]::Show("Celery installation complete.", "Success", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
})

# Show the form
$form.ShowDialog()
