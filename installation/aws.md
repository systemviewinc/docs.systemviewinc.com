## Run Visual System Integrator on AWS EC2

### Requirements
- An active AWS account with billing and the ability to launch paid instance.
- For Graphical User Interface, a Web Browser or a VNC Client
- While we set no restrictions on the type of instance that VSI runs on, for best use experience, we recommend using an instance with 8+ virtual cores and 30GB+ of RAM.
- In order to reduce User Interface lag, a fast connection to the internet is highly desirable.

### Launching Visual System Integrator on AWS
1. Launch a VSI FPGA Developer Instance using AWS console or cli tool.<sup>1, 2</sup>
1. Once the the instance is running, connect to the instance using an ssh client <sup>3</sup>.

	NOTE: The first login will take a while due to the AWS EC2 F1 HDK Shell initialization. Please be patient. When the initialization is complete)

### Optional: Using the graphical session


1. Set the password for graphical session through VNC (hint: `vncpasswd`).
1. The machine has to be rebooted once for the graphical session to work. (hint: `sudo reboot` from the ssh client)

#### Through a Web-browser
To use VSI in graphical mode through a web browser, a local port has to be forwarded to the instance's port 80.
The following syntax with the command line ssh client forwards local port 8080 to instances port 80:

`ssh -L 8080:localhost:80 centos@<instance DNS name or IP Address>`

In case if putty is being used on windows, use the plink.exe from command line (should be in the same directory as putty.exe). Similar syntax can be used to connect to the instance:

`plink.exe -L 8080:localhost:80 centos@<instance DNS name or IP Address>`


NOTE: The local port 8080 is used as an example. If another program on your computer is using it, use an alternative port that is free.

Once the ssh client has connected, issue the command `vncpasswd` to set a password for VNC session.


Open a web browser to the following URI http://localhost:8080. The password set earlier needs to be used to authenticate.

#### Through native VNC client:

To connect using a native VNC client, the following syntax can be used:

`ssh -L 5901:localhost:5901 centos@<instance DNS name or IP Address>`

or

`plink.exe -L 5901:localhost:5901 centos@<instance DNS name or IP Address>`

Once connected, use the `localhost:5901` through your VNC Client to connect to the Graphical session. The password set earlier needs to be used to authenticate.


For walk throughs and guides, consult the [Visual System Integrator docs](https://systemviewinc.com/docs).


#### Notes on Security:
- The graphical session is tunneled through the SSH tunnel and is encrypted between your local computer and the instance.
- The graphical session password can be changed using `vncpasswd` from the ssh client.
- The VNC server listens to instance's local address only (127.0.0.1/localhost) in order to enforce encryption through a tunnel.

#### Footnotes
1. [Visual System Integrator at AWS Marketplace](https://aws.amazon.com/marketplace/pp/B071Z6QDFP)
1. [AWS: Launch an AWS EC2 instance](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/LaunchingAndUsingInstances.html)
1. [AWS: Connecting to Your Linux Instance Using SSH](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstancesLinux.html)
