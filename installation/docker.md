### What is Docker

Docker enables developers and IT admins to build, ship and run any application, anywhere, in a virtualized environment without the overhead of a Virtual Machine such as VMware or VirtualBox.

Docker runtime is available for Windows, Linux and MacOS.


## Visual System Integrator is now available on Docker

It is only a matter of `docker pull` and `docker run` to have a full functioning environment to run VSI.


### Prerequisite

#### Install Docker
Install docker runtime from https://docker.com

Follow the instruction until you have docker daemon running then continue with the next step.

If you already have docker installed, then you can skip this step.


#### Resize docker disk size (MacOS only -- may apply to windows as well)

Due to the base installation size, you will need a larger disk file for your docker runtime. Typically docker creates a disk file of 50GB which is insufficient for our purpose
> Warning: This will destroy the docker local image cache as well as any pending changes inside any running or stopped containers. Save your work in any running or stopped containers to a persistent volume before continuing. If you have just installed docker than this does not apply to you.

Docker ships with a qemu-img utility. We will use it to resize the image. If you have already used `docker pull` or `docker run`, be warned that we will have to recreate the disk which will destroy all images and containers.

1. Run `rm ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2` (alternatively use `mv` to move the file elsewhere if you intend to restore it later)
2. Restart docker
3. Run `/Applications/Docker.app/Contents/MacOS/qemu-img resize ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2 100G`
4. Restart docker again.
5. Once docker is running, run `docker run alpine df -h`. Verify that the `overlay` row has 99G or higher for size column.
6. Optionally, increase the RAM used by docker to 8GB or more. This will ensure a smoother experience.


#### Pull Visual System Integrator

Run `docker pull gcr.io/systemviewinc/vsi:2016.4` and wait for the download to complete.

>Warning: This will download 50GB+ of data. Make sure that you are on a fast connection.


#### Run Visual System Integrator

1. Run `docker run -dP -e 1920x1080 -v /home/{USER}/{some projects directory to map}:/projects gcr.io/systemviewinc/vsi:2016.4` (1920x1080 can be replaced with the native resolution of your display)
This will start VSI in detached mode and print a hash for the container. You will need the hash for the next step.

2. Run `docker port {hash from step 1}` and note down the port that is printed.
3. Use a VNC client to connect to VSI. (For MacOS, run `Screen Sharing` application and use `localhost:{port from step 2}`

#### Licensing

1. Open a command prompt inside the VSI container and use `ip address` to get the MAC Address.
2. Send the MAC address to us along with the licensing request.
3. Once you receive the vsi.lic.{MAC Address} file, use `docker copy vsi.lic.{MAC Address} /opt/Systemview/VSI/2016.4/` to copy the file.
4. You should now be able to run VSI and generate projects. Open a command pormp and run `vsi` to start Visual System Integrator.
