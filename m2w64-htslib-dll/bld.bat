@echo on

copy hts-3.dll %LIBRARY_PREFIX%\bin
copy htslib/hts_defs.h %LIBRARY_PREFIX%\include\htslib
copy htslib/hts_endian.h %LIBRARY_PREFIX%\include\htslib
copy htslib/hts_expr.h %LIBRARY_PREFIX%\include\htslib
copy htslib/hts_log.h %LIBRARY_PREFIX%\include\htslib
copy htslib/hts.h %LIBRARY_PREFIX%\include\htslib
copy htslib/hts_os.h %LIBRARY_PREFIX%\include\htslib
copy htslib/vcf.h %LIBRARY_PREFIX%\include\htslib
copy htslib/vcfutils.h %LIBRARY_PREFIX%\include\htslib
copy htslib/hfile.h %LIBRARY_PREFIX%\include\htslib
copy htslib/kstring.h %LIBRARY_PREFIX%\include\htslib
copy htslib/k*.h %LIBRARY_PREFIX%\include\htslib
copy htslib/synced_bcf_reader.h %LIBRARY_PREFIX%\include\htslib
copy htslib/tbx.h %LIBRARY_PREFIX%\include\htslib
copy hts-3.lib %LIBRARY_PREFIX%\lib
IF %ERRORLEVEL% NEQ 0 exit 1
