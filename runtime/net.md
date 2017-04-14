### vsi::runtime::Net
This Utility class is used by TcpServer, TcpClient and Interconnect to provide data move over TCP.

#### Function Reference
- `Net(int socktype, unsigned short port, Log *log, const char *server_name = "localhost", std::function<void(spBuffer)> _callback = [] (spBuffer) {})`: Constructs a `Net` class.
	- `socktype`: Sets the socket type. Supported types are `SOCK_STREAM` for TCP and `SOCK_DGRAM` for UDP.
	- `port`: Sets the port. It is a shared number that can be used to listen on or to connect to, depending on which method is called afterwards.
	- `log`: A log object belonging to the parent component.
	- `server_name`: A host name. It will be resolved to an IP and used as a host to connect to if `connect()` is used and as a host to allow connection from if `listen()` is used.
- `connect()`: Attempts to connect to a server on the shared port number.
- `listen()`: Binds to the shared port and starts listening for incoming connections.
- `end()`: Disconnect from clients and/or server.
- `connected()`: Returns true if a connection is established.
