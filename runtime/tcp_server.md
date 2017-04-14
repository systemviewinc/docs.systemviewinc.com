### vsi::runtime::TcpServer

#### Function Reference
- void init(): Starts a statically initialized server. The port and allowed address are determined by protected member `port_no` and `allow_host`.
- ~TcpServer(): Closes all connection and shuts down the server.

#### Protected Members
- `port_no`: Port number that the server listens on.
- `allow_host`: Allows connections from this host only.
- `INPUT_ENABLE`: TCP Server's input is enabled.
- `OUTPUT_ENABLE`: TCP Server's output is enabled.
- `use_udp`: Uses UDP protocol instead of TCP.
- `server_data_in`: Represents input `Inout` attached to this server.
- `tcp_server_connection`: Represents socket that the TCP Server is listening on.
- `server_data_out`: Represents output `Inout` attached to this server.
