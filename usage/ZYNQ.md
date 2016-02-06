# Creating a Zynq Platform

* Create New project , using a Zynq Board of your choice.
 ![sort_1 image](/img/Sort_demo.gif)

* Point IP catalog to VSI repository
 ![sort_2 image](/img/Sort_demo_1.gif)

* Create the predefined Zynq Platform
 ![sort_3 image](/img/Sort_demo_2.gif)
* This will create a platform Canvas with Zynq
* Compile this platform using TCL command
          * vsi_compile_platform
 ![sort_4 image](/img/Sort_demo_3.gif)

* Create a System Canvas using TCL command
          * vsi_create_system system
* Import compiled platform into System Canvas
          * vsi_import_platform
 ![sort_5 image](/img/Sort_demo_4.gif)

* After importing the platform the System canvas should have two execution contexts
* ARM - is the software execution context & Zynq is the Hardware execution context
