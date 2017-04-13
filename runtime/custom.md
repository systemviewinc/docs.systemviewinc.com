### vsi::runtime::Custom

Provides routines to run external functions. It is responsible for incoming and outgoing data streams and also converts it into the parameter types required by the function. Also see related IP `vsi_gen_ip`.
Usage of this class outside the runtime library is not supported. The function reference here is merely to provide information into runtime internal functionality and to better understand the generated code.


#### Utility Class: vsi::runtime::CustomCB

A wrapper class for cross language callbacks. Only has a single method `void run(Custom *cb)`.

#### Function Reference
- `void init()`: Initializes the component
- `void event()`: Callback triggered when there is data available on one of the inputs configured as trigger; alternatively, when the IP is configured to trigger on an interval.
- `void set_callback(CustomCB *cb)`
	- `cb`: pointer to a wrapped function. A non-c++ function needs to be wrapped using CustomCB before it can be passed to this function.
- `Inout *get_arg_<type>_<num>()`: Returns the inout instance attached to a parameter. Available data stream can be retrieved from using inout->stream(). Supported types are mem, ctrl and seq. The maximum number of parameters is 16 <sup>1</sup>
	- return: pointer to Inout attached to a function parameter.

#### Footnotes
1. [Inout usage reference](/runtime/inout.md)
