### hls::stream and hls::stream_buffer
This provides a hls::stream compatible implementation that is synthesizable similar to the hls::stream provided by Vivado_hls.

#### Function Reference
- `stream_buffer::stream_buffer()`: construct a stream_buffer.
- `read(void *out, size_t size)`: read specified number of bytes from the stream_buffer. If the size provided is lesser than the size of first chunk, then only the specified number of bytes are read and truncated from the chunk. If the size of larger than the available chunk then the chunk is popped off and is returned as it is. The returned size is guaranteed to be less or equal to the requested size.
	- `out`: Target raw buffer.
	- `size`: size of the data to read.
	- return: the size of actual bytes read.
- `length()`: Return the size of the all the data available in the stream pipeline.
	- return: The total bytes of data that can be read. Note that these might be divided between multiple chunks and may requite multiple reads.
- `read()`: Pop off the first chunk of data from the stream and return it.
	- `spBuffer`: A shared pointer buffer `std::shared_ptr<Buffer>` containing the requested element is returned. It will free itself once all the references to it are out of scope.
