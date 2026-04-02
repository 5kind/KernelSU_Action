#!/bin/bash
# Shell author: 5kind <shikabane320@gmail.com>
patches_dir="$GITHUB_WORKSPACE/patches"
# Source additional patches.d scripts to append patch files
for p in $patches_dir/patches.d/*.sh; do
    [ -f "$p" ] && . "$p"
done
# Apply patches
for i in "${patch_files[@]}"; do
    echo "Applying patch: $i"
    patch -p1 -N -F 10 -r .rej < "$i"
done
