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

#### Python Wrapper Specific notes and code snippets:

Since python has no `void*` type, in order to use read, write, pread and pwrite from Python, the pointer and size needs to be wrapped into a VsiDevice type.

A typical example of it is as following:

```
def process_device(dev):
    global COUNT, OFFSET
    COUNT += 1
    buf_in = vsi_runtime.Buffer(256)
    buf_out = vsi_runtime.Buffer(256)
    buf_in.fill("abcd0123")
    dev.pwrite(buf_in, OFFSET)
    dev.pread(buf_out, OFFSET)
    if  (COUNT % 20) == 0:
        print 'Matched:{}, COUNT:{}, OFFSET:{}'.format(buf_in.compare(buf_out), COUNT, OFFSET)
    OFFSET += 1

```

When reading from a file, the alternative method of Buffer can be used to reuse the same memory:


```
def process_device_file(dev):
    global COUNT, OFFSET, file_name
    create_file(file_name)
    buf_in = vsi_runtime.Buffer(256)
    buf_out = vsi_runtime.Buffer(256)
    file_size = os.stat(file_name).st_size
    f = open(file_name, "rb")
    try:
        buf_in.set(f.read(256))
        while file_size > (256 * COUNT):
            dev.pwrite(buf_in, OFFSET)
            dev.pread(buf_out, OFFSET)
            # if  (COUNT % 10) == 0:
            print 'Matched:{}, COUNT:{}, OFFSET:{}'.format(buf_in.compare(buf_out), COUNT, OFFSET)
            OFFSET += 1
            COUNT += 1
            buf_in.set(f.read(256))
    finally:
        f.close()
```
