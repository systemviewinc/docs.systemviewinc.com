# Creating the Sort Demo

* Import C/C++ code into VSI system Canvas
 (Using sort.cc which is can be found at $VSI_INSTALL/target/common/sort)
 <img src="/img/sort_demo_5.gif" alt="sort_6 image" width="100%">

* Add the TCP Server software IP block to the Software Context from IP Library
 <img src="/img/sort_demo_6.gif" alt="sort_7 image" width="100%">

* At this point you have a complete software project to perform sort in software
     * Flow --> Generate System ...
 <img src="/img/sort_demo_7.gif" alt="sort_8 image" width="100%">

* Next we move the sort block from software to hardware
 <img src="/img/sort_demo_8.gif" alt="sort_9 image" width="100%">

* Add Trace to interfaces of interest
     * Right Click "Toggle Trace.."
 <img src="/img/sort_demo_8b.gif" alt="sort_9b image" width="100%">

* Generate the complete software , hardware & HLS projects
     * Flow --> Generate System ...
 <img src="/img/sort_demo_9.gif" alt="sort_10 image" width="100%">

* Use HLS to convert sort function to verilog
 <img src="/img/sort_demo_10.gif" alt="sort_11 image" width="100%">

* Compile Software Project created for Zynq_PS
 <img src="/img/sort_demo_11.gif" alt="sort_11 image" width="100%">
