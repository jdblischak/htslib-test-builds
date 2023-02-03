@echo on

tar xzf m2w64-htslib-1.15.1-0.tar.gz -C %LIBRARY_PREFIX%
IF %ERRORLEVEL% NEQ 0 exit 1
