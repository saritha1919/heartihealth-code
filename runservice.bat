net start | find "myservice2"
if ERRORLEVEL 1 sc delete "myservice2"
cd C:\WindowService
start WinSW.NET4.exe install
pause