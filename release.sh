#!/usr/bin/env bash

set -e

TMP_MU="tmp/mods-unpacked"

mkdir -p "$TMP_MU"

for dir in ./root/mods-unpacked/*; do
    echo "Exporting $dir"

    bdir="$(basename "$dir")"
    tdir="$TMP_MU/$bdir"

    echo "Copying $dir to $tdir"
    cp -r "$dir" "$tdir"

    pushd "tmp" >/dev/null
    echo "Zipping $tdir to $bdir.zip"
    7z a "../$bdir.zip" mods-unpacked >/dev/null
    popd >/dev/null

    echo "Removing $tdir"
    rm -r "$tdir"
done

rmdir "$TMP_MU"
rmdir "tmp"
