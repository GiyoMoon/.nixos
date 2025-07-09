## UTM Debugging
- No display
Set "Emulated Display Card" to virtio-gpu-pci in Display settings.

## Install
Find the disk to install to
```
sudo -s
lsblk
```
for me, this is `vda`, replace `vda` with your disk name in the following commands:
```
fdisk /dev/vda
```

```
g
n
<default>
<default>
+500M
t
1
n
<default>
<default>
+4096M
t
2
19
n
<default>
<default>
<default>
w
```

```
mkfs.fat /dev/vda1 -n BOOT
mkswap /dev/vda2 -L SWAP
swapon /dev/vda2
mkfs.ext4 /dev/vda3 -L ROOT
```

```
mount /dev/vda3 /mnt
mkdir /mnt/boot
mount /dev/vda1 /mnt/boot
cd /mnt
```

## Fresh generation
```
nixos-generate-config --root /mnt
nixos-install
```

## Apply flake
If you already have a flake with your matching host configuration:
```
nixos-install --flake github:GiyoMoon/.nixos#vm
```

## Finalizing

- `passwd` and `reboot`

make sure to boot to the disk!

```
chmod -R 700 /boot
passwd jasi
```

## home-manager
```
ln -s ~/.nixos ~/.config/home-manager
nix run home-manager -- switch
```

## Applying the config after installation
```
nixos-rebuild switch --flake github:GiyoMoon/.nixos#vm
```

