# Installation Instructions

Visual System Integrator installation is done by extracting the tarball on a host machine, setting the environment variable and setting up Vivado installation.

## Prerequisites

1. Linux Host (Ubuntu 14.04 VM running in Virtualbox recommended)
2. VSI Version of Vivado installed on host machine.
3. cmake (install it using the package manager i.e apt-get or yum. Alternatively, download it from cmake.org)

## Steps

1. Extract the provided tarball for vsi in a directory on the host machine.
2. Set an environment variable called VSI_INSTALL pointing to the directory e.g: "export VSI_INSTALL=/opt/vsi" in .bashrc for bash shell.
3. Copy vsi.lic license file to the $VSI_INSTALL directory.


<img src="/img/linux_install.gif" width="100%">
