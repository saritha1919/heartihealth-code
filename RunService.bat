@Echo Off
Echo password@123 > password.txt
Echo. >> password.txt
RunAs.exe /netonly /user:PT-RND-001\Saritha "WinSW.NET4.exe install"  < password.txt
Del password.txt

