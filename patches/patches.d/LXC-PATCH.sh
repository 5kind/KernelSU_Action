lxc_docker_patch_dir="$patches_dir/LXC-DOCKER/"
[ "$LXC_PATCH" ] && patch_files+=(
    $(find $lxc_docker_patch_dir -name '*.patch')
)
