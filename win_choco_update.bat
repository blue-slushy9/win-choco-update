REM - This is a batch script that installs all available pip, Chocolatey, 
REM - and winget updates, then it starts the Windows Update service 
REM - and opens up the Windows Update GUI;
REM - Please note that if you are running this script manually 
REM - (not as a Scheduled Task), YOU MUST RUN CMD AS ADMINISTRATOR!

:: '::' is the other comment notation in batch scripts,
:: unlike REM it will not print the comment to the terminal

:: Install pip updates
:: pip install --upgrade pip :: this command seems to be deprecated
:: below is the new command
python.exe -m pip install --upgrade pip

:: Install all available Chocolatey updates
choco upgrade all -y

:: 8/10/24 - some of the winget installers still require Admin permissions,
:: and it's annoying having to click Yes in the little pop-up windows; will
:: have to figure out a way to get winget updates to install without any
:: prompts, perhaps by running it as its own script in Task Scheduler and
:: granting it the highest permissions (or whatever);


:: THIS COMMAND MUST BE RUN IN USER TERMINAL, NOT ADMIN!
:: Install all available winget updates; the password is that of the Microsoft 
:: account for blue_slushy9@protonmail.com
runas /user:racru "winget upgrade --all --silent --force"


:: 8/10/24 - none of the below seem to be working
:: Let's try running it as Admin within a Scheduled Task, instead of as a User
::winget upgrade --all --silent --force
:: I want to verify winget updates are being installed, so let's try this
::winget upgrade --all --force


:: Start the Windows Update service, it is most likely already running but
:: just to make sure
net start wuauserv

:: Open the Windows Update GUI
control update

:: Reboot after 60 minutes
shutdown /r /f /t 3600

:: Install Dell SupportAssist updates
:: NOT SURE ABOUT THIS: DellSupportAssist.exe

:: NOTES
:: The package expressvpn wants to run 'chocolateyInstall.ps1'.
:: Note: If you don't run this script, the installation will fail.
:: Note: To confirm automatically next time, use '-y' or consider:
:: choco feature enable -n allowGlobalConfirmation