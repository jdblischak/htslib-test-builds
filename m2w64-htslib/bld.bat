@echo on

bash configure --prefix=%LIBRARY_PREFIX% --disable-lzma --enable-werror CFLAGS='-g -O3'
IF %ERRORLEVEL% NEQ 0 exit 1

make
IF %ERRORLEVEL% NEQ 0 exit 1

make install
IF %ERRORLEVEL% NEQ 0 exit 1
