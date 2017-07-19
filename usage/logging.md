# Logging and printf

VSI runtime has a modular logging system which can be turned on using the following environment variables

#### Environment variables
* VSI_LOG_LVL
		can be one of the following: CRIT, ERR, DBG, INFO (case insensitive)
* VSI_LOG_COMPS
		can be either ALL or a list of components (case insensitive)

#### Examples
* Enable logging for all components and maximum logging
		env VSI_LOG_LVL=info VSI_LOG_COMPS=all ./executable
* Enable logging for all components and error logging only
		env VSI_LOG_LVL=err VSI_LOG_COMPS=all ./executable
* Enable logging for inputs and outputs components and debug logging only
		env VSI_LOG_LVL=dbg VSI_LOG_COMPS=inputoutput ./executable
* Enable logging for tcp_server_0_1 and Trace components and info logging
		env VSI_LOG_LVL=info VSI_LOG_COMPS=tcp_server_0_1trace ./executable

## printf and puts

Often, printf and puts is used to debug C/C++ functions. In a multithreaded application with parallels paths, especially when debugging timing issues and parallel execution paradigms, it can become challenging to figure out which thread is printing.

VSI Runtime adds a helper template to printf and puts. `{{tid}}` inside the formatting argument will be replaced by a unique ID for the current thread. For example,

```
printf("write to memory {{{tid}}}");
```

will be printed as

```
write to memory {12AE}
write to memory {A92F}
```

where 12AE and A92F are unique ids for two threads accessing the same function.
