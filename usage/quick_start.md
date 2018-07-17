# Visual System Integrator: Quick Start
This Quick Start will describe how to create a simple system using Visual System Integrator.

## Start the VSI software
To start the tool just type:
```sh
${VSI_INSTALL}/host/<HOST_TYPE>/bin/vsi
```

> ${VSI_INSTALL} – path to VSI installation  
> HOST_TYPE – linux.x86_64 | windows.x86_64

## Import Existing platform
In this guide we will import an existing platform.
1. ***Quick Start > Open Example Project***
2. Choose a name, location, and a default Xilinx board for your project.
3. Select **zynq** from platform_list.
This will create a Platform with two “Execution Contexts” . A [Software context](/usage/software_context_details.md) `“zynq_ps”` and a [Hardware context](/usage/hardware_context_details.md) `“zynq_pl”`.
4. ***Click Flow > Compile Platform*** to compile the platform.

## Application System Canvas
1. Clicking ***Flow > Create System*** to create an "Application Canvas".
This will create a blank “System Canvas”.
2. Clicking ***Flow > Import Platform*** to import the platform definition.
After importing the platform, the execution contexts show up as blank entities.

## Develop Application
#### 1. Import a Block From Library:
- Double click anywhere in the software context enter into it.
- Right-Click and select ***“Add IP“***.
- Select ***“VSI TCP Server v1.0”***.  
	This will place the TCP/IP server in the System Canvas.

#### 2. Import C/C++ code
We will use the [“Software Import Wizard”](/usage/user_guide.md) to import a “sort” function as a block.
- Right-click and select ***“Add IP”***
- Select **“VSI Software Import Wizard”**.
- Double-Click on **vsi_gen_ip_0** to import the “sort” C function.
	- The “Source Directory” box either “Browse” to or enter the directory _${VSI_INSTALL}/target/common/hls_examples/sort_  
		The “Software Import Wizard” will call a “built-in” C/C++ parser and present drop-down list of functions it finds (C/C++ Function Name).
	- Choose the sort function, and navigate to the “Arguments” section.  
		The “Arguments” section will show the two arguments `in_arr` and `out_arr` with some default values filled in.  
	- Mark `in_arr` as an _“Execution Trigger”_; this indicates that the VSI runtime will execute this function whenever data is available in this input interface.
	- Mark the “Direction” of `out_arr` as _“output”_. The sort function puts the output into this buffer when it finishes execution.
	- Change “Access Type” of `out_arr` to _“Random”_. The sort algorithm accesses the output array in a non-sequential fashion.
	- Click OK. The interfaces of the block are now updated to reflect the name and direction specified in the “Arguments” section.

#### 3. Make connection between graphical blocks
- Connect the `server_data_out` interface of the ***TCP/IP server*** to the `in_arr` interface of the ***vsi_gen_ip_0*** . 
- Connect the `out_arr` interface of the ***vsi_gen_ip_0*** block to the `server_data_in` interface of the ***TCP/IP server*** .  

> Some blocks can be [moved between execution contexts](/usage/moving_blocks_between_contexts.md).

### Build Application
1. With the System Canvas open Click on ***Flow > Generate System***
2. Build the High-Level Synthesis blocks by clicking on ***Flow > Build HLS***
3. Build the executables for Software Contexts by clicking on ***Flow > Build Software Contexts*** .
4. Building the Hardware Project by clicking on ***Flow > Build Hardware***.  
	- VSI also supports [remote hardware build](/usage/launching_hardware_builds_on_remote_hosts.md). 

This completes the build process for the example project.

#### Execute Application
The following steps showing how to execute the generated project on a `Zynq-SoC` Based [MicroZed](https://www.xilinx.com/products/boards-and-kits/1-5lakcu.html) board.
1. Prerequisites:
	- Build the Linux kernel and root file system for the Board you are using
	- Cloning repository https://github.com/systemviewinc/fpga_driver.git to your home directory
	- Source the xilinx environment settings:
		```sh
		source /opt/Xilinx/Vivado/<vivado_version>/settings64.sh
		```
	- Build the driver:
		```sh
		 make CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm KERNEL_SOURCES=<home_dir>/build/driver_vsi/linux-xlnx
		 ```
2. Login to your board and create a directory in the root-file-system, this is an optional step. It will help you isolate the files being copied.
3. Coppying the following files from the build directory to the target filesystem:
- The bitstream file. This file can be found at  _<hw_project_directory>/zynq_pl/zynq_pl.runs/impl_1/zynq_pl_wrapper.bin_.<sup>1</sup>
	> For `Yocto Linux` kernels. The generated Bitstream file is ***zynq_pl_wrapper.bit*** that can be found at  _<hw_project_directory>/zynq_pl/zynq_pl.runs/impl_1/zynq_pl_wrapper.bit_ .
- The driver installation script found at _<project_dir>/vsi_auto_gen/sw/<software_context_name>/driver.sh_
	> _<project_dir>/vsi_auto_gen/sw/zynq_ps/driver.sh_
- The Software Executable _<project_dir>/vsi_auto_gen/sw/build/<software_context_name>/bin/<software_context_name>_
	> _<project_dir>/vsi_auto_gen/sw/build/zynq_ps/bin/zynq_ps_
- The device driver ***“vsi_driver.ko”*** created in the previous step.
