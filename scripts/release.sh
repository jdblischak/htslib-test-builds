set -eu

# Create a release and upload tarball (but only if there is no existing release
# for this version)

if [[ -z "$GH_TOKEN" ]]
then
  echo "The env var GH_TOKEN is missing"
  echo "Please define it as a GitHub PAT with write permissions to 'contents'"
  exit 1
fi

PACKAGE_VERSION=${PACKAGE_VERSION-1.15.1}
RELEASE_VERSION=${RELEASE_VERSION-0}
FULL_VERSION=${PACKAGE_VERSION}-${RELEASE_VERSION}

gh release list
FULL_VERSION=${PACKAGE_VERSION}-${RELEASE_VERSION}
if ! gh release list | grep -q "$FULL_VERSION"
then
  echo "Create new release $FULL_VERSION"
  gh release create ${FULL_VERSION} \
    --notes ${FULL_VERSION} \
    --title ${FULL_VERSION} \
    m2w64-htslib-${FULL_VERSION}.tar.gz
fi
