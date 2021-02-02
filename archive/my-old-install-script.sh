* normal with ext4	

timedatectl set-ntp true	
fdisk /dev/sda	
o	
n	
p	
+	
n	
p	
w	
partprobe	
yes | mkfs.ext4 /dev/sda1	
yes | mkfs.ext4 /dev/sda3	
yes | mkfs.ext4 /dev/sda4	
mkswap /dev/sda2	
swapon /dev/sda2	
mount /dev/sda3 /mnt	
mkdir -p /mnt/boot	
mount /dev/sda1 /mnt/boot	
mkdir -p /mnt/home	
mount /dev/sda4 /mnt/home	
pacstrap /mnt base base-devel linux linux-firmware networkmanager vim	
genfstab -U /mnt > /mnt/etc/fstab	
### BEGIN	
arch-chroot /mnt	
passwd	
ln -sf /usr/share/zoneinf/xxx /etc/localtime	
hwclock --systohc	
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen	
locale-gen	
systemctl enable NetworkManager	
pacman --noconfirm --needed -S grub && grub-install --target=i386-pc /dev/sda1 && grub-mkconfig -o /boot/grub/grub.cfg	
### END	
vim /mnt/etc/hostname	
exit 	
reboot	
