### vsi::runtime::Interconnect
A platform only component that is used to establish connectivity between two software contexts using TCP or UDP.

#### Function Reference
- `Interconnect(const char* comp_name, const char* host_name, const int port, unsigned int flags)`: Constructs an interconnect class.
	- `comp_name`: name of the interconnect. Used for logging and trace purpose.
	- `host_name`: Host name to establish the connection with.
	- `port`: Incoming or outgoing port of the interconnect.
	- `flags`: Modify the behavior of the interconnect. Valid flags are `INTERCONNECT_MASTER` and `INTERCONNECT_DEFAULTROUTE`.
		- `INTERCONNECT_MASTER`: Sets the interconnect as a TCP server.
		- `INTERCONNECT_DEFAULTROUTE`: The interconnect will be used as a default route to route all data that has no address through itself. The primary type of such data is trace data. Functionally similar to TCP Default Gateway.
- `init()`: Starts the interconnect.
- `Inout &default_link()`: Returns the default `Inout` of the interconnect. Primarily used by Trace component.
- `Inout &link(int port)`: Add a new link to the interconnect. This starts up a new tcp server or client and attempts to connect to or listens to the host specified in the constructor.
