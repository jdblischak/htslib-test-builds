@echo on

echo %CD%
dir

copy %SRC_DIR%\hts-3.dll %LIBRARY_PREFIX%\bin
copy %SRC_DIR%\htslib/hts_defs.h %LIBRARY_PREFIX%\include\htslib
copy %SRC_DIR%\htslib/hts_endian.h %LIBRARY_PREFIX%\include\htslib
copy %SRC_DIR%\htslib/hts_expr.h %LIBRARY_PREFIX%\include\htslib
copy %SRC_DIR%\htslib/hts_log.h %LIBRARY_PREFIX%\include\htslib
copy %SRC_DIR%\htslib/hts.h %LIBRARY_PREFIX%\include\htslib
copy %SRC_DIR%\htslib/hts_os.h %LIBRARY_PREFIX%\include\htslib
copy %SRC_DIR%\htslib/vcf.h %LIBRARY_PREFIX%\include\htslib
copy %SRC_DIR%\htslib/vcfutils.h %LIBRARY_PREFIX%\include\htslib
copy %SRC_DIR%\htslib/hfile.h %LIBRARY_PREFIX%\include\htslib
copy %SRC_DIR%\htslib/kstring.h %LIBRARY_PREFIX%\include\htslib
copy %SRC_DIR%\htslib/k*.h %LIBRARY_PREFIX%\include\htslib
copy %SRC_DIR%\htslib/synced_bcf_reader.h %LIBRARY_PREFIX%\include\htslib
copy %SRC_DIR%\htslib/tbx.h %LIBRARY_PREFIX%\include\htslib
copy %SRC_DIR%\hts-3.lib %LIBRARY_PREFIX%\lib
IF %ERRORLEVEL% NEQ 0 exit 1
