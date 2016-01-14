# Creating the Sort Example Project

* The Sytemview environment supports three types of "code" blocks. 
    * a) Software Only blocks can be placed in Software execution contexts only
    * b) Hardware Only blocks can be placed in Hardware execution contexts only
    * c) "Soft-IP" blocks which are implemented using synthesizable C/C++ code and therefore can used in both "Software" & "Hardware" contexts .

* We begin by adding a "Software" only block to the ARM context
  * Double click the "ARM" context to go into the hierarchy
    * right-Click to "Add IP ..." choose tcp_server..
    ![](Screen Shot 2016-01-13 at 11.28.41 PM.png)
    * Next we import the "sort" code developed in C into the software context (ARM)
  * Once again double click the "ARM" context and add IP "vsi_gen_ip"
    * 




