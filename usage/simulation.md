# VSI Simulation
This section describes how to build simulation in Visual System Integrator. Current example reads file from the host machine handled by simulation system and writes back the result.

##Create VSI project
From menu bar, select ***File -> New project***

{% center %} ![alt text](/img/simulation/01_NewProject.png) {% endcenter %}

Specify Project name and location as shown in figure below.

{% center %} ![alt text](/img/simulation/02_newprojectname.png) {% endcenter %}

"Default Part" window: select "Boards", ZedBoard and press Next -> Finish.

{% center %} ![alt text](/img/simulation/03_selectBoard.png) {% endcenter %}

##Create Platform
***menu bar -> Flow -> Create Plaform***, press OK in the appeared window.

{% center %} ![alt text](/img/simulation/04_CreatePlatform.png) {% endcenter %}

Open Diagram that has been created at the previous step  with your platform (default name: platform_1).

###Software Context

***menu bar -> Flow -> Create Context*** Select Type: Software, and setup name of new context, for example: soft_context

{% center %} ![alt text](/img/simulation/05_SoftwareContextCreate.png) {% endcenter %}

Double click on software context and add path to Xilinx header 
Include Directory. In exempel it is:  /opt/Xilinx/Vivado_HLS/2017.1/include

{% center %} ![alt text](/img/simulation/06_headerInclude.png) {% endcenter %}

Open Software context (soft_context). Add “VSI Driver Setup Wizard” IP.

{% center %} ![alt text](/img/simulation/07_adddriwer.png) {% endcenter %}

Set Driver Type to SIMULATOR

{% center %} ![alt text](/img/simulation/08_Driversettings.png) {% endcenter %}

###Hardware Context (Simulation)
***menu bar -> Flow -> Create Context* Select Type: Hardware, and setup name of new context, for example: hardware_simulation

In “context parameters” select the following parameters:
Target platform: Simulator
Simulator: Vivado Simulator

{% center %} ![alt text](/img/simulation/09_HardwareContextSettings.png) {% endcenter %}

Open Hardware context (hardware_simulation). Add “VSI Xilinx AXI BFM” IP, make next connections:
gen_clk <-> m_axi_aclk,
gen_reset <-> m_axi_aresetn

{% center %} ![alt text](/img/simulation/10_hardwcontext.png) {% endcenter %}

###Contexts cross connection
Open platform diagram to connect  “VSI Driver Setup Wizard” M_AXI and “VSI Xilinx AXI BFM” plat_axi ports.

{% center %} ![alt text](/img/simulation/11_sw_hw_interconnect.png) {% endcenter %}

Save all your changes.

##Create System
***menu bar -> Flow -> Create System***, press OK in the appeared window.

Open system (default name system_1) and import platform: ***menu bar -> Flow -> Import Platform***

{% center %} ![alt text](/img/simulation/12_Importsystem.png) {% endcenter %}

Open Software Context (double click at the empty space in software context)

Add "VSI Software Import Wizard" IP component.
Open Re-customize IP window (double click) at the source directory, select path to vsi/staging/target/common/hls_examples/memory and press Refresh.
Set the following parameters:
<<<<<<< HEAD
- Function : read_file_send
	- Arg1 Direction : output
=======
-Function : read_file_send
-Arg1 Direction : output
>>>>>>> 39ee61dfe3486a0735ccaa105c6ddfcbfc3e5354

{% center %} ![alt text](/img/simulation/13_SoftWizard_readFile.png) {% endcenter %}

Create VSI Software IP component with the following parameters:
<<<<<<< HEAD
- Function : recv_write_file
	- Arg1 Direction : input


Create VSI Software IP component with the following parameters:
- Function : process_data
	- Arg1 (in_s) Direction : input
	- Arg2 (out_s) Direction : output
=======
-Function : recv_write_file
	-Arg1 Direction : input


Create VSI Software IP component with the following parameters:
-Function : process_data
	-Arg1 (in_s) Direction : input
	-Arg2 (out_s) Direction : output
>>>>>>> 39ee61dfe3486a0735ccaa105c6ddfcbfc3e5354

{% center %} ![alt text](/img/simulation/14_SoftwareIP_process_data.png) {% endcenter %}

Make connection between components: 

Read_file {out_s} <->  {in_s} process  {out_s} <->  {in_s} writefile

{% center %} ![alt text](/img/simulation/15_connection.png) {% endcenter %}

Save your changes.

From system diagram drag and drop process ip block to the simulation context space.

{% center %} ![alt text](/img/simulation/16_proc2hw.png) {% endcenter %}

Now process is located at the hardware simulation context.

System generation 
<<<<<<< HEAD
- Compile platform : ***menu bar -> Flow -> Compile Platform***
- Generate system : ***menu bar -> Flow -> Import Platform***
- Build HLS system : ***menu bar -> Flow -> Build HLS***
- Build Software : ***menu bar -> Flow -> Build HLS***
=======
Compile platform : ***menu bar -> Flow -> Compile Platform***
Generate system : ***menu bar -> Flow -> Import Platform***
Build HLS system : ***menu bar -> Flow -> Build HLS***
Build Software : ***menu bar -> Flow -> Build HLS***
>>>>>>> 39ee61dfe3486a0735ccaa105c6ddfcbfc3e5354

##Run Simulation

Open Xilinx Vivado and execute script <project_location>/vsi_auto_gen/hw/hardware_simulation_platform.tcl that will generate Vivado project.

Go to <project_location>/vsi_auto_gen/sw/system_1/build/soft_context

Generate test file
<<<<<<< HEAD
```
dd if=/dev/random of=infile.txt bs=1 count=64
```
=======
dd if=/dev/random of=infile.txt bs=1 count=64

>>>>>>> 39ee61dfe3486a0735ccaa105c6ddfcbfc3e5354
Launch simulation from Vivado.
***menu bar -> Flow -> Run Simulation -> Run Behavioral Simulation***

{% center %} ![alt text](/img/simulation/17_Vivado_runSimulation.png) {% endcenter %}

Run simulation
***menu bar -> Run -> Run All***

{% center %} ![alt text](/img/simulation/18_Vivado_runAll.png) {% endcenter %}

Start program from the command line

Go to project_location/vsi_auto_gen/sw/system_1/build/soft_context and run the program:
<<<<<<< HEAD
```./bin/soft_context```
=======
./bin/soft_context
>>>>>>> 39ee61dfe3486a0735ccaa105c6ddfcbfc3e5354
In this example input file (infile.txt) has to be located in the directory where generic program is executed.  

Break simulation

***menu bar -> Run -> Break***

Output.txt file (similar to input.txt) is created as a result of the simulation.

