# Run container with podman

## Build the container
```Bash
podman build --build-arg uid=${UID} --build-arg usr=${USER} -t rspec .
```

## Run the container
```Bash
podman run run --rm -ti --hostname rspec \
  --volume ${HOME}/work:/home/${USER}/work:rw \
  --volume ${HOME}/.vimrc:/home/${USER}/.vimrc:ro \
  --volume ${HOME}/.gitconfig:/home/${USER}/.gitconfig:ro \
  --security-opt label=disable \
  --privileged \
  localhost/rspec:latest bash
```
Notes:
  * --privileged seems to be mandatory due to some selinux/system restrictions
  * label=disable option allows to avoid some other SELinux issues

You can create a script with the run command in order to make it easier/faster.
