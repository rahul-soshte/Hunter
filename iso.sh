#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/hunter.kernel isodir/boot/hunter.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "hunter" {
	multiboot /boot/hunter.kernel
}
EOF
grub-mkrescue -o hunter.iso isodir
