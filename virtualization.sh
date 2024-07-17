paru -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat

sudo systemctl enable libvirtd.service

sudo systemctl start libvirtd.service

sudo usermod -a -G libvirt $(whoami)

sudo systemctl restart libvirtd.service
