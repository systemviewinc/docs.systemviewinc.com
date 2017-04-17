### Visual System Integrator on AWS EC2

#### Requirements
- An active AWS account with billing and the ability to launch paid instance.
- To use GUI, a local installation of NoMachine Client on the local computer. ([Download here](https://www.nomachine.com))

#### Launching Visual System Integrator on AWS
Launch a VSI FPGA Developer Instance using AWS console or cli tool.<sup>1</sup>

Once the the instance is running, launch the NoMachine client and configure it to connect to the public DNS name or IP of the instance.<sup>2</sup>

NoMachine client can be configured to use the same private key that you configured when you launched the instance<sup>3</sup>.
Press connect and wait. It might take a minute or two to establish the connection. If you see a prompt asking if a new X-server should be launched, select yes.

#### Footnotes
1. On how to launch an AWS EC2 instance, [see here](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/LaunchingAndUsingInstances.html)
1. [Getting started with NoMachine](https://www.nomachine.com/getting-started-with-nomachine)
1. [SSH key based authentication using NoMachine](https://www.nomachine.com/AR02L00785)
