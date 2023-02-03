@echo on

rem robocopy exit codes
rem https://learn.microsoft.com/en-us/troubleshoot/windows-server/backup-and-storage/return-codes-used-robocopy-utility

robocopy bin %LIBRARY_PREFIX%\bin *.dll
IF %ERRORLEVEL% NEQ 1 exit 1

robocopy lib %LIBRARY_PREFIX%\lib *.lib
IF %ERRORLEVEL% NEQ 1 exit 1

robocopy include %LIBRARY_PREFIX%\include /E
IF %ERRORLEVEL% NEQ 1 exit 1
