set path=C:\Program Files (x86)\Jenkins\workspace\HeartiHealth-Service
sc stop "Myservice"
sc delete "Myservice"
copy "%path%\discoveri-heartihealth-webapp\target\discoveri-heartihealth-webapp-0.0.1-SNAPSHOT.jar" "%path%"
cd "%path%"
start WinSW.NET4.exe install
exit 0
