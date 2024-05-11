#!/usr/bin/env bash

# Arguments (Example)
REPO=$1        # zeller-sandbox/crescendo
FILE=$2        # crescendo-0.2-all.jar
VERSION=$3     # v0.2-alpha
TOKEN=$4       # $HOMEBREW_GITHUB_API_TOKEN
OUTPUT_FILE=$5 # crescendo.jar

# ./gh-dl-release zeller-sandbox/crescendo crescendo-0.2-all.jar v0.2-alpha $HOMEBREW_GITHUB_API_TOKEN crescendo.jar

REPO="sdfgsdfgd/maestro_kaan"

GITHUB="https://api.github.com"

alias errcho='>&2 echo'

function gh_curl() {
  curl -H "Authorization: token $TOKEN" \
    -H "Accept: application/vnd.github.v3.raw" \
    "$@"
}

if [ "$VERSION" = "latest" ]; then
  # Github should return the latest release first.
  parser=".[0].assets | map(select(.name == \"$FILE\"))[0].id"
else
  parser=". | map(select(.tag_name == \"$VERSION\"))[0].assets | map(select(.name == \"$FILE\"))[0].id"
fi

asset_id=$(gh_curl -s $GITHUB/repos/"$REPO"/releases | jq "$parser")
if [ "$asset_id" = "null" ]; then
  errcho "ERROR: version not found $VERSION"
  exit 1
fi

wget -q --auth-no-challenge --header='Accept:application/octet-stream' \
  https://"$TOKEN":@api.github.com/repos/"$REPO"/releases/assets/"$asset_id" \
  -O "$OUTPUT_FILE"
