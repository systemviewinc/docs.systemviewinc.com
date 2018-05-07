# Visual System Integrator
## Concepts
The Visual System Integrator (VSI) has two canvases:
-   Platform Canvas 
-   System Canvas

The system design process in VSI begins by creating a platform. The platform consists of one or more “Execution context”.  An “Execution Context” is defined as an entity in which a Hardware (RTL) or a Software (C,C++,Java) block can be placed for execution.
The “Platform” defines the “Execution Contexts” that will be used in this System and how they are connected. VSI currently supports the following “Execution Contexts”:

- Software
  - X86
  - ARM-32 bit
  - ARM-64 bit
  - ARM-Cortex-R5
- Hardware
  - All Xilinx FPGAs supported by Vivado
  - Simulator (XSIM, Modelsim)

For Hardware Contexts blocks / interfaces that require timing/location constraints must be placed in the “Execution Context”.
### Work Flow
Figure 1 shows the “Work Flow” when using VSI. The user starts by Creating a platform or Importing an existing platform. Once the Platform is Created/Imported the user then “Compiles” the platform. The next step is to create the “Application System” canvas and import the Platform definition.
The application development involves importing RTL or C/C++/Java blocks of code with well-defined interfaces and connecting these interfaces to form the Dataflow graph of the Application System. The VSI System Compiler and the VSI Runtime will move the data between these blocks as they execute in their assigned “execution contexts”. With some restrictions, the blocks can be moved between “Execution Contexts”.
Once the application system is developed the user can “Generate System” , the VSI System Compiler will generate Vivado IPI Projects (for Hardware Contexts) and CMake based projects (for Software Contexts); there are no restrictions to the number of “Execution Contexts” in the system.

![alt text](/img/img_getting_started/Visual_System_Integrator:Work_Flow.png)
