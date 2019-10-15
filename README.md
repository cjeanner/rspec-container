# rspec-container

## Requirements

- docker
- docker-compose

## Usages

Start your env:

```sh
$ docker-compose up
```

It will mount the following volumes (paths and files) into your container:

- `~/work` 
- `~/.vimrc` 
- `~/.gitconfig`

You can mount your own volumes by editing the `docker-compose.yaml`
file and put your volume in the `volumes` section.

Now you can jump into your container:

```sh
$ docker exec -it rspec-container_rspec_1 /bin/bash
```

### rspec puppet openstack's projects

You can use this environment to run your puppet
tests ([`rspec`](https://rspec-puppet.com/)).

In this recipe we will describe to you how to run tests from
[openstack/puppet-cinder](https://github.com/openstack/puppet-cinder) project.

If you don't already have cloned this project then clone it in your env
by using git:

```sh
$ cd ~
$ git clone https://github.com/openstack/puppet-cinder
$ cd puppet-cinder
```

Now setup your bundle environment to execute your tests:

```sh
$ bundle install
$ # be sure to add binaries to your env
$ export PATH=$PATH:$HOME/bin:/var/lib/gems/1.8/bin
$ bundle exec rake rspec
```

The previous command execute the tests available in
the `puppet-cinder` project.

If everything is ok you will see a message who looks like to something like:

```
Finished in 1 minute 51.47 seconds (files took 2 minutes 4.5 seconds to load)
1050 examples, 0 failures 
```

This example show you how to test your developments and your new tests on
similar projects.
