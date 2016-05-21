set -x 
set -e
wget -c https://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe.vmlinuz
wget -c https://stable.release.core-os.net/amd64-usr/current/coreos_production_pxe_image.cpio.gz
gunzip -fk coreos_production_pxe_image.cpio.gz  
tar -czvf usr/share/oem/serf.tgz opt/ etc/ 
find usr/  | cpio --verbose -o -A -H newc -O coreos_production_pxe_image.cpio 
gzip -ck coreos_production_pxe_image.cpio >coreos.cpio.gz 
qemu-system-x86_64 -machine accel=kvm -m 4G -smp 2 -kernel coreos_production_pxe.vmlinuz -initrd coreos.cpio.gz -append "coreos.autologin=tty1 console=tty1" -net nic -net tap,ifname=tap0,script=/bin/true,downscript=/bin/true
