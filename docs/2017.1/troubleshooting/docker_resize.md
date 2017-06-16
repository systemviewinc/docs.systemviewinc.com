
#### Resize docker disk size (MacOS only)

Due to the base installation size, you will need a larger disk file for your docker runtime. Typically docker creates a disk file of 50GB which is insufficient for our purpose
> Warning: This will destroy the docker local image cache as well as any pending changes inside any running or stopped containers. Save your work in any running or stopped containers to a persistent volume before continuing. If you have just installed docker than this does not apply to you.

```
$ cd ~/Library/Containers/com.docker.docker/Data/database/

$ git reset --hard
HEAD is now at c435935 Settings Changed 09 Jan 17 20:28 +0000

$ cat com.docker.driver.amd64-linux/disk/size
65536

# number is in MiB so 150G should be 153600:
$ echo 153600 > com.docker.driver.amd64-linux/disk/size

$ git add com.docker.driver.amd64-linux/disk/size

$ git commit -s -m 'New target disk size'

$ rm ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
```

Docker ships with a qemu-img utility. We will use it to resize the image. If you have already used `docker pull` or `docker run`, be warned that we will have to recreate the disk which will destroy all images and containers.

1. Run `rm ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2` (alternatively use `mv` to move the file elsewhere if you intend to restore it later)
2. Restart docker
3. Run `/Applications/Docker.app/Contents/MacOS/qemu-img resize ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2 100G`
4. Restart docker again.
5. Once docker is running, run `docker run alpine df -h`. Verify that the `overlay` row has 99G or higher for size column.
6. Optionally, increase the RAM used by docker to 8GB or more. This will ensure a smoother experience.
