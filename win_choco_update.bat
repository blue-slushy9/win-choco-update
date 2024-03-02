REM - This is a batch script that installs all available Chocolatey and winget updates,
REM  - then it starts the Windows Update service and opens up the GUI for it;
REM - PLEASE NOTE YOU MUST RUN CMD AS ADMINISTRATOR FOR THIS SCRIPT TO WORK!

:: '::' is the other comment notation in batch scripts,
:: unlike REM it will not print the comment to the terminal;

:: Install pip updates;
pip install --upgrade pip

:: Install all available Chocolatey updates;
choco upgrade all -y

:: THIS COMMAND MUST BE RUN IN USER TERMINAL, NOT ADMIN;
:: Install all available winget updates;
:: the password is that of the Microsoft account 
:: for blue_slushy9@protonmail.com;
runas /user:racru "winget upgrade --all --force"

:: Start the Windows Update service;
net start wuauserv

:: Open the Windows Update GUI;
control update

:: Install Dell SupportAssist updates;
:: NOT SURE ABOUT THIS: DellSupportAssist.exe

:: NOTES
:: The package expressvpn wants to run 'chocolateyInstall.ps1'.
:: Note: If you don't run this script, the installation will fail.
:: Note: To confirm automatically next time, use '-y' or consider:
:: choco feature enable -n allowGlobalConfirmation