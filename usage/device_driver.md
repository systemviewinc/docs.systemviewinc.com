
## Device Driver
The user can configure various parameters of the device driver using the Device Driver configuration panel.

![alt text](/img/img_getting_started/device_driver_01.png)
- Driver Library Name : Is the kernel Image name which will be installed when the application program for this context is started.
- Major Number : For Driver Type “Zynq”, “PCIe” & “OpenAMP” the driver uses a “File” based mechanism to communicate with the hardware. The Major number species the Major number to use for this driver in the linux kernel, default value is 241 can be changed if this major number is already being used by another driver in the system.
- Size of DMA Buffer: The DMA during initialization allocates a contiguous memory buffer to communicate with the DMA. This parameter determines the total memory allocated for this buffer.
- Buffer Size for each file : Each file is allocated a certain amount of buffer space from the DMA buffer mentioned before; This parameter determines the amount of buffer per file.
- Driver Type : Lets the VSI System Level compiler decide the driver specific mechanism to use when communicating with this driver.
  - ZYNQ (Connected to FPGA Over AXI Interfaces)
  - PCI/E (Connected to FPGA Over a PCIe Link)
  - OpenAMP (Connected to Another Software Context Using Open APM)
  - Simulator (Connected To A simulator using Remote Procedure Call [RPC])
- Interrupt controller Address : Base address of the interrupt controller in the VSI Common interface (typically should not change).

![alt text](/img/img_getting_started/device_driver_02.png)

- Number of CDMAs – Choose the number of CDMAs in the VSI Common interface.
- CDMA N<sup>th</sup> address – Address of the N<sup>th</sup> CDMA’s control port in the VSI Common Interface (typically should not change).

![alt text](/img/img_getting_started/device_driver_03.png)

- PCIe Device ID : For Driver Type PCI/e this parameter should match the hardware PCI/e core configuration.
- PCIe Control Port Address: The driver internally uses this value to determine if a DMA will be needed to transfer the data , or a “direct” read write operation can be performed.

