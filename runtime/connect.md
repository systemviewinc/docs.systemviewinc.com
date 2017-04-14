### vsi::runtime::Connect
A class used to store state of a connection between components.

#### Function Reference
- `Connect(const Inout& _io1,const Inout& _io2, bool _plat_intf, int _trace, bool _sys_intf)`: Constructs the class.
	- `_io1`: An `Inout` that defines one endpoint of the connection.
	- `_io2`: An `Inout` that defines one endpoint of the connection.
	- `_plat_intf`: Defines whether this connection is a platform interface.
	- `_trace`: Specifics whether trace data will be collected from this connection.
	- `_sys_interface`: Marks this connection as a system interface. A system interface is an exposed platform interface that maps platform IO to a system.
