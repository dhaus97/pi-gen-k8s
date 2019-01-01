# Pi Gen
----------

## Description
----------

This repo provides you with a lightweight Raspberry-Pi Distribution. It can be forked and used to further customize it based on your needs.

Instead of using a yocto based approach, this project relies on debootstrap to provide you with an operating system.

The operating system is running in a headless state without any GUI to maximize resource efficiency. 

All basic GPIO functionalities of the Raspberry Pi will be available, as well as Docker and Kubernetes Resources.

## Prerequisities
----------

Pi-gen is used in combination with either Debian Stretch or Ubuntu Xenial. Other distributions are **NOT** tested.

Pi-gen requires additional packages during the build process.
To install the required dependencies for pi-gen you should run:

```bash
apt-get install quilt parted realpath qemu-user-static debootstrap zerofree pxz zip \
dosfstools bsdtar libcap2-bin grep rsync xz-utils file git curl
```

## Usage and configuration
----------

The build is triggered by running the following command:
```bash
$ sudo ./build.sh
```

Additional configuration, such as first username and password, enabling ssh etc. can be done through the config file located in this repository.

This is a basic example config file, feel free to edit it as you wish.

The following configurations can be set:
| Name | Description | Default | Required |
| - | - | - | - |
| IMG_NAME | Name of the output image and the distribution itself | None | Yes |
| FIRST_USER_NAME | Username of the user which will be created besides the root account | pi | No **(still recommended)** |
| FIRST_USER_PASS | Password of the user which will be created besides the root account | raspberry | No **(still recommended)** |
| ENABLE_SSH | By setting the value to 1, enable the ssh daemon for a headless start | 0 | No **(still recommended)** |
| HOSTNAME | The hostname of the associated device (can be changed later on as well) | raspi-k8s | No |