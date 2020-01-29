net start | find "HeartiHealthservice"
if %errorlevel% == 2 echo Could not start service.
if %errorlevel% == 0 echo Service started successfully.
echo Errorlevel: %errorlevel%
if ERRORLEVEL 1 sc start "HeartiHealthservice"
