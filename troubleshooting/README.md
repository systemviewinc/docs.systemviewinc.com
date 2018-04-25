### Troubleshooting

#### General
- The Context parameters in platform are greyed out and cannot be changed
	- Run vsi::\__::fix_platform_context in VSI TCL console (the platform canvas must be open)


- When importing the platform file into an existing system context tab, encountered with the error message "*failed import. The design "platform" is not a valid vsi_system design*".Follow the below steps
	- Select the "**Sources**" tab.
	- Select the < **system_context** \> from the list in the Sources tab.
	- `Import Platform`.

- Modifying TCP server settings for data type and package size is not editable in input and output blocks
	- uncheck and re-check the check box for the input and output, then the fields will be editable.

- when creating platform for a particular speed grade part using the create_zync_platform.tcl script the default part value is set to xc7z020clg400-2.
	- Edit vsi_create_zynq_platform.tcl file to the corresponding part of the speed grade.

- User constraints is not been applied due to the default user constraints in Vivado.
	- After encountering with the error edit the file mentioned in the error according to the required constraints to the user.
	- For example: When a Project with x86 and PCIe is created user constraints. Disable the 4 constraints regarding the pcie lane location and add the required ones.

- Crashing of the software executable due to insufficient FIFO size.
	- For example: The system consists of a x86 PC and a FPGA connected over PCIe. The system consists 2 tcp Servers and a customized VHDL IP, see image. When more than 4096Bytes are sent to the hardware at ones, the Software executable crashed.
		![alt text](/img/img_troubleshoot/Crashing_software_1.jpg)
	- In the generated vivado Project, open the Blockdesign, search for the vc707 block and open. There is a FIFO Block located near the input and output of the custom VHDL IP. Adjust the FIFO size to be larger then the max. possible input packet size.
		![alt text](/img/img_troubleshoot/Crashing_software_2.jpg)

#### Runtime / Generated Context
- The first step should be to enable logging for runtime. VSI Runtime supports a modular logging system that can be turned on by setting the environment variables `VSI_LOG_LVL=info and VSI_LOG_COMPS=all`. For the full set of valid values, [see logging section](/runtime/logging)

#### Java Specific

- Swig Director Error

#### Python Specific

- Swig Director Error
	- Check the data size is properly set inside each software wizard. Sometimes, an IP upgrade can null out the values.
	- Check that the data type is correctly set. For valid types that are supported, [check here](/runtime/sw_wizard)
- Cannot import <name of module>
	- Make sure that all the sources are present in the current directory. In addition, a `_<context_name>.so` should be present.

- Build errors on `Flow->Build Software Contexts`
	- When switching between a cross compile and host compile for a context, even when "clean and rebuild" is selected, the switched context still has a toolchain file and CMake may attempt to use it when compiling. The fix is to delete the context directory under `<project>/vsi_auto_gen/sw` and regenerate the context using `generate system`. After which the build should use the correct compiler.
