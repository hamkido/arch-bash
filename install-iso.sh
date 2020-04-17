#!/bin/bash
pacman -S --noconfirm dialog || { echo "Error at script start: Are you sure you're running this as the root user? Are you sure you have an internet connection?"; exit; }
dialog --defaultno --title "DON'T BE A BRAINLET!" --yesno "This is an Arch install script that is very rough around the edges.\n\nOnly run this script if you're a big-brane who doesn't mind deleting your entire /dev/nvme0n1p drive.\n\nThis script is only really for me so I can autoinstall Arch.\n\nt. Luke"  15 60 || exit
dialog --defaultno --title "DON'T BE A BRAINLET!" --yesno "Do you think I'm meming? Only select yes to DELET your entire /dev/nvme0n1p and reinstall Arch.\n\nTo stop this script, press no."  10 60 || exit
dialog --no-cancel --inputbox "Enter a name for your computer." 10 60 2> comp
dialog --no-cancel --inputbox "Enter partitionsize in gb, separated by space (swap & root)." 10 60 2>psize
IFS=' ' read -ra SIZE <<< $(cat psize)
re='^[0-9]+$'
if ! [ ${#SIZE[@]} -eq 2 ] || ! [[ ${SIZE[0]} =~ $re ]] || ! [[ ${SIZE[1]} =~ $re ]] ; then
    SIZE=(12 1000);
fi
timedatectl set-ntp true
cat <<EOF | fdisk /dev/nvme0n1p
o
n
p
+200M
n
p
+${SIZE[0]}G
n
p
+${SIZE[1]}G
n
p
w
EOF
partprobe
yes | mkfs.ext4 /dev/nvme0n1p4
yes | mkfs.ext4 /dev/nvme0n1p3
yes | mkfs.ext4 /dev/nvme0n1p1
mkswap /dev/nvme0n1p2
swapon /dev/nvme0n1p2
mount /dev/nvme0n1p3 /mnt
mkdir -p /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot
mkdir -p /mnt/home
mount /dev/nvme0n1p4 /mnt/home
pacstrap /mnt base base-devel linux linux-firmware networkmanager vim
genfstab -U /mnt > /mnt/etc/fstab
### BEGIN
arch-chroot /mnt echo "root:$pass" | chpasswd
TZuser=$(cat tzfinal.tmp)
ln -sf /usr/share/zoneinfo/$TZuser /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
systemctl enable NetworkManager
systemctl start NetworkManager
pacman --noconfirm --needed -S grub && grub-install --target=i386-pc /dev/nvme0n1p && grub-mkconfig -o /boot/grub/grub.cfg
### END
mv comp /mnt/etc/hostname
dialog --defaultno --title "Final Qs" --yesno "Reboot computer?"  5 30 && reboot
clear
