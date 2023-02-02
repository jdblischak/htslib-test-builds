# htslib test builds

This repository contains various GitHub Actions workflows that I used to
experiment with building [htslib][].

[htslib]: https://github.com/samtools/htslib

## Build latest htslib release with msys2

I created the msys2 environment on GitHub Actions using [msys2/setup-msys2][].
While msys2 is already pre-installed on the GitHub Actions Windows runner image,
it's not on the PATH, and I didn't want to deal with the headache of modifying
Windows paths.

[msys2/setup-msys2]: https://github.com/msys2/setup-msys2

I mostly followed the [official installation instructions][install]. I got the
pacman flags from the [AppVeyor build][appveyor].

[install]: https://github.com/samtools/htslib/blob/463830bf7de8c4ab731c4d67c49ddc446f498f50/INSTALL#L276
[appveyor]: https://github.com/samtools/htslib/blob/develop/.appveyor.yml

* [setup-msys2-action.yml](https://github.com/jdblischak/htslib-test-builds/blob/main/.github/workflows/setup-msys2-action.yml)
* [build logs](https://github.com/jdblischak/htslib-test-builds/actions/workflows/setup-msys2-action.yml)

## Build a statically-linked, dependency-free htslib.dll with current msys2

I modified my existing msys2 build above to implement David's instructions for
building a statically-linked, dependency-free htslib.dll. The specific changes are:

1. Passed `update: true` to msys2/setup-msys2 to replicate `pacman -Syuu`
1. Installed htslib 1.15.1 instead of the latest release (1.16)
1. Passed `CFLAGS=-DCURL_STATICLIB` to `./configure` and downloaded David's
   [patches][patches]
1. Used the action [ilammy/msvc-dev-cmd][] to setup MSVC. Again, this is
   pre-installed, but it's not in the PATH

[patches]: https://github.com/TileDB-Inc/TileDB-VCF/blob/dlh/sc-24772-msys2-htslib-msvc-tdbvcf-WIP1/libtiledbvcf/cmake/patches/
[ilammy/msvc-dev-cmd]: https://github.com/ilammy/msvc-dev-cmd

* [msys2-static-linking.yml](https://github.com/jdblischak/htslib-test-builds/blob/main/.github/workflows/msys2-static-linking.yml)
* [build logs](https://github.com/jdblischak/htslib-test-builds/actions/workflows/msys2-static-linking.yml)

## Build m2w64-htslib

I attempted to build a m2w64 version of htslib from a conda recipe. I started
from the [bioconda recipe][htslib-bioconda], and replaced the dependencies with
either posix (`m2-`) or native (`m2w64-`) alternatives. I was mainly following
other example recipes, eg this one for [m2w64-icu][].

[m2w64-icu]: https://github.com/conda-forge/msys2-recipes/blob/c34a184e6d198d5dc9286cf5a0ebcac241481fe6/msys2/m2w64-icu/meta.yaml

Known limitations:

* No m2-libdeflate or m2w64-libdeflate
* No m2w64-libcurl
* conda-forge has clearly [converged on
  MSVC](https://conda-forge.org/docs/maintainer/knowledge_base.html#compilers).
  Most of the msys2 packages are [over 2 years
  old](https://github.com/conda-forge/msys2-recipes). Even if we can get a msys2
  conda build to work, this infrastructure will continue to bit rot without
  substantial maintenance intervention

I tried various compilers. Nothing is currently working.

* `{{ compiler('m2w64_c') }}` this fails to even solve the conda environment.
  This is baffling to me since this compiler is used in many existing, current
  conda-forge recipes, especially for R packages
  ```sh
  conda_build.exceptions.DependencyNeedsBuildingError: Unsatisfiable dependencies for platform win-64: {'m2w64_c_win-64'}
  ```

* `m2w64-gcc` I've had the most luck by explicitly setting the appropriate
  compiler. Note that `conda build` does not like this. However, it suddenly
  fails without much indication as to what went wrong
  ```sh
  (%BUILD_PREFIX%) %SRC_DIR%>make
  gcc -Wall -g -O2 -fvisibility=hidden  -I. -D_XOPEN_SOURCE=600 -c -o kfunc.o kfunc.c
  gcc -Wall -g -O2 -fvisibility=hidden  -I. -D_XOPEN_SOURCE=600 -c -o kstring.o kstring.c
  gcc -Wall -g -O2 -fvisibility=hidden  -I. -D_XOPEN_SOURCE=600 -c -o bcf_sr_sort.o bcf_sr_sort.c
  gcc -Wall -g -O2 -fvisibility=hidden  -I. -D_XOPEN_SOURCE=600 -c -o bgzf.o bgzf.c
  gcc -Wall -g -O2 -fvisibility=hidden  -I. -D_XOPEN_SOURCE=600 -c -o errmod.o errmod.c
  gcc -Wall -g -O2 -fvisibility=hidden  -I. -D_XOPEN_SOURCE=600 -c -o faidx.o faidx.c
  gcc -Wall -g -O2 -fvisibility=hidden  -I. -D_XOPEN_SOURCE=600 -c -o header.o header.c
  gcc -Wall -g -O2 -fvisibility=hidden  -I. -D_XOPEN_SOURCE=600 -c -o hfile.o hfile.c
  echo '#define HTS_VERSION_TEXT "1.16"' > version.h
  echo '#define HTS_CC "gcc"' > config_vars.h
  echo '#define HTS_CPPFLAGS "-D_XOPEN_SOURCE=600"' >> config_vars.h
  echo '#define HTS_CFLAGS "-Wall -g -O2 -fvisibility=hidden"' >> config_vars.h
  echo '#define HTS_LDFLAGS "-fvisibility=hidden "' >> config_vars.h
  echo '#define HTS_LIBS "-lbz2 -lws2_32 -lz  "' >> config_vars.h
  gcc -Wall -g -O2 -fvisibility=hidden  -I. -D_XOPEN_SOURCE=600 -c -o hts.o hts.c
  gcc -Wall -g -O2 -fvisibility=hidden  -I. -D_XOPEN_SOURCE=600 -c -o hts_expr.o hts_expr.c
  Makefile:173: recipe for target 'hts_expr.o' failed
  ```

* `{{ compiler('c') }}` - this install MSVC, and then fails to find zlib

* `{{ compiler('r_clang') }}` as seen in the recipe for
  [r-arrow](https://github.com/conda-forge/r-arrow-feedstock/blob/494d0e66ffab16cd8a6b56a31ddecc592e596e28/recipe/meta.yaml#L31).
  Just as above, it
  [fails](https://github.com/jdblischak/htslib-test-builds/actions/runs/4075803294/jobs/7022692556)
  to find zlib

* [conda-m2w64.yml](https://github.com/jdblischak/htslib-test-builds/actions/workflows/conda-m2w64.yml)
* [build logs](https://github.com/jdblischak/htslib-test-builds/blob/main/.github/workflows/conda-m2w64.yml)

## Build bioconda recipe

This was mostly a sanity check. I wanted to confirm that I could build the
existing  [bioconda recipe for htslib][htslib-bioconda] in a GitHub Actions
environment for both Ubuntu and macOS. It was relatively straightforward. I used
[mamba-org/provision-with-micromamba][] to install [bioconda-utils][]

[htslib-bioconda]: https://github.com/bioconda/bioconda-recipes/tree/master/recipes/htslib

* [bioconda.yml](https://github.com/jdblischak/htslib-test-builds/blob/main/.github/workflows/bioconda.yml)
* [build logs](https://github.com/jdblischak/htslib-test-builds/actions/workflows/bioconda.yml)
