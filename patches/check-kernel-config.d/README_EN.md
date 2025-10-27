# Check Kernel Config

Used to enable/set kernel configuration options.

## Usage

Write the kernel configuration options you want to modify into this folder as a script. Refer to the original project [check-kernel-config](https://github.com/ubports/ubports-boot/blob/master/check-kernel-config) for the format. An example (script or format) is provided below:
::: code-group
```bash[ENABLE-KVM.sh]
"$ENABLE_KVM" &&
CONFIGS_ON+="
CONFIG_VIRTUALIZATION
CONFIG_KVM
CONFIG_VHOST_NET
CONFIG_VHOST_CROSS_ENDIAN_LEGACY"
```
```bash[ANDROID-PARANOID-NETWORK-OFF.sh]
"$ANDROID_PARANOID_NETWORK_OFF" &&
CONFIGS_OFF+="
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
CONF IG_SECURITY_TOMOYO_MAX_AUDIT_LOG=1024
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

## Thanks
- [ubports-boot](https://github.com/ubports/ubports-boot)
- [android-lxc-docker](https://github.com/wu17481748/android-lxc-docker)
