# This is a PS script that installs all available Chocolatey and winget updates,
# then it starts the Windows Update service and opens up the GUI for it;
# PLEASE NOTE YOU MUST RUN POWERSHELL AS ADMINISTRATOR!

# Install pip updates;
pip install --upgrade pip

# Install all available Chocolatey updates;
choco upgrade all

# Install all available winget updates;
winget upgrade --all

# Start the Windows Update service;
net start wuauserv

# Open the Windows Update GUI;
control update

# Install Dell SupportAssist updates;

<#
######################################## EXPERIMENTAL CODE BELOW

# Add some lines where you wait for Windows Updates to finish installing,
# then you restart the computer and then run a SFCR when it boots back up;

# Assign function that monitors Windows Update to variable;
$pendingUpdates = Get-HotFix | Where-Object { $_.Description -eq 'Update' -and $_.InstalledOn -eq $null }

# Create a while loop that will check for pending updates at an assigned time interval,
# in this case five minutes;
while ($pendingUpdates.Count -gt 0) {
    Write-Host "Waiting for updates to finish..."
    Start-Sleep -Seconds 300  # Wait for 5 minutes (adjust as needed)
    $pendingUpdates = Get-HotFix | Where-Object { $_.Description -eq 'Update' -and $_.InstalledOn -eq $null }
}

Write-Host "All Windows Updates installed, now initiating system restart..."

Restart-Computer -Force

########################

# Next I need a way to run a SFCR upon reboot & logging back in;

#>