### vsi::runtime::Log
The runtime provides a modular logging interface that can be enable when the executable is started.<sup>1</sup>

#### Function Reference
- `Log(const char *name)`: Construct the class.
	- `name`: Name is used both as part of the logging entry and as a filter when `VSI_LOG_COMPS` is used.<sup>1</sup>
- `print(LOG_LVL lvl, const char *__restrict fmt, ...)`: Print a log entry to cout.
	- `lvl`: Specify a lvl. If the level is lower than the level that environment variable VSI_LOG_LVL is set to, the method will be set to void. Valid levels are `LOG_CRIT`, `LOG_ERR`, `LOG_DBG`, `LOG_INFO` and `LOG_VERBOSE`.
	- `fmt`: Format string. Similar to printf format string.
	- `...`: Variadic parameters. Similar to printf.
- `print(LOG_LVL lvl, unsigned int opts, const char *__restrict fmt, ...)`: Print a log entry to cout.
	- `lvl`: Specify a lvl. If the level is lower than the level that environment variable VSI_LOG_LVL is set to, the method will be set to void. Valid levels are `LOG_CRIT`, `LOG_ERR`, `LOG_DBG`, `LOG_INFO` and `LOG_VERBOSE`.
	- `opts`: Used options to modify the behavior of formatting. Valid opts are `OPT_NOCOMP`, `OPT_NONEWLINE`, `OPT_SYSERR`.
		- `OPT_NOCOMP`: Don't append the component name to the log entry.
		- `OPT_NONEWLINE`: Don't append a newline to the log entry.
		- `OPT_SYSERR`: Appends the string retrieved by `strerror(errno)`.
	- `fmt`: Format string. Similar to printf format string.
	- `...`: Variadic parameters. Similar to printf.
- `print_if(bool cond, LOG_LVL lvl, const char *__restrict fmt, ...)`:
	- `cond`: Print this entry if the expression evaluate to true.
	- `lvl`: Specify a lvl. If the level is lower than the level that environment variable VSI_LOG_LVL is set to, the method will be set to void. Valid levels are `LOG_CRIT`, `LOG_ERR`, `LOG_DBG`, `LOG_INFO` and `LOG_VERBOSE`.
	- `fmt`: Format string. Similar to printf format string.
	- `...`: Variadic parameters. Similar to printf.
- `print_if(bool cond, LOG_LVL lvl, unsigned int opts, const char *__restrict fmt, ...)`:
	- `cond`: Print this entry if the expression evaluate to true.
	- `lvl`: Specify a lvl. If the level is lower than the level that environment variable VSI_LOG_LVL is set to, the method will be set to void. Valid levels are `LOG_CRIT`, `LOG_ERR`, `LOG_DBG`, `LOG_INFO` and `LOG_VERBOSE`.
	- `opts`: Used options to modify the behavior of formatting. Valid opts are `OPT_NOCOMP`, `OPT_NONEWLINE`, `OPT_SYSERR`, `OPT_EXIT`.
		- `OPT_NOCOMP`: Don't append the component name to the log entry.
		- `OPT_NONEWLINE`: Don't append a newline to the log entry.
		- `OPT_SYSERR`: Appends the string retrieved by `strerror(errno)`.
		- `OPT_EXIT`: Exit the execution in case of error.
	- `fmt`: Format string. Similar to printf format string.
	- `...`: Variadic parameters. Similar to printf.
- `char *name()`: Return the name of the component that this log is constructed for.
	- return: Name of the component.

#### Footnotes
1. [Logging](usage/logging.md)
