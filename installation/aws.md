### Run Visual System Integrator on AWS EC2

#### Requirements
- An active AWS account with billing and the ability to launch paid instance.
- For Graphical User Interface, a Web Browser or a VNC Client
- While we set no restrictions on the type of instance that VSI runs on, for best use experience, we recommend using an instance with 8+ virtual cores and 30GB+ of RAM.
- In order to reduce User Interface lag, a fast connection to the internet is highly desirable.

#### Launching Visual System Integrator on AWS
Launch a VSI FPGA Developer Instance using AWS console or cli tool.<sup>1, 2</sup>

Once the the instance is running, connect to the instance using an ssh client <sup>3</sup>.

NOTE: The first login will take a while due to the AWS EC2 F1 HDK Shell initialization. Please be patient. When the initialization is complete, the machine has to be rebooted once for the graphical session to work. (hint: `sudo reboot` from the ssh client)

To use VSI in graphical mode with a web browser, the instance's port 80 has to be forwarded to a local port. Use the following syntax with the command line ssh client to do that (for putty or other SSH clients, consult it's user manual):

`ssh -L 8080:localhost:80 centos@<instance DNS name or IP Address>`

NOTE: Ensure that the local port 8080 is not being used by another. If it is, then replace 8080 with 8081 or any other free port.

Once the ssh client has connected, open a web browser to the following URI http://localhost:8080. The default password for the VNC is `systemview`. Since the VNC session is tunneled through the SSH session, the password need not be changed. If you decide to change it, use the command `vncpasswd` from the ssh client to change it.

Similarly, to connect using a dedicated VNC client, the following syntax can be used:

`ssh -L 5901:localhost:5901 centos@<instance DNS name or IP Address>`

Once connected, use the `localhost:5901` in your VNC Client to open the Graphical session.


For walk throughs and guides, consult the [Visual System Integrator docs](https://systemviewinc.com/docs).


#### Notes on Security:
- The graphical session is tunneled through the SSH tunnel.
- The default password for the graphical session is `systemview`
- The password can be changed using `vncpasswd` from the ssh client.

#### Footnotes
1. [Visual System Integrator at AWS Marketplace](https://aws.amazon.com/marketplace/pp/B071Z6QDFP)
1. [AWS: Launch an AWS EC2 instance](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/LaunchingAndUsingInstances.html)
1. [AWS: Connecting to Your Linux Instance Using SSH](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstancesLinux.html)
