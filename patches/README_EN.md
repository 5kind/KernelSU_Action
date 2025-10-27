# KernelSU Action Patches

[KernelSU Action Patches](patches.sh) is a script mainly used to patch the kernel. It will be automatically run in the `Setup Configuration for Kernel` step.

## Usage

Modify the `patch_files` array in the [patches.sh](patches.sh) and [subdirectory](profile.d) shell scripts to add the file paths you want to patch. The following is an example:

::: code-group

```bash[Manual hook]
...
patch_dir="$patches_dir/KernelSU.d/Manual"

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
...
```
```bash[Tracepoint hook]
...
patch_dir="$patches_dir/KernelSU.d/Tracepoint"

patch_files=(
    # Manually modify the kernel source
    "$patch_dir/fs-exec.patch"
    "$patch_dir/fs-open.patch"
    "$patch_dir/fs-read_write.patch"
    "$patch_dir/fs-stat.patch"
    # Safe Mode
    "$patch_dir/drivers-input-input.patch"
...
```
```bash[Auto hook]
...
patch_dir="$patches_dir/KernelSU"

patch_files=(
    ($(find $patch_dir -name '*.patch'))
)
...
```
```bash[Auto LXC-DOCKER]
lxc_docker_patch_dir="$patches_dir/LXC-DOCKER

$LXC_PATCH && patch_files+=(
    $(find $lxc_docker_patch_dir -name '*.patch')
)
```
:::

## Thanks
- [KernelSU Manual Hook](https://kernelsu.org/guide/how-to-integrate-for-non-gki.html)
- [SukiSU Tracepoint Hook](https://sukisu.org/zh/guide/tracepoint-hook)
- [Android-Container](https://github.com/CGCL-codes/Android-Container)
- [Docker on Android](https://gist.github.com/FreddieOliveira/efe850df7ff3951cb62d74bd770dce27#41-kernel-patches)
- [Lxc on Android](https://github.com/lateautumn233/valaxy-blog/blob/03fb5f407a6e931822a7c308430afb6d8fc038af/pages/posts/Lxc-on-Android.md)
- [使用docker简单编译k20pro内核](https://www.cnblogs.com/ink19/p/build_k20pro_kernel.html#%E4%BF%AE%E6%94%B9%E5%86%85%E6%A0%B8%E6%BA%90%E7%A0%81)
