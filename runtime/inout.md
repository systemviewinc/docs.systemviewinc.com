### vsi::runtime::Inout
This is a utility class that serves as a binding between runtime components. It is responsible for moving data in/out and to provide handles to device and memory.


#### Function Reference
- `Inout(INOUT_TYPE type)`: Constructs an inout. The newly constructed inout is set as an input, an output or an inout.
	- `type`: The type of the newly constructed inout. Valid types are INPUT, OUTPUT and INOUT.
- `Inout(INOUT_TYPE t, const char *name)`: Alternative constructor that takes a name as a parameter. Used when the parent component is on PL's side.
	- `type`: The type of the newly constructed inout. Valid types are INPUT, OUTPUT and INOUT.
	- `name`: The name of the logical component that this inout represents.
- `void init(Log *log)`: Initializes the inout. Once initialized, the inout can be written to and/or read from depending on the configuration.
	- `log`: The logger component to use. An inout is typically attached to a component and shares an instance of the logger component.
- `void init(Log *_log, std::function<void(spBuffer)> _write_data)`: Alternative initialization that allows to pass a function definition. Used by the components when initializing the `Inout` as a type `input` or `inout` in order to process the incoming data.
	- `log`: The logger component to use. An inout is typically attached to a component and shares an instance of the logger component.
	- `_write_data`: A function definition passed that will be called each time data is written to the `Inout`. The data pointer is passed as a spBuffer (`std::shared_ptr<Buffer>`<sup>1</sup>)
- `void read_connection(spBuffer buf)`: Read a chunk of data from the opposite endpoint of the attached connection.<sup>2</sup>
	- `buf`: Buffer pointing to the data.<sup>1</sup>
- `void write_connection(spBuffer buf)`: Write a chunk of data to the opposite endpoint of the attached connection.<sup>2</sup>
	- `buf`: Buffer pointing to the data.<sup>1</sup>
- `void attach(class Connect *conn)`: Attached this `Inout` to a connection.<sup>2</sup>
	- `conn`: A connection class that this inout will attach itself to.<sup>2</sup>
- `const char *name()`: Return the name of the logical component that this `inout` is attached with.
	- return: A constant pointer to the name of the component.
- `void set_device(const char *device_name)`: Takes a device path as a parameter, opening it and attaching itself to it. If the `Inout` is set as `INPUT` then the device is treated as a write only. Conversely, if the `Inout` is set as `OUTPUT`, the device is set as read only. If the `Inout` is set as `INOUT`, both read and write is available. In case of `OUTPUT` or `INOUT`, the device will be polled for data.<sup>3</sup>
	- `device_name`: The device path to use. Needs to be a valid device created with mknod.
- `void set_device_rpc(const char *host_name, int m)`: Binds to a host a an RPC client. The behavior is similar to set_device except that the connection is made over the network.
	- `host_name`: The hostname or IP address of the RPC server.
	- `m`: A unique number that is used to demux the RPC data belonging to a device.
- `void read_data(spBuffer buf)`: Attempts to read a chunk of data from the attached device. Not valid if the attached component is not a device.<sup>3</sup>
	- `buf`: A Buffer pointer contains the data or null if no data was available.<sup>1</sup>
- `hls::stream_base *stream()`: Returns a `hls::stream_buffer` pointer. The stream buffer can be written and read from, depending on how the `Inout` was configured.
	- return: Pointer to a `hls::stream_buffer`.
- `void init_device()`: Initializes an attached device. This is an alternative to `init()` and only works if `set_device` or `set_device_rpc` was called beforehand.
- `void set_address(int64_t _ba, unsigned int _r)`: Wrapper function that takes device specific parameters as part of device setup process. The parameters as not kept and are passed directly to the attached `Device`.<sup>3</sup>
	- `_ba`: Base address for the device
	- `_r`: Read size for the device.
- `void set_control_address(int64_t _ba, unsigned int _r, int _sp)`: Wrapper function that takes device specific parameters as part of device setup process. The parameters as not kept and are passed directly to the attached `Device`.<sup>3</sup>
	- `_ba`: Base address for the device control block.
	- `_r`: Maximum read size for the device control block.
- `void set_interrupt(unsigned int interrupt_number)`: Wrapper function that takes device specific parameters as part of device setup process. The parameters as not kept and are passed directly to the attached `Device`.<sup>3</sup>
	- `interrupt_number`: Interrupt number bound to the device descriptor.
- `void set_device_size(unsigned int _size)`: Wrapper function that takes device specific parameters as part of device setup process. The parameters as not kept and are passed directly to the attached `Device`.<sup>3</sup>
	- `_size`: Read size for the device. This is the same as the `_r` parameter in `set_address`.
- `int poll(int timeout)`: Wrapper function that takes device specific parameters as part of device setup process. The parameters as not kept and are passed directly to the attached `Device`.<sup>3</sup>
	- `timeout`: How long before the poll timesout.
- `int poll_connection(int timeout)`: Wrapper function that takes device specific parameters as part of device setup process. The parameters as not kept and are passed directly to the attached `Device` at the opposite endpoint of the connection.<sup>3</sup>
	- `timeout`: How long before the poll timesout.
- `int device_fd()`: Wrapper function that takes device specific parameters as part of device setup process. The parameters as not kept and are passed directly to the attached `Device`.<sup>3</sup>
	- return: returns the underlying device descriptor number.
- `int device_fd_connection()`: Wrapper function that takes device specific parameters as part of device setup process. The parameters as not kept and are passed directly to the attached `Device` at the opposite endpoint of the connection.<sup>3</sup>
	- return: returns the underlying device descriptor number.
- `INOUT_TYPE type() {return _type;`: Returns the type of the connection earlier set while `Inout` was constructed.


#### Footnotes
1. [Buffer reference](/runtime/buffer.md)
1. [Connect reference](/runtime/connect.md)
1. [Device reference](/runtime/device.md)
