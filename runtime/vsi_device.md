### vsi::device

This provides direct access to a hardware device or software shared memory using posix compliant calls.

#### Function Reference
- `int write(const void *buff, size_t count)`: Write number of bytes to the device.
	- `buff`: Raw buffer containing the data to write.
	- `count`: Size of bytes to write. Should be equal to or smaller than the buff size.
	- return: the size of actual bytes written.
- `int read (void *buff, size_t count)`: read specified number of bytes from the vsi::device. Returns the number of bytes read.
	- `buff`: Target raw buffer.
	- `count`: size of the data to read.
	- return: the size of actual bytes read.
- `int pwrite(const void *buff, size_t count, int offset)`:
	- `buff`: Raw buffer containing the data to write.
	- `count`: Size of bytes to write. Should be equal to or smaller than the buff size.
	- `offset`: Specify the offset to write.
	- return: the size of actual bytes written.
- `int pread(void *buff, size_t count, int offset)`:
	- `buff`: Target raw buffer.
	- `count`: size of the data to read.
	- `offset`: Specify the offset to read.
	- return: the size of actual bytes read.
- `int poll(int timeout)`: Blocks until an interrupt or till timeout expires.
	- `timeout`: Timeout to wait for an interrupt.
- `int device_fd()`: Returns the underlying operating system device descriptor.
