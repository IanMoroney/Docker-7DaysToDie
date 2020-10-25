#!/bin/sh

MODS_FOLDER=/home/sdtdserver/serverfiles/Mods
DL_LINK="http://illy.bz/fi/7dtd/server_fixes.tar.gz"

printHeader() {
    printf '%s\n' ""
    printf '%s\n' "##################"
    printf '%s\n' "$1"
    printf '%s\n' "##################"
    printf '%s\n' ""
}

downloadRelease() {
    curl $DL_LINK -SsL -o allocs.tar.gz
}

if [ $# -eq 0 ]
  then
    echo "[Alloc Fixes] No arguments supplied. Please specify the path to your Mods folder as first argument."
    exit 1
fi

clear

echo "[Alloc Fixes] Downloading release from $DL_LINK"

printHeader "[Alloc Fixes] Downloading files"

downloadRelease

printHeader "[Alloc Fixes] Extracting files"

mkdir -p allocs-temp
tar --strip-components=1 -xf allocs.tar.gz -C allocs-temp 

printHeader "[Alloc Fixes] Installing components"

rm -rf $1/Allocs*
mv allocs-temp/* $1

printHeader "[Alloc Fixes] Cleanup"

rm allocs.tar.gz
rm -rf allocs-temp

printHeader "[Alloc Fixes] Finished! ヽ(´▽\`)/"