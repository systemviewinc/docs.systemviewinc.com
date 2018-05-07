### VSI Common Interface
VSI Common Interface is the Hardware (FPGA) side of the connectivity. It is a collection of DMAs and an Interrupt controller and can operate with ALL versions of ZynQ & over PCI/e. The following screenshot shows the configuration dialog for the VSI Common Interface.

![alt text](/img/img_getting_started/vsi_common_interface.png)

The current version of the VSI Common Interface can be configured with upto 2 DMAs; future versions will have more DMAs.  The DMAs communicate with the System Memory using the DMA_[n] interfaces , these interfaces should be connected to PCI/e Slave Port, or the Zynq HP[n] ports. The M_AXI_[n] ports are left open and used by the VSI System Compiler to connect processing blocks that are placed in the Hardware execution Context. The CTRL is used by the compiler to connect the AXI – Lite control interfaces.
Interrupts from the blocks are connected by the System Compiler to the open interrupt input irq\_i\_[n]. The output interrupt from the VSI Common Interface is connected to the input of the Zynq processing block or the PCI/e block’s interrupt input.

