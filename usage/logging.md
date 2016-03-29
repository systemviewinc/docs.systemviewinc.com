# Logging
## Environment variables
* VSI_LOG_LVL
		one of the following: CRIT, ERR, DBG, INFO (case insensitive)
* VSI_LOG_COMPS
		either ALL or a list of components (case insensitive)

## Examples
* Enable logging for all components and maximum logging
		env VSI_LOG_LVL=info VSI_LOG_COMPS=all ./executable
* Enable logging for all components and error logging only
		env VSI_LOG_LVL=err VSI_LOG_COMPS=all ./executable
* Enable logging for inputs and outputs components and debug logging only
		env VSI_LOG_LVL=dbg VSI_LOG_COMPS=inputoutput ./executable
* Enable logging for tcp_server_0_1 and Trace components and info logging
		env VSI_LOG_LVL=info VSI_LOG_COMPS=tcp_server_0_1trace ./executable
