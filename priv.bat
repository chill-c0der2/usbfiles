@echo off
REM Retr0's Batch Script to Open Elevated Command Prompt

echo [*] Attempting to open an elevated command prompt...
timeout /t 2

REM Check for admin privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    echo [*] You already have administrator privileges!
    start cmd.exe
) else (
    echo [!] Not running with admin privileges.
    echo [*] Trying to run cmd as admin...

    REM Create a temporary VBS file to prompt for elevation
    echo Set UAC = CreateObject("Shell.Application") > elevate.vbs
    echo UAC.ShellExecute "cmd.exe", "", "", "runas", 1 >> elevate.vbs

    REM Execute the VBS file to trigger the UAC prompt
    cscript //nologo elevate.vbs
    del elevate.vbs
)
