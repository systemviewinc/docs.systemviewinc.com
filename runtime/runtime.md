### vsi::runtime::Runtime

Runtime class is responsible for initialization and shutdown routines. It is a singleton class and cannot be created or initialized using `new`. To call any of the members, always use vsi::runtime::Runtime::Get() to get the singleton instance.

#### Function Reference
- `vsi::runtime::Runtime::Get()`: Returns the singleton instance.
	- return: the singleton instance of Runtime. It creates the singleton instance if it didn't previously exist.
- `void init(const char* name, unsigned int flags)`: Initializes the Runtime Library and starts executing.
	- `name`: name of the context. Used for logging and trace.
	- `flags`: a list of flags that control the behavior of the runtime. Supported flags are `RUNTIME_MAIN | RUNTIME_NONBLOCKING`
		- `RUNTIME_MAIN`: Sets this context as main context. This behavior ensures that all the trace data is channelled to this context and can be collected by connecting to this context.
		- `RUNTIME_NONBLOCKING`: Modifies the behavior of this function to be nonblocking and not block the thread that called it. Useful for integration with thirdparty libraries or when VSI is generating part of the system, with other part being handwritten and main thread is performing other tasks.
		- `RUNTIME_NONE`: Default flag indicating that no flags are provided. Omitting the parameter altogether has the same affect.
	- `return`: void
- `void wait_ready()`: Utility function that blocks until runtime has initialized. Calling this at the beginning of a new thread ensures that it doesn't attempt to use a runtime resource that has not been initialized yet.
- `const char *ctx_name()`: Returns the name set by init()
	- `return`: name set by init()
- `void shutdown()`: Signal the Runtime to close down owned resources, close device descriptors and stop threads.
