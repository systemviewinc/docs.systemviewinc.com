# Creating a Packet Processing application using the VC709(Virtex) platform

* Import packet matching engine to the FPGA (vc709) context.
  Source found in $(VSI_INSTALL)/target/common/hls_examples/regex_packet/match/regex_exec.cc
 <img src="/img/vc709_regex_5.gif" alt="vc709_6 image" width="100%">

* Import Match Compiler to the Software (X86) context.
  Source found in $(VSI_INSTALL)/target/common/hls_exmples/regex_packet/compile/regex_comp.cc
 <img src="/img/vc709_regex_6.gif" alt="vc709_7 image" width="100%">


* Add a TCP server to Softwar (X86) Context that will feed the pattern to be compiled
  and sent the matching engine. Set the server port to 2020
 <img src="/img/vc709_regex_7.gif" alt="vc709_8 image" width="100%">

* Add another TCP server in X86 that will send the packets to the line and recive matched
  packets back. Set the server port to 2021
 <img src="/img/vc709_regex_8.gif" alt="vc709_9 image" width="100%">

* Annotate connections to be traced
 <img src="/img/vc709_regex_9.gif" alt="vc709_10 image" width="100%">

* Generate the complete system & hardware
 <img src="/img/vc709_regex_10.gif" alt="vc709_11 image" width="100%">

* Synthesize the pattern matching engine using Vivado HLS
 <img src="/img/vc709_regex_11.gif" alt="vc709_12 image" width="100%">

* Compile the Software project
 <img src="/img/vc709_regex_12.gif" alt="vc709_13 image" width="100%">

* Generate FPGA bitstream for the FPGA project
 <img src="/img/vc709_regex_13.gif" alt="vc709_14 image" width="100%">
