set -eu

PATCH_DIR="$1"

LIBHTS_SOVERSION=${LIBHTS_SOVERSION-3}

./configure CFLAGS=-DCURL_STATICLIB

# apply patches
patch Makefile "${PATCH_DIR}/makefile.staticlink.patch"
patch config.mk "${PATCH_DIR}/config.mk.staticlink.patch"

make

ls -lh hts-${LIBHTS_SOVERSION}.*
