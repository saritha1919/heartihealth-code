net start | find "myservice2"
if ERRORLEVEL 1 sc delete "myservice2"
cd "C:\Program Files (x86)\Jenkins\workspace\Hearti-Health-Services"
start WinSW.NET4.exe install
pause