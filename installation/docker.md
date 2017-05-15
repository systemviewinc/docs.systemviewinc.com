### About Docker

Docker is a tool that can be used to package up and sandbox applications to be run at any host for which docker runtime is available. As of now, docker runtime is available for Windows, Linux and MacOS.

## Visual System Integrator + Docker

A docker container for VSI contains all the underlying dependencies required to run a VSI. It is a quicker method to test drive VSI or to programmatically install it on multiple hosts.
In order to use the VSI container, you only need run `docker run gcr.io/systemviewinc/vsi:{version_number}`.


### Requirements

- Docker: [Download here](https://docker.com)<sup>1</sup>
- MacOS only: resize preallocated docker disk size to 110GB or more. [instructions](/docker/docker_reszize)

#### Pull Visual System Integrator

Run `docker pull gcr.io/systemviewinc/vsi:{version_number}` and wait for the download to complete.
>Warning: This will download 50GB+ of data. Make sure that you are on a fast connection.


#### Docker + Visual System Integrator getting started

1. Run `docker run --privileged -dP -e 1920x1080 -v /home/{USER}/{some projects directory to map}:/projects gcr.io/systemviewinc/vsi:{version_number}`<sup>2</sup> <sup>3</sup>
An instance of VSI docker container will start in detached mode. The returned hash is the container ID.
2. Run `docker port <container ID>`. This will return port numbers.
3. Use a VNC client to connect to VSI. The connection should be made to `localhost:<port mapped to 5901>`(MacOS comes with a preinstalled VNC client `Screen Sharing`).<sup>4</sup>
4. Optional: Another mapped port to ssh is available if commandline access is desired. Use the port mapped to 22 in previous steps. `ssh localhost -p <port mapped to 22>`<sup>4</sup>

#### Licensing

1. Open a command prompt inside the VSI container and use `ip address` to get the MAC Address.
2. Use the form [here](http://systemviewinc.com/license.html) to request a license.
3. The license file, once received, can be used by `docker cp vsi.lic.<ethernet Address> <container id>:/opt/Systemview/VSI/{version_number}/`. This will copy the file to the VSI container.


#### Usage
1. Connect to the container using VNC.
3. Open a terminal and issue the command `vsi`. If the installation was successful then you should see text similar to this:
	- ` Visual System Integrator version: V2017.1_HEAD-29-gdc85abc, Compiler: "GNU - 5.4.0 20160609", Buildhost: "nanl - Linux-4.4.0-72-generic", Date: 2017-04-07T17:24:29`<br/>`loading Visual System Integrator...`
4. If you don't see similar text then see [Troubleshooting](/troubleshooting)

#Footnotes

1. Only required if docker wasn't previously installed.
1. 1920x1080 can be replaced with your native display resolution.
1. The `-v` switch can be used to map a local directory to a path inside the docker container. This can be used as the project directory or to save important user data that has to outlive the life of the docker container.
1. The password is `systemview`
1. VSI can be started without a valid license. All functionality works except the ability to generate projects.
