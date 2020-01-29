net start | find "HeartiHealthservice"
if ERRORLEVEL 1 sc stop "HeartiHealthservice"
sc delete "HeartiHealthservice"
copy "C:\Program Files (x86)\Jenkins\workspace\Hearti-Health-Services\discoveri-heartihealth-webapp\target\discoveri-heartihealth-webapp-0.0.1-SNAPSHOT.jar" "C:\Program Files (x86)\Jenkins\workspace\Hearti-Health-Services"
cd "C:\Program Files (x86)\Jenkins\workspace\Hearti-Health-Services"
start WinSW.NET4.exe install
sc start "HeartiHealthservice"
pause
