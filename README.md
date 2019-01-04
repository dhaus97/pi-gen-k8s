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

**As of now, the image has only been verified to run on a Raspberry Pi Model 3 and a Raspberry Pi Zero**

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
| TARGET_DEVICE | The target device (Currently supported: Raspberry Pi 3 and Raspberry Pi Zero) | RPi3 | Yes |
| WPA_ESSID | The name of the WLAN access point to connect to | None | No |
| WPA_PASSWORD | The password for the previously specified WLAN access point | None | No |
| WPA_COUNTRY | The country of the WLAN access point (needed for Raspi configuration) | None | No |


## Additional comments and hints
----------

Since this image comes with Docker and Kubernetes resources preinstalled and configured, it is likely that it will be used in a Kubernetes background. 

The following articles / guides / hints can be split apart into two scenarios:
1. Build a Kubernetes Cluster with only Raspberry Pi's
2. Use Raspberry Pi's as worker nodes in a Kubernetes Cluster

The following articles / guides can be useful for case 1:

*Hints*:
*1. Set a static IP address for the master node (Currently, this is not supported from Pi-Gen but will be added later on)*

The following articles / guides can be useful for case 2:

## TODO / Future plans
----------

1. Currently, the distribution and the image afterwards is still relatively big.
The packages needed shall be slimmed down (e.g. no build-essential, python or dev libraries)

2. WLAN is now turned on every time, either an environment variable or another branch should be used for WLAN configuration.

3. During build process, many errors are shown because of the locale not correctly being confgigured. This shall be changed as well.

4. The image has a static hostname, during first boot a script shall be added which gives the option to change the hostname.

5. Static IP addresses should be either given during build process (not optimal in my opinion) or through a script which is installed in the image.