## Remote Hardware Build

#### Launching Hardware Builds on Remote Linux Hosts

VSI supports simultaneous remote hardware builds on multiple Linux hosts.

#### Prerequisites

**On the remote host:**
- VSI installation is assumed to be available from the login shell
- The mailutils package needs to be installed to enable sending email after each job is done.

**On the local host:**
- Configure SSH so that the host does not require a password each time you launch a remote run.  
	- Copy the public key to remote-host using:  ``` ssh-copy-id -i ~/.ssh/id_rsa.pub <remote-host_name> ```
- Install expect
	- On Ubuntu ` apt install expect `

 
#### Launch Build
To launch a build, simply add the hostname and the email address to the vsi_build_hardware command as follow:
``` vsi_build_hardware {<system_name>} {<remote_host_name>} {<user@example.com>} ```
				
When the remote build is completed or failed, an email will be sent to the email address. 
If the build was successful, the email contains the bitstream file and the location of it at the remote host.
			

