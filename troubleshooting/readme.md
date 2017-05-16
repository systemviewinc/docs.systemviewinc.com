### Troubleshooting

#### General
- The Context parameters in platform are greyed out and cannot be changed
	- Run vsi::\__::fix_platform_context in VSI TCL console (the platform canvas must be open)

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

#### Import platform

- When importing the platform file into an existing system context tab, encountered with the error message "*failed import. The design "platform" is not a valid vsi_system design*".Follow the below steps
	- Select the "**Sources**" tab.
	- Select the < **system_context** \> from the list in the Sources tab.
	- `Import Platform`.
