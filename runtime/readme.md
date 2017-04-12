### VSI Runtime

Visual System Integrator includes a lightweight library that provides implementation of foundation classes used by the generated code. Here we will go into details on what each class does and how is it used by the generated system.

- Runtime
	- Responsible for initialization and shutdown routines.
- Custom
	- Provides routines to run external functions. It is responsible to data streams and convert it into the parameter types required by the function. Also see related IP `vsi_gen_ip`.
- TcpServer
	- Provides a TCP interface that listens for incoming connection on a given port for the duration until the context is active. Also see related IP `tcp_server`
- TcpClient
	- Provides a TCP interface that attempts to connect to a given port. It optimistically retry if disconnected and until the context is active. Also see related IP `tcp_client`;
- Interconnect
	- Provides connection interface between contexts connected through ethernet. Also see Related IP `platform_interconnect_sw`.
- Net
	- Base class that provides TCP and UDP connectivity.
- Device
	- Base class provides connectivity between contexts connected through kernel driver interface.
- Inout
	- Base class that provides routine for data movement.
- Connect
	- Base class that defines connection parameters.
- Trace
	- Utility class that provides functionality related to VSI Trace. It is responsible for receiving trace events, compressing trace data and routing it to the main context.
- TraceDevice
	- Utility class that polls for raw trace events from contexts connected through kernel driver/shared memory interfaces.
