## hls::stream and hls::stream_buffer
This provides a hls::stream compatible implementation.

When used with C/C++, the code is synthesizable to FPGA.

### Function Reference

{% method %}
#### `stream_buffer::stream_buffer()`
construct a stream_buffer.
{% sample lang="C/C++" %}
##### C/C++
{% sample lang="Python" %}
##### Python
{% endmethod %}

{% method %}
#### `read(void *out, size_t size)`
read specified number of bytes from the stream_buffer. If the size provided is lesser than the size of first chunk, then only the specified number of bytes are read and truncated from the chunk. If the size of larger than the available chunk then the chunk is popped off and is returned as it is. The returned size is guaranteed to be less or equal to the requested size.
###### Parameters
- `out`: Target raw buffer.
- `size`: size of the data to read.
- return: the size of actual bytes read.
{% sample lang="C/C++" %}
##### C/C++
{% sample lang="Python" %}
##### Python
{% endmethod %}

{% method %}
#### `length()`
Return the size of the all the data available in the stream pipeline.
###### Parameters
- return: The total bytes of data that can be read. Note that these might be divided between multiple chunks and may requite multiple reads.
{% sample lang="C/C++" %}
##### C/C++
{% sample lang="Python" %}
##### Python
{% endmethod %}

{% method %}
#### `read(Buffer buf)`
Pop off the first chunk of data from the stream and return it.
###### Parameters
- `Buffer`: A buffer element is returned. The element is automatically freed once it is no longer in use or the function/scope exits.
{% sample lang="C/C++" %}
##### C/C++
{% sample lang="Python" %}
##### Python
{% endmethod %}
