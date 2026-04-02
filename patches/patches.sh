#!/bin/bash
# Patches author: weishu <twsxtd@gmail.com>
#               Cloud_Yun <1770669041@qq.com>
#               Prslc <prslc113@gmail.com>
#               ShirkNeko <109797057+ShirkNeko@users.noreply.github.com>
# Shell author: xiaoleGun <1592501605@qq.com>
#               bdqllW <bdqllT@gmail.com>
#               5kind <shikabane320@gmail.com>
# Tested kernel versions: 5.4, 4.19, 4.14, 4.9
# 20251025

# exit 0    # Disable patches script.

patches_script="$GITHUB_WORKSPACE/patches/patches-gki.sh"
if [ "$(realpath "$0")" != $(realpath "$patches_script") ]; then
    echo "Hand over control to patches script: $patches_script"
    exec bash "$patches_script" "$@"
fi

patches_dir="$GITHUB_WORKSPACE/patches"
# patch_dir="$patches_dir/KernelSU" # Automatic
patch_dir="$patches_dir/KernelSU.d/Manual"

# patch_files=($(find $patch_dir -name '*.patch'))  # Automatic
patch_files=(
    # Manually modify the kernel source
    "$patch_dir/fs-exec.patch"
    "$patch_dir/fs-open.d/do_faccessat.diff"
    "$patch_dir/fs-read_write.patch"
    "$patch_dir/fs-stat.d/vfs_statx.diff"
    # Safe Mode
    "$patch_dir/drivers-input-input.patch"
    # Execute pm in terminal
    "$patch_dir/fs-devpts-inode.patch"
    # Backport path_umount
    "$patch_dir/fs-namespace.d/path_umount.diff"
)

# Source additional patches.d scripts to append patch files
for p in $patches_dir/patches.d/*.sh; do
    [ -f "$p" ] && . "$p"
done

# Apply patches
for i in "${patch_files[@]}"; do
    echo "Applying patch: $i"
    patch -p1 -N -F 10 -r .rej < "$i"
done