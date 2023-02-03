@echo on

echo %CD%
dir
dir bin
dir include
dir include\htslib
dir lib

copy bin\hts-3.dll %LIBRARY_PREFIX%\bin
copy include\htslib\hfile.h %LIBRARY_PREFIX%\include\htslib
copy include\htslib\hts.h %LIBRARY_PREFIX%\include\htslib
copy include\htslib\hts_defs.h %LIBRARY_PREFIX%\include\htslib
copy include\htslib\hts_endian.h %LIBRARY_PREFIX%\include\htslib
copy include\htslib\hts_expr.h %LIBRARY_PREFIX%\include\htslib
copy include\htslib\hts_log.h %LIBRARY_PREFIX%\include\htslib
copy include\htslib\hts_os.h %LIBRARY_PREFIX%\include\htslib
copy include\htslib\kbitset.h %LIBRARY_PREFIX%\include\htslib
copy include\htslib\kfunc.h %LIBRARY_PREFIX%\include\htslib
copy include\htslib\khash.h %LIBRARY_PREFIX%\include\htslib
copy include\htslib\khash_str2int.h %LIBRARY_PREFIX%\include\htslib
copy include\htslib\klist.h %LIBRARY_PREFIX%\include\htslib
copy include\htslib\knetfile.h %LIBRARY_PREFIX%\include\htslib
copy include\htslib\kroundup.h %LIBRARY_PREFIX%\include\htslib
copy include\htslib\kseq.h %LIBRARY_PREFIX%\include\htslib
copy include\htslib\ksort.h %LIBRARY_PREFIX%\include\htslib
copy include\htslib\kstring.h %LIBRARY_PREFIX%\include\htslib
copy include\htslib\synced_bcf_reader.h %LIBRARY_PREFIX%\include\htslib
copy include\htslib\tbx.h %LIBRARY_PREFIX%\include\htslib
copy include\htslib\vcf.h %LIBRARY_PREFIX%\include\htslib
copy include\htslib\vcfutils.h %LIBRARY_PREFIX%\include\htslib
copy lib\hts-3.lib %LIBRARY_PREFIX%\lib
IF %ERRORLEVEL% NEQ 0 exit 1
