This document explains how to install Visual System Integrator on Ubuntu Linux Host. The instructions might also work for other linux variants but we have only tested these instructions on Ubuntu Desktop 14.04 and 16.04.

### Prerequisites

- Linux Kernel 3.x<sup>1</sup>
- Vivado HL System Edition 2016.4 or newer: [Download here (registration required)](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools.html)
- Xilinx SDK (Only required if it wasn't previously selected during Vivado Installation): [Download here (registration required)](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/embedded-design-tools.html)

### Instructions

#### Options
- Use the bash script to download and install Visual System Integrator automatically.
- Manually follow steps to extract and install Visual System Integrator

#### Install using the script
Coming soon

#### Manual Steps
1. Download the installation file from [Here](/releases.md) (Make sure to choose the major version that corresponds to the Vivado version that is installed on the host)<sup>2</sup>
1. Extract the compressed file in a directory of your choice (example: /opt/Systemview/VSI).
2. set environment variable `VSI_INSTALL` which should point to the directory where you extracted the file
	- bash: `export VSI_INSTALL=/opt/Systemview/VSI` (to make the change permanent, add this line to your ~/.bashrc)
3. Append $VSI_INSTALL/host/linux_x86_64/bin to your $PATH to be able to launch VSI from commandline
	- bash: `export PATH=$PATH:$VSI_INSTALL/host/linux.x86_64/bin` (to make the change permanent, add this line to your ~/.bashrc)
3. Optional: if you have already received your license, copy it to $VSI_INSTALL directory.
3. Open a terminal and issue the command `vsi`. If the installation was successful then you should see text similar to this:
	- ` Visual System Integrator version: V2017.1_HEAD-29-gdc85abc, Compiler: "GNU - 5.4.0 20160609", Buildhost: "nanl - Linux-4.4.0-72-generic", Date: 2017-04-07T17:24:29`<br/>`loading Visual System Integrator...`
4. If you don't see similar text then see [Troubleshooting](/troubleshooting/)


##### Footnotes
1. typically a modern linux distribution released within the last 5 years should work; We recommend Ubuntu 14.04 LTS or newer (or Other Ubuntu derivatives Xubuntu, Kubuntu,...)
1. Certain VSI features are only available on newer releases. For a feature comparison matrix, [look here](/features/)
