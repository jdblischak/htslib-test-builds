# https://github.com/samtools/htslib/blob/463830bf7de8c4ab731c4d67c49ddc446f498f50/INSTALL#L276
# https://github.com/samtools/htslib/blob/develop/.appveyor.yml

pacman -S --noconfirm --needed \
  base-devel \
  mingw-w64-x86_64-toolchain \
  mingw-w64-x86_64-autotools \
  mingw-w64-x86_64-zlib \
  mingw-w64-x86_64-bzip2 \
  mingw-w64-x86_64-xz \
  mingw-w64-x86_64-curl \
  mingw-w64-x86_64-tools-git \
  mingw-w64-x86_64-libdeflate
