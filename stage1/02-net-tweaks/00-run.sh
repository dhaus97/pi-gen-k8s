#!/bin/bash -e

install -m 644 files/ipv6.conf "${ROOTFS_DIR}/etc/modprobe.d/ipv6.conf"
install -m 644 files/hostname "${ROOTFS_DIR}/etc/hostname"

ln -sf /dev/null "${ROOTFS_DIR}/etc/systemd/network/99-default.link"

on_chroot <<EOF
sed -i -e 's/raspi-k8s/${HOSTNAME}/g' /etc/hostname
EOF
