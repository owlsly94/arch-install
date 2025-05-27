paru -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat ebtables iptables libguestfs

sudo nvim /etc/libvirt/libvirtd.conf #uncheck:
# unix_sock_group = "libvirt"
# unix_sock_rw_perms = "0770"

sudo systemctl enable libvirtd.service

sudo systemctl start libvirtd.service

sudo usermod -a -G libvirt $(whoami)

newgrp libvirt

sudo systemctl restart libvirtd.service
