## Hardware Context Details
Expand the Hardware Context “zynq_pl” by clicking on the ![alt text](/img/img_getting_started/expand_zynq_ps.png) . Then clicking on the "vsi_context_zynq_1" icon <img src="/img/img_getting_started/vsi_context_zynq_1_icon_01.png" width="70"> .

![alt text](/img/img_getting_started/hardware_context_details_01.png)

- Context Type : Hardware
- Hostname : is replaced by the ip address if this Hardware context is to be run the simulator , otherwise ignored.

![alt text](/img/img_getting_started/hardware_context_details_02.png)

- FPGA Part Number : for this hardware context
- FPGA Board : being used for this project.
- Simulator to use.
- Simulation/Synthesis Design Top : Name of the module to be used as “Top” . The design generated by VSI need not be the top-level module. Top level module must instantiate the design generated by VSI, if this field is left blank then it is assumed that the VSI generated design will be the top-level.
- Simulation/Synthesis Defines & Parameters : is a comma separated list parameter value pairs these will be passed to the Synthesis and Simulation projects. E.g. INX_SIMULATOR=1,DDR4_4G_X16=1
- Synthesis Source Directories : Comma separated list of directories. All sources from these directories will be added to the Synthesis project, in addition to the sources generated by the VSI compiler. Can have environment variables for e.g. $(VSI_INSTALL)/syn_src
- Synthesis Include Directories : Comma separated list of directories. These include directories are added to the search path of the synthesis project. Can contain environment variables.
- Simulation Source Directories : Comma separated list of directories. All sources from these directories will be added to the Simulation project, in addition to the sources generated by the VSI compiler. Can have environment variables for e.g. $(VSI_INSTALL)/sim_src
- Simulation Include Directories : Comma separated list of directories. These include directories are added to the search path of the Simulation project. Can contain environment variables.
- Simulation file list : is a file that contains a list of files . The file must contain only one filename per line. When this file is provided the “automatic” source code ordering is disabled for this project.