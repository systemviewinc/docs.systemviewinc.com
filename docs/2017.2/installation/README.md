## Overview

Visual System Integrator installation is supported on Windows and Linux.

In addition an <b>Amazon AWS AMI</b> is also provided (with an alternative licensing model<sup>pay per hour</sup>) which can be used independently or in combination with AWS F1 FPGA Instances.

We also have a prebuilt <b>Docker image</b> <sup>(beta)</sup> which can be used on MacOS.

## Requirements (excluding Amazon AWS AMI)
Before you start, make sure that your system meets the minimum hardware requirements as below:

### Hardware Requirements:
- Dual core Intel Processor (quad-core or better recommended)
- 4GB of RAM (8GB or more recommended)
- 50GB of free disk space for Vivado installation (this does not apply if you already have a recent Vivado installation 2016.4 or above).

### Software Requirements:
- Vivado HLx System Edition 2016.4 or newer: [Download here (registration required)](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools.html)
- Xilinx SDK (Only required if it wasn't previously selected during Vivado Installation): [Download here (registration required)](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/embedded-design-tools.html)


### Before you begin
Download installation files for Visual System Integrator. Choose the version that corresponds to the Vivado version that you have installed.

- VSI installation files are available for:
	- Download link for [Visual System Integrator 2016.4 or newer (works with corresponding Vivado HLs System Edition 2016.4 or newer)](https://systemviewinc.com/download.html)
-  License for Visual System Integrator [request one here](http://systemviewinc.com/license.html).

### Host specific instructions

- [Windows](windows.md)
- [Linux](linux.md)
- [Amazon AWS](aws.md)
- [Docker](docker.md)
