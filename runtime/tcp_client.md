### vsi::runtime::TcpClient

#### Function Reference
- void init(): Starts a statically initialized TCP client. The port and host address are determined by protected member `port_no` and `Host`.
- ~TcpClient(): Closes all connection and shuts down the client.

#### Protected Members
- `port_no`: Port number that the client listens on.
- `Host`: Attempt to connect to this host name or address. Host names are resolved using OS Apis.
- `INPUT_ENABLE`: TCP Client's input is enabled.
- `OUTPUT_ENABLE`: TCP Client's output is enabled.
- `use_udp`: Uses UDP protocol instead of TCP.
- `client_data_in`: Represents input `Inout` attached to this client.
- `client_data_out`: Represents output `Inout` attached to this client.
- `tcp_client_connection`: Represents socket interface that the TCP Client is using to connect with.
