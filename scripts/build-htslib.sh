LIBHTS_SOVERSION=${LIBHTS_SOVERSION-3}

./configure CFLAGS=-DCURL_STATICLIB

# download patches
wget https://raw.githubusercontent.com/TileDB-Inc/TileDB-VCF/dlh/sc-24772-msys2-htslib-msvc-tdbvcf-WIP1/libtiledbvcf/cmake/patches/htslib.1.15.1.Makefile.staticlink
wget https://raw.githubusercontent.com/TileDB-Inc/TileDB-VCF/dlh/sc-24772-msys2-htslib-msvc-tdbvcf-WIP1/libtiledbvcf/cmake/patches/htslib.1.15.1.config.mk.staticlink

# apply patches
cp htslib.1.15.1.Makefile.staticlink Makefile
cp htslib.1.15.1.config.mk.staticlink config.mk

# build with patches
make

ls -lh hts-${LIBHTS_SOVERSION}.*
