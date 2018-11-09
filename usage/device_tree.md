# Device Tree
Building Device Tree for the board you are using (This demo is for board zcu102).

### Prerequisites
This section assumes that the following prerequisites have been satisfied:
- PetaLinux Tools Installation is completed.
- PetaLinux Working Environment Setup is completed.

## Petalinux Flow
BSP package was used to built the petalinux project. However users, can also use the HDF exported from Vivado to build the project. (BSP can be downloaded from the Xilinx website [here](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/embedded-design-tools.html).)

1. Change to the directory under which you want PetaLinux projects to be created.

2. Run petalinux-create command on the command console:
```sh
petalinux-create -t project -s <path-to-bsp>
```

3. Modify the system-user.dtsi file in the following path:
```sh
 <petalinux-project-path>/project-spec/meta-user/recipes-bsp/device-tree/files/
 ```
As follow:
```sh
/include/ "system-conf.dtsi"
/{
	amba {
			vsi_driver_plat@80000000 {
				compatible = "xlnx,sv_driver_plat";
				interrupt-parent = <0x4>;
				interrupts = <0x0 0x59 0x4>;  
				reg = <0x0 0x80000000 0x0 0x000C000 0x0 0x88000000 0x0 0x08000000>;
			};
		};
};
```
The interrupt number is the default interrupt number when you connect to interrupt number zero. If you connect to other interrupt number, you have to modify it.

4. Configure Petalinux:
```sh
petalinux-config
```
	- Subsystem auto hardware -> advanced bootable images storage settings -> dtb image settings ->IMAGE STORAGE MEDIA -> primary sd

	- Image Packaging Configuration -> Root FS type -> sd card

	- Image Packaging Configuration -> Turn off copy final image to tftp boot

	- yocto settings -> disable network sstate feeds

5. Build the Device Tree:
```sh
petalinux-build -c device-tree
```
This will create the image/linux directory.

6. Use the files in pre_built directory to create the BOOT.BIN as follow:
```sh
petalinux-package --boot --fsbl zynqmp_fsbl.elf --fpga system.bit --pmufw pmufw.elf --u-boot
```

Copy image.ub and BOOT.BIN from image/linux to your SD card.
