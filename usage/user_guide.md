# SOFTWARE IMPORT WIZARD
## Introduction
VSI software import Wizard, allows users to import C/C++ functions into the VSI dataflow environment.  The user can specify multiple source directories, a built-in C/C++ parser will parse all source files in these directories and create a list of functions the user can choose from. Once the user chooses the function associated with the block, the wizard will prefill most of the information “Arguments” section. Figure below shows the screen shot of the Software Import Wizard. The following sections will describe the wizard and each field in greater detail.

![alt text](/img/img_getting_started/import_C_C++_code_03.png)
## Top Level Tab
### Source Directory:
The Source directories can be selected by “Browsing” or by entering a comma separated list of directories. A built-in “clang” parser is invoked every time the directory field changes. All files C/C++ files in the directory list are parsed by the built-in parser and a function list is created. The label changes to red (“Top Level”) if the parser encounters an error, correct the parse error to continue. The built-in parser can be run from the command line to determine the cause of the error. To run the parser from the command line, use the following command
*$(VSI_INSTALL)/<HOST>/bin/vsi_clang \< source_files\> [-I \< include_dir\>]

\< HOST\> = linux.x86_64 | windows.x86_64

--help* will list the available options.

By default the parser will add the “Vivado HLS Include” path to the include directory path; all other include files are assumed to be present in the directory list provided. The source files from these directories will be copied to the project directory, unless **vsi::src_link_files**  is called from the TCL console, in which case a “soft link” will be created from the project directory to the source directories. The option set by **vsi::src_link_files** is persistent for a given project it can be switched back by the command **vsi::src_copy_files**.
### C/C++ Function Name:
This dropdown list is created by the built-in parser. Choose the function associated with the block. By default the function is expected to be **non-blocking**. The VSI compiler will generate a wrapper function which will call the chosen function; the input arguments are updated by the **vsi::runtime** environment before the function is called, the output arguments are read and send to the input of the connected function by the **vsi::runtime** when the function returns.
The vsi::runtime  supports other execution models as well. Complex systems sometimes require functions to have feedback/dependency between each other; i.e. a function can only proceed depending on the state of another function. This can be achieved by using Alt-***hls::stream***  or __***vsi::device***__ as argument types. Please refer to section [hls::stream](/runtime/hlsstream.md) and [vsi::device](/runtime/vsi_device.md) for more details on these execution models.
### Number of Parameters:
This field is automatically updated when the function is chosen from the drop-down list and represents the number of arguments the function has. The maximum number of arguments allowed is 16 ( 8 for versions 2016.4 and earlier).
### Allocate on Local Stack:
The vsi:runtime will create a wrapper function which calls the C/C++ function specified in the  “__C/C++ Function Name__” field. The wrapper function allocates some local variables to process the inputs and outputs of the functions. By default these variables will be allocated on the stack, on some target architectures (such as Cortex-R5) running real-time operating systems, the thread stack is limited; by unchecking this box the user can force the runtime to a declare the local variable as “***static***” which will cause them to be allocated on the global memory area.
### Thread Allocation:
The **vsi::runtime** will execute a function on its caller’s thread by default. It will create a separate thread for a function block, if
- “Dedicated Thread” is chosen
- No “Arguments” are marked as “Trigger” in the Argument Tab

### Execution Criterion:
**vsi::runtime** will execute a function if any ***input*** argument marked as “trigger” changes. The runtime can also execute a block based on a timer by choosing “Timer Expiry”. The runtime will create a timer which will execute the function every “Execution Timer” nano-seconds. The runtime will keep track of the amount of time spent by the function itself and will adjust the timer to make sure the function is executed as close to the “Execution Timer” value as possible.
### Execution Timer (nS):
This field is appeared when the “__Execution Criterion__” is specified as “Timer”, and specifies the interval for executing the given function.

![alt text](/img/img_getting_started/Execution_Timer.png)
## Arguments Section
Each argument of the function chosen in “C/C++ Function name” will be exposed as an interface of the “block” . This “section” allows the user to specify details about the interface that are not inferred by the built-in parser. Some fields have default values populated by the parser which the user can override. Figure below shows the Screen shot of the Argument section, the number of rows in the argument section is determined by the “__Number of Parameters__” in the __Selected Function__.

![alt text](/img/img_getting_started/software_import_wizard_argument.png)

### C/C++ HLS Name:
This field is automatically updated when the function is picked in the “Selected Function” and is the name of the argument.
### C/C++ HLS Type:
This filed is automatically updated when the function is picked in the “Selected Function” and is the type of the argument. The two type ***hls::stream*** and  ***vsi::device***  have special handling .
### Execution Trigger:
The function is executed whenever data arrives on this “Input” interface. See “Type" dropdown list for more details.
### Direction:
The choices as a) ***Input***  b) ***Output*** or c) ***Inout*** .
### Variable Length:
***Software Context*** : This is used ***only*** when the direction is ***Input and Type is an Array***.
***Hardware Context***: This is used ***only*** when the direction is ***Input and Access Type is Sequential***.
### Access Type:
The access type will generate different interfaces depending on the type of ***Context***.  The following table shows the interfaces generated for the different access types.

|**Context**|**Access Type ** |**Interface Generated**|
|-----------|-----------------|-----------------------|
|**Software**|Sequential|Unidirectional Streaming|
||Random|Unidirectional Streaming|
||Memory|AXI Memory Mapped (can only be connected to memory interfaces in Hardware Context). See vsi::device class for more details.|
||Control|AXI Lite Memory Mapped can only be connected to AXI Lite memory interfaces in Hardware Context). See vsi::device class for more details.|
|**Hardware**|Sequential|Unidirectional Streaming|
||Random|Block Ram Interface|
||Memory|AXI Memory Mapped (can only be connected to memory interfaces in Hardware Context).|
||Control|AXI Lite Memory Mapped can only be connected to AXI Lite memory interfaces in Hardware Context).|
The Sequential Vs Random access is important when the block resides in the ***Hardware Context***. Sequential access promises the Hardware Synthesis (Vivado HLS) that the function will always access the argument (Array / Pointer) in a sequential manner and is converted to an AXI Streaming interface.

### Array / Max packet size (Bytes):
This field is auto filled when the function is picked in the “Selected function” and represents the size of the buffer that will be allocated in the wrapper function for this argument. For “Pointer” type this field is initialized to -1, since the compiler cannot determine the amount of storage to allocate for this argument. It is **important** to specify the maximum size of the buffer to be allocated, for “pointers” this value will be used to allocate dynamic storage in the runtime, a value of -1 will cause a runtime failure.
This field is not used when the “Type” is “Reference”
### Type:
This field is auto filled by the parser when the function is picked in the “Selected function” and represents the storage allocation attribute of the “C/C++ Type” . The choices are a) Array  b) Pointer c) Reference d)Interupt e)Value.  This attribute along with the C/C++ Type is used by the VSI system compiler to generate the wrapper function for both Software & Hardware . The following table describes the behavior during runtime in a Software Context depending on the Type chosen.

|**Type**|**Direction**|**Wrapper Action**|
|-----------------|---------------|------------------|
|**Array**| Input/ Inout [Execution Trigger && \!Variable Length] | A local array of C/C++ Type will be allocated , the wrapper will accumulate input into the array . The user function will be ***called only when*** enough data has been received to fill the full array|
|| Input / Inout [Execution Trigger & Variable Length] | A local array of C/C++ Type . When new data arrives on this input, the wrapper function will copy the data into the local variable and call the user function.|
||Input [!Execution Trigger] | A local array C/C++ Type, When new data arrives on this interface the data is copied into the array. If more data arrives before the function is executed, the old data will be overwritten.|
||Output / Inout|Data is copied from the output Array and sent to the input of the block that it is connected to.|
|**Pointer**||It is chosen when the argument is a pointer in C/C++ code. Behaves the same way as Array. Note it is ***important*** to specify the Max Size of the buffer to be allocated.|
|**Reference**||It is chosen when the argument is a reference in C/C++ code. Behaves the same as a pointer|
|**Interupt**||Currently not supported|
|**Value**|Input / Output|It is chosen when the argument is basic type in C/C++ code such as int|
### Buffer Depth:
This field is used when the block is placed in the Hardware Context and the access type is “Sequential”. The VSI System Compiler will generate a FIFO of the given depth for each of the interfaces that has value > 0 associated with it.
### Sideband Attributes:
The hls::stream Class can be used to describe an AXI Streaming interface in software.

`template<int D>
struct ap_axis_dkt {
	ap_uint<D> data;
	ap_uint<1> last;
	ap_uint<D/8> keep;
	ap_uint<1> id;
};
hls::stream<ap_axis_dkt<32> > in;`

The above example shows an AXI Streaming interface with sideband signals of ID, LAST & KEEP. The sideband signals will be listed in this entry.
When such an interface crosses the boundary between a Hardware & Software context, the VSI system compiler generates code to try to preserve the sideband signals across the interface, with some restrictions.
- ID – is recognized in the first “beat” of the transfer, the ID will remain the same for the rest of the packet.
- KEEP – attribute is preserved only on the last beat of the transfer.
Both these attributes require the “LAST” attribute to be present.
## HLS Parameters
 Information in this block is used to generate the Vivado HLS project when the block is placed in a Hardware Context.

<!--[alt text](/img/img_user_guide/advanced_tab.png)-->
### Clock Frequency in HZ:
This parameter will be passed to the Vivado HLS project as the requested timing.
### Bind Effort:
This parameter specifies the effort that the Vivado HLS compiler will make to share resources, “low” means larger design generated, “high” smaller design generated.
### Scheduling Effort:
“Low” will generate slower hardware design, “High” will generate faster hardware design.
# hls::stream Class
## Introduction
This class is an API compatible class with Xilinx provides **hls::stream** class in Vivado HLS. In the **vsi::runtime** implementation the **hls::stream** is thread safe . This document describes the **vsi::runtime** implementation of the hls::stream class, please refer to the Section “Using HLS Streams” in the “Vivado High Level Synthesis : User Guide (UG902)” for details on the hardware implementation of this class. Care has been taken to match the hardware behavior.
## Class instance.
The hls::stream is a template class and requires a “type” to be instantiated. The data in the hls::stream class can only be accessed sequentially; the data is stored and retrieved using the First In First Out method. The following example shows an instance of hls::stream.
`typedef unsigned int uint;
hls::stream<uint> uistrm;`
## Public APIs.
### void hls::stream< T\>.write(T&);
Is blocking operation , it pushes a value into the stream .
`uint w_uint =32;
uistrm.write(w_uint);`

The C++ “<<” operator can also be used to write data into a stream.

`uistrm << w_uint;`
### T hls::stream< T\>.read();
Is a blocking read operation , it will wait till data is available on the stream and returns the data; in the vsi::runtime implementation the calling thread is blocked from execution and will wait till some other thread puts data into the stream using hls::stream< T\>.write(T&); The read operation will pop the first element from the hls::stream FIFO and return to the user.

`uint r_uint = uistrm.read();`

The C++ “>>” operator can also be used to pop data from the stream FIFO.

`uistrm >> r_uint;`
### bool hls::stream< T\>.write_nb(T&);
Is a non-blocking write operation, will return “true” if the write was successful else it will return “false”.

`uint w_uint = 32;
if (uistrm.write_nb(w_uint)) {
    // write success code
} else {
    // write fail code
}`
### bool hls::stream< T\>.read_nb(T&);
Is the non-blocking version of the read, if data is available the function will update the reference in the argument with the values and return “true” , it will return false if the data is not available.
`uint r_uint;
if (uistrm.read_bd(r_uint)) {
    // read successful
} else {
    // read failed no data in the stream
}`
### bool hls::stream< T\>.full();
Return “true” if there is no more space in the stream to write data, return “false” if there is space.
### bool hls::stream< T\>.empty();
Returns “true” if the stream is empty() , this can be used in conjunction with the read() method to implement non-blocking reads.
### Examples:
#### Example 1:
The hls::stream class can used to implement dependencies between blocks in a complete system. In the following code example, the function vsi_mem_ctl reads an input array , and sends the data to an output stream (out_stream); then waits for response from the another function on the stream “resp” before continuing to execute.

`void vsi_memory_ctl(int in_arr[1024],
                    hls::stream<ap_axis_d<32> > &out_stream,
                    hls::stream<ap_axis_d<32> > &start,
                    hls::stream<ap_axis_d<32> > &resp)
{
	static int count = 0 ;
	ap_axis_d<32> e;
	int i;

	printf("%s started %d\n",__FUNCTION__,count);
	// perform operation
	for (i = 0 ; i < 1024; i++) {
		e.data = in_arr[i];
		e.last = (i == 1023);
		out_stream.write(e); // write to output stream
		if (e.last) printf("%s last detected %d\n",__FUNCTION__,i);
	}
	ap_axis_d<32> w ;
	w.data = 1;
	w.last = 1;
	// tell next function to start
	start.write(w);
	printf("%s sent start waiting for response\n",__FUNCTION__);

	// wait for response
	ap_axis_d<32> r = resp.read();
	printf("%s done %d\n",__FUNCTION__,count++);
  }`
#### Example 2:
This functions reads from two AXI streams and converts them into a single stream with different IDs.
`void stream_mux (hls::stream<ap_axis_dkt<DATA_WIDTH> > &in1,
		 hls::stream<ap_axis_dkt<DATA_WIDTH> > &in2,
		 hls::stream<ap_axis_dkt<DATA_WIDTH> > &outp)
{
	while (!in1.empty() || !in2.empty()) { // non blocking wait
		ap_axis_dkt<DATA_WIDTH> out;
		ap_axis_dkt<DATA_WIDTH> in;
		ap_uint<1> tid;
		bool set = false;
		if (!in1.empty()) {
			in = in1.read();
			tid = 0;
			set = true;
		} else if (!in2.empty()) {
			in = in2.read();
			tid = 1;
			set = true;
		}
		out.data = in.data;
		out.keep = in.keep;
		out.last = in.last;
		out.id   = tid;
		if (set) outp.write(out);
	}`

More examples can be found in the source $(VSI_INSTALL)/target/common/hls_examples/stream_mux/stream_mux.cc

# vsi::device Class
## Introduction
Available from version 2017.1, this class allows blocks residing in the Software Context, to directly communicate with AXI Memory mapped devices in the Hardware Context.  The class exposes a “posix” compliant API which allows easy access to the devices .
The class would typically be used as an argument to a function, and should be connected to an AXI Memory Mapped interface in an Hardware Context. If the Argument is a **vsi::device** the Access Type must be either “Memory” or “Control”.
## Public APIs
### int vsi::device.write (void \*buff, size_t count);
Will write count bytes from buff to the device. It reqturns the number of bytes actually written to the device. Write is a blocking operation.

`void write_mem(vsi::device &mem) {  
	char buff[12] = “hello world”;
      mem.write(buff,sizeof(buff));
}`
### int vsi::device.read(void \*buff, size_t count);
This is will read the number of count number of bytes from the device and place it into buff, it returns the number of bytes actually read. Read is a blocking operation.

`void read_mem(vsi::device &mem) {
     char buff[1024];
     if (mem.read(buff,sizeof(buff)) != sizeof(buff)) {
          printf(“Not Enough Data\n”);
     }
}`
### int vsi::device.pwrite(void \*buff, size_t count, size_t offset);
The function will write count number of bytes from the buff at offset specified by offset. This function is blocking and can be used to write values at a specific offset such as a register in a device. It returns the number of bytes actually written.

`void set_timer (vsi::device &t_dev) {
    unsigned int TLR = 0;
    t_dev.pwrite(&TLR,sizeof(TLR),4); // write to 0 register at offset 4
}`
### int vsi::device.pread(void \*buff,size_t count, size_t offset);
The function will read count number of bytes into buff from offset specified by *offset*. This function is blocking and can be used to read values from a register in a device. It returns the number of bytes actually read.

 `int get_timer (vsi::device &t_dev) {
    unsigned int TLR =0;
    if (t_dev.pread(&TLR,sizeof(TLR),4) != sizeof(TLR)) // read from offset 4
        printf(“ Read Failed\n”);
    return TLR;
}`
### int vsi::device.poll(int timeout);
Waits for interrupt / data to become available to read, for devices with no interrupts this function will return immediately. The timeout parameter is in milliseconds.
### int vsi::device.device_fd();
Returns the File Descriptor associated with this device. Note that the file descriptor is NOT available for devices running on a simulator context or a non-hardware context, the function call will cause an **assertion** if called for a device which is not associated with a file descriptor.
