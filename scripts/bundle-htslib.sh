set -eu

PACKAGE_VERSION=${PACKAGE_VERSION-1.15.1}
LIBHTS_SOVERSION=${LIBHTS_SOVERSION-3}
RELEASE_VERSION=${RELEASE_VERSION-0}

FULL_VERSION=${PACKAGE_VERSION}-${RELEASE_VERSION}

mkdir -p m2w64-htslib-${FULL_VERSION}/bin
mkdir -p m2w64-htslib-${FULL_VERSION}/include/htslib
mkdir -p m2w64-htslib-${FULL_VERSION}/lib

cp hts-${LIBTHS_SOVERSION}.dll m2w64-htslib-${FULL_VERSION}/bin
cp htslib/hts_defs.h m2w64-htslib-${FULL_VERSION}/include/htslib
cp htslib/hts_endian.h m2w64-htslib-${FULL_VERSION}/include/htslib
cp htslib/hts_expr.h m2w64-htslib-${FULL_VERSION}/include/htslib
cp htslib/hts_log.h m2w64-htslib-${FULL_VERSION}/include/htslib
cp htslib/hts.h m2w64-htslib-${FULL_VERSION}/include/htslib
cp htslib/hts_os.h m2w64-htslib-${FULL_VERSION}/include/htslib
cp htslib/vcf.h m2w64-htslib-${FULL_VERSION}/include/htslib
cp htslib/vcfutils.h m2w64-htslib-${FULL_VERSION}/include/htslib
cp htslib/hfile.h m2w64-htslib-${FULL_VERSION}/include/htslib
cp htslib/kstring.h m2w64-htslib-${FULL_VERSION}/include/htslib
cp htslib/k*.h m2w64-htslib-${FULL_VERSION}/include/htslib
cp htslib/synced_bcf_reader.h m2w64-htslib-${FULL_VERSION}/include/htslib
cp htslib/tbx.h m2w64-htslib-${FULL_VERSION}/include/htslib
cp hts-${LIBTHS_SOVERSION}.lib m2w64-htslib-${FULL_VERSION}/lib

tar -cvzf m2w64-htslib-${FULL_VERSION}.tar.gz -C m2w64-htslib-${FULL_VERSION} .
