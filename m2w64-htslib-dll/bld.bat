@echo on

robocopy bin %LIBRARY_PREFIX%\bin *.dll
IF %ERRORLEVEL% NEQ 3 exit 1
rem robocopy exit codes
rem https://learn.microsoft.com/en-us/troubleshoot/windows-server/backup-and-storage/return-codes-used-robocopy-utility

robocopy lib %LIBRARY_PREFIX%\lib *.lib
IF %ERRORLEVEL% NEQ 3 exit 1

robocopy include %LIBRARY_PREFIX%\include /E
IF %ERRORLEVEL% NEQ 3 exit 1

dir %LIBRARY_PREFIX%\include
dir %LIBRARY_PREFIX%\include\htslib
