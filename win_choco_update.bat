REM - This is a batch script that installs all available Chocolatey and winget updates,
REM  - then it starts the Windows Update service and opens up the GUI for it;
REM - PLEASE NOTE YOU MUST RUN CMD AS ADMINISTRATOR FOR CHOCO UPDATES, AND AS USER FOR WINGET UPDATES!

REM - Install all available Chocolatey updates;
choco upgrade all

REM - THIS COMMAND MUST BE RUN IN USER TERMINAL, NOT ADMIN;
REM - Install all available winget updates;
REM - the password is that of the Microsoft account for blue_slushy9@protonmail.com;
runas /user:racru "winget upgrade --all --force"

REM - Start the Windows Update service;
net start wuauserv

REM - Open the Windows Update GUI;
control update

REM - Install Dell SupportAssist updates;
REM - NOT SURE ABOUT THIS: DellSupportAssist.exe

REM - '::' is the other comment notation in batch scripts;
:: NOTES
:: The package expressvpn wants to run 'chocolateyInstall.ps1'.
:: Note: If you don't run this script, the installation will fail.
:: Note: To confirm automatically next time, use '-y' or consider:
:: choco feature enable -n allowGlobalConfirmation