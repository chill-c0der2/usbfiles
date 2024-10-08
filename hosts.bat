@echo off
setlocal

:: Get the network base IP (assuming IPv4 with subnet /24)
for /f "tokens=2 delims=[]" %%i in ('ping -n 1 192.168.0.1 ^| findstr "["') do set myip=%%i
for /f "tokens=1-3 delims=." %%a in ("%myip%") do set baseip=%%a.%%b.%%c.

echo Scanning the network %baseip%0/24...

:: Loop through all IPs in the subnet
for /L %%i in (1,1,254) do (
    ping -n 1 -w 200 %baseip%%%i >nul
    if not errorlevel 1 (
        echo Found active device: %baseip%%%i
        :: Use ARP to get the MAC address
        arp -a %baseip%%%i | find "%baseip%%%i"
        :: Optionally, try to resolve the hostname
        nbtstat -A %baseip%%%i | findstr "Name"
        echo.
    )
)

echo Scan complete.
pause
