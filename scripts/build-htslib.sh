LIBHTS_SOVERSION=${LIBHTS_SOVERSION-3}

./configure CFLAGS=-DCURL_STATICLIB

# apply patches
patch Makefile ci/patches/makefile.staticlink.patch
patch config.mk ci/patches/config.mk.staticlink.patch

make

ls -lh hts-${LIBHTS_SOVERSION}.*
