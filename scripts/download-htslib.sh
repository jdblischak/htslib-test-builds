PACKAGE_VERSION=${PACKAGE_VERSION-1.16}

curl -O -L "https://github.com/samtools/htslib/releases/download/${PACKAGE_VERSION}/htslib-${PACKAGE_VERSION}.tar.bz2"
tar -jxvf htslib-${PACKAGE_VERSION}.tar.bz2
mv htslib-${PACKAGE_VERSION}/* .
rmdir htslib-${PACKAGE_VERSION}/
