### Troubleshooting

#### General
- The Context parameters in platform are greyed out and cannot be changed
	- Run vsi::__::fix_platform_context in VSI TCL console (the platform canvas must be open)

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
