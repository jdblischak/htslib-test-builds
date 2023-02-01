@echo on

bash configure --prefix=%LIBRARY_PREFIX%
IF %ERRORLEVEL% NEQ 0 exit 1

make
IF %ERRORLEVEL% NEQ 0 exit 1

make install
IF %ERRORLEVEL% NEQ 0 exit 1
