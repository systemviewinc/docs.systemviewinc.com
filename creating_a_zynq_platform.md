# Creating a Zynq Platform

* Create New project , using a Zynq Board of your choice.
* Point IP catalog to VSI repository
    * set_property ip_repo_paths $::env(VSI_INSTALL)/host/data [current_project ]
    * update_ip_catalog
* source $::env(VSI_INSTALL)/host/tcl/vsi_create_zynq_platform.tcl
* This will create a platform Canvas with Zynq
* Compile this platform using TCL command
          * vsi_compile_platform
* Create a System Canvas using TCL command
          * create_bd_design system
* Import compiled platform into System Canvas
          * vsi_import_platform
