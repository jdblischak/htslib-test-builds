LIBHTS_SOVERSION=${LIBHTS_SOVERSION-3}

ls -lh config.mk*

./configure CFLAGS=-DCURL_STATICLIB

ls -lh config.mk*

# download patches
wget https://raw.githubusercontent.com/TileDB-Inc/TileDB-VCF/dlh/sc-24772-msys2-htslib-msvc-tdbvcf-WIP1/libtiledbvcf/cmake/patches/htslib.1.15.1.Makefile.staticlink
wget https://raw.githubusercontent.com/TileDB-Inc/TileDB-VCF/dlh/sc-24772-msys2-htslib-msvc-tdbvcf-WIP1/libtiledbvcf/cmake/patches/htslib.1.15.1.config.mk.staticlink

# diff patches
diff Makefile htslib.1.15.1.Makefile.staticlink
diff config.mk htslib.1.15.1.config.mk.staticlink

# apply patches
cp htslib.1.15.1.Makefile.staticlink Makefile
cp htslib.1.15.1.config.mk.staticlink config.mk

# build with patches
make

ls -lh hts-${LIBHTS_SOVERSION}.*
