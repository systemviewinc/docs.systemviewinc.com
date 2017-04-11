This document explains how to install Visual System Integrator on a Windows 10 x64 Pro Host. These instructions might work on other Windows variants however we have only tested them on Windows 10 x64.

### Prerequisites

- Windows 10 x64 Home, Pro or Enterprise Edition<sup>1</sup>
- Vivado HL System Edition 2016.4 or newer: [Download here (registration required)](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools.html)<sup>2</sup>
- Xilinx SDK : [Download here (registration required)](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/embedded-design-tools.html)<sup>3</sup>

### Instructions

#### Options
- Use the Powershell script to download and install Visual System Integrator automatically.
- Manually follow steps to extract and install Visual System Integrator

#### Use Powershell Script
Coming Soon

#### Manual Steps
1. Download the installation file from [Here](/releases) (Make sure to choose the major version that corresponds to the Vivado version that is installed on the host)<sup>4</sup>
1. Extract the compressed file in a directory of your choice (example: C:\\Systemview\\VSI).
2. set environment variable `VSI_INSTALL` which should point to the directory where you extracted the file
	- command prompt: `setx VSI_INSTALL C:\Systemview\VSI` (to make the change permanent, add it to system->advanced->environment variables)
3. Append $VSI_INSTALL/host/linux_x86_64/bin to your $PATH to be able to launch VSI from commandline
	- command prompt: `setx PATH %PATH%;%VSI_INSTALL%\host\windows.x86_64\bin` (to make the change permanent, add it to system->advanced->environment variables)
3. Optional: if you have already received a VSI license, copy it over to %VSI_INSTALL% directory.
3. Run VSI: Open a command prompt window and issue the command `vsi.exe`. If the installation was successful then you should see text similar to this:
	- `Visual System Integrator version: V2017.1_HEAD-29-gdc85abc, Compiler: "GNU - 5.4.0 20160609", Buildhost: "nanl - Linux-4.4.0-72-generic", Date: 2017-04-07T17:24:29`<br/>`loading Visual System Integrator...`
4. If you don't see similar text then see [Troubleshooting](/troubleshooting)


##### Footnotes
1. Pathname longer than 256 characters are not supported on Windows 10 Home Edition.
1. Make sure to select SDK in installation options
1. Only required if Vivado was preinstalled without the Embedded SDK or if it was not selected during Vivado Installation.
1. Certain VSI features are only available on newer releases. For a feature comparison matrix, [look here](/features)
