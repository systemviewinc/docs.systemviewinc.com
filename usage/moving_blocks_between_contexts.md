## Moving Blocks between Contexts:
Some blocks can be moved between execution contexts. In this example the “sort” function code is synthesizable to hardware using the Vivado HLS C RTL compiler and hence can be moved to Hardware Context (“zynq_pl”).

Go back to the system level diagram by clicking the “system_1” tab in the Diagram view.

![alt text](/img/img_getting_started/moving_blocks_between_contexts_1.png)

Expand both the contexts by clicking on the ![alt text](/img/img_getting_started/expand_zynq_ps.png) . Select the “vsi_gen_ip_0” block and drag it inside the Hardware Context (“zynq_pl”) and release it. Not all blocks can be moved between contexts, an attempt to move the “TCP/IP” server block will result in error.

![alt text](/img/img_getting_started/moving_blocks_between_contexts_2.png)

When the VSI System Compiler detects an interface crossing between two “Execution Contexts”, it will configure the runtime environment on the Software Context (“zynq_ps”) to communicate with the [“Device Driver”](/usage/device_driver.md). On the Hardware Context it will connect the interfaces to the “vsi_common_interface” and setup the driver for the communication channels. Each interface that crosses the boundary is treated a separate channel. In this example, we have two interfaces that are crossing the boundary, hence two communication channels will be setup for the driver. There are no limits to the number of interfaces that can cross between contexts.

