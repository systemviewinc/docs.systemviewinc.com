## Software Context Details
Expand the Software Context “zynq_ps” by clicking on the ![alt text](/img/img_getting_started/expand_zynq_ps.png) . Then double-click on the "vsi_context_ARM" icon <img src="/img/img_getting_started/vsi_context_ARM_icon_01.png" width="70"> to inspect the context details.

![alt text](/img/img_getting_started/software_context_details_01.png)

- Context Type : Software
- Hostname : can be replaced by the ip address of the context
- Include Directories : comma separated list of directories that will be used to search for header files.

And to inspect the software parameters.

![alt text](/img/img_getting_started/software_context_details_02.png)

- CPU Type : ARM, X86, ARM-64, ARM-R5
- Operating System : Linux/Freertos (currently FreeRtos is supported for ARM-R5 only)
- C++ Compiler Options to use when the project is created for this Software Context.
- C Compiler Options to be used when the project is created for this Context
- Use Cross Compiler : this is the Cross Compiler Prefix prepended to gcc or g++ when the project is generated for this context

