# Installation Instructions for Windows Host

Visual System Integrator installation is done by extracting the tarball on a host machine, setting the environment variable and setting up Vivado installation.

## Prerequisites

1. Windows 7 or above
2. VSI Version of Vivado installed on host machine.
3. gnu tar or a similar utility to extract tar.gz archives

## Steps

1. Extract the provided tarball for vsi in a directory on the host machine.
2. Set an environment variable called VSI_INSTALL pointing to the directory e.g: "setx /m VSI_INSTALL c:\\vsi" from command line (start as administrator).
![install iamge](/img/windows_install.gif)
3. Add the following line to Vivado init.tcl file without the quotes: "source $::env(VSI_INSTALL)/host/windows.x86_64/tcl/vsi_load.tcl"
![install iamge](/img/windows_init.gif)
4. Copy vsi.lic license file that you must've received to the %VSI_INSTALL% directory (each license is locked to ethernet mac address).
5. Start Vivado.
![install iamge](/img/windows_start.gif)
