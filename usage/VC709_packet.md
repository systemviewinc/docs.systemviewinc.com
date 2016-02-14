# Creating a Packet Processing application using the VC709(Virtex) platform

* Import packet matching engine to the FPGA (vc709) context.
  Source found in $(VSI_INSTALL)/target/common/hls_examples/regex_packet/match/regex_exec.cc
 ![vc709_6 image](/img/vc709_regex_5.gif)

* Import Match Compiler to the Software (X86) context.
  Source found in $(VSI_INSTALL)/target/common/hls_exmples/regex_packet/compile/regex_comp.cc
 ![vc709_7 image](/img/vc709_regex_6.gif)


* Add a TCP server to Softwar (X86) Context that will feed the pattern to be compiled
  and sent the matching engine. Set the server port to 2020
 ![vc709_8 image](/img/vc709_regex_7.gif)

* Add another TCP server in X86 that will send the packets to the line and recive matched
  packets back. Set the server port to 2021
 ![vc709_9 image](/img/vc709_regex_8.gif)

* Annotate connections to be traced
 ![vc709_10 image](/img/vc709_regex_9.gif)

* Generate the complete system & hardware
 ![vc709_11 image](/img/vc709_regex_10.gif)

* Synthesize the pattern matching engine using Vivado HLS
 ![vc709_12 image](/img/vc709_regex_11.gif)

* Compile the Software project
 ![vc709_13 image](/img/vc709_regex_12.gif)

* Generate FPGA bitstream for the FPGA project
 ![vc709_14 image](/img/vc709_regex_13.gif)
