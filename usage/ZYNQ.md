# Creating a Zynq Platform

* Create New project , using a Zynq Board of your choice.
 <img src="/img/Sort_demo.gif" alt="sort_1 image" width="100%">

* Point IP catalog to VSI repository
 <img src="/img/Sort_demo_1.gif" alt="sort_2 image" width="100%">

* Create the predefined Zynq Platform
 <img src="/img/Sort_demo_2.gif" alt="sort_3 image" width="100%">
* This will create a platform Canvas with Zynq
* Compile this platform using TCL command
          * vsi_compile_platform
 <img src="/img/Sort_demo_3.gif" alt="sort_4 image" width="100%">

* Create a System Canvas using TCL command
          * vsi_create_system system
* Import compiled platform into System Canvas
          * vsi_import_platform
 <img src="/img/Sort_demo_4.gif" alt="sort_5 image" width="100%">

* After importing the platform the System canvas should have two execution contexts
* ARM - is the software execution context & Zynq is the Hardware execution context
