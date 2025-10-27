**中文** | [English](README_EN.md)

# Check Kernel Config

用于开关/设定内核配置选项。

## 使用

将需要修改的内核配置选项以脚本形式写入此文件夹，格式参考原始项目 [check-kernel-config](https://github.com/ubports/ubports-boot/blob/master/check-kernel-config)，以下给出示例（脚本或格式）：  
::: code-group
```bash[ENABLE-KVM.sh]
[ "$ENABLE_KVM" ] && CONFIGS_ON+="
CONFIG_VIRTUALIZATION
CONFIG_KVM
CONFIG_VHOST_NET
CONFIG_VHOST_CROSS_ENDIAN_LEGACY"
```
```bash[ANDROID-PARANOID-NETWORK-OFF.sh]
[ "$ANDROID_PARANOID_NETWORK_OFF" ] && CONFIGS_OFF="
ANDROID_PARANOID_NETWORK"
```
```bash[check-kernel-config]
...
CONFIGS_EQ="
CONFIG_DEFAULT_SECURITY=\"apparmor\"
CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
CONFIG_SECURITY_SELINUX_BOOTPARAM_VALUE=0
CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=1
CONFIG_SECURITY_TOMOYO_MAX_ACCEPT_ENTRY=2048
CONFIG_SECURITY_TOMOYO_MAX_AUDIT_LOG=1024
CONFIG_SECURITY_TOMOYO_POLICY_LOADER=\"/sbin/tomoyo-init\"
CONFIG_SECURITY_TOMOYO_ACTIVATION_TRIGGER=\"/sbin/init\"
CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
CONFIG_DEFAULT_MMAP_MIN_ADDR=32768
CONFIG_DEFAULT_IOSCHED=\"deadline\"
CONFIG_EVM_HMAC_VERSION=2
"
...
```
:::

## 感谢
- [ubports-boot](https://github.com/ubports/ubports-boot)
- [android-lxc-docker](https://github.com/wu17481748/android-lxc-docker)
