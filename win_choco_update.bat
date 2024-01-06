REM - This is a batch script that installs all available Chocolatey and winget updates,
REM  - then it starts the Windows Update service and opens up the GUI for it;
REM - PLEASE NOTE YOU MUST RUN CMD AS ADMINISTRATOR!

REM - Install all available Chocolatey updates;
choco upgrade all

REM - Install all available winget updates;
winget upgrade --all

REM - Start the Windows Update service;
net start wuauserv

REM - Open the Windows Update GUI;
control update

REM - Install Dell SupportAssist updates;
REM - NOT SURE ABOUT THIS: DellSupportAssist.exe