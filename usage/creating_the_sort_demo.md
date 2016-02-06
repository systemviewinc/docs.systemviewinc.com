# Creating the Sort Demo

* Import C/C++ code into VSI system Canvas
 (Using sort.cc which is can be found at $VSI_INSTALL/target/common/sort)
 ![sort_6 image](/img/Sort_demo_5.gif)

* Add the TCP Server software IP block to the Software Context from IP Library
 ![sort_7 image](/img/Sort_demo_6.gif)

* At this point you have a complete software project to perform sort in software
 ![sort_8 image](/img/Sort_demo_7.gif)

* Next we move the sort block from software to hardware 
 ![sort_9 image](/img/Sort_demo_8.gif)

* Generate the complete software , hardware & HLS projects
 ![sort_10 image](/img/Sort_demo_9.gif)
 
* Use HLS to convert sort function to verilog
 ![sort_11 image](/img/Sort_demo_10.gif)
