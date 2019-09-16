[Snapcraft 3](https://github.com/snapcore/snapcraft/releases/tag/3.0), the snap-building tool, is designed to use a combination of [Multipass](https://community.ubuntu.com/t/installing-multipass-on-linux/8328) and *bases* to both simplify the build process and to confine the build environment within a virtual machine. This mostly removes the need to use  [LXD](https://linuxcontainers.org/lxd/introduction/).

> ⓘ  See [Snapcraft overview](snapcraft-overview.md) for details on both Multipass and bases

However, it's still possible to use LXD if you'd prefer.

- If you are using *bases* and [Snapcraft version 3.4+](/t/release-notes-snapcraft-3-4/11650) you can request to use LXD with the `--use-lxd` argument:

    ```bash
    $ snapcraft --use-lxd
    ```

- If your *snapcraft.yaml* doesn't use bases, you can build snaps in LXD by setting the following environment variable:

    ```bash
    $ export SNAPCRAFT_BUILD_ENVIRONMENT=lxd
    ```
See below for help on installing LXD, manually building snaps within an LXD environment and  building without bases.

## Install LXD

Recent non-desktop versions of Ubuntu install LXD by default - you can check whether it is installed with the following command:

```bash
$ lxd version
3.13
```
The easiest way to add LXD to your system is via its *snap*:

```bash
$ sudo snap install lxd
```

Now initialise LXD with the following command, accepting all the default options unless you have specific requirements:

```bash
$ sudo lxd init
```

> ⓘ  If the system you are installing LXD onto is using a network with a `10.x.x.x` subnet then network create may fail. Step through the following to resolve this.

[details=Manually create a network on a 10.x.x.x subnet]

If you try to run `lxd init` on a system that is connected to a network with a `10.x.x.x` subnet, then the final step of the Iinit* may fail with the following error:

```no-highlight
Error: Failed to create network 'lxdbr0': Failed to automatically find an unused IPv4 subnet, manual configuration required
```

To resolve this issue, you must manually create the network with the following command:

 ```bash
$ sudo lxc network create lxdbr0 ipv4.address=10.0.3.1/24 ipv4.nat=true
```

You can then re-run `lxd init`. When you are prompted to create a new network bridge you must respond `no`.

```no-highlight
Would you like to create a new network bridge (yes/no) [default=yes]? no
```
[/details]

### Group permissions

If you want to build snaps as a non-root user, which is advised, then you need to add your user account to the `lxd` group:

```bash
$ sudo usermod -a -G lxd ${USER}
```
You now  need to either restart your session, reboot your computer, or use `newgrp` to acquire the new group assignment:

```bash
$ newgrp lxd
```

> ⓘ  The *newgrp* command will start a new sub-shell (shell within a shell) with the new `lxd` group assigned.

## Building with bases

Snapcraft with LXD operates in much the same way as snapcraft with a default [Multipass](https://multipass.run/) environment. However, with LXD installed and configured, you need to manually add the `--use-lxd` argument to initiate the build within LXD:

```bash
$ snapcraft --use-lxd
```

Many of the snapcraft's Multipass operations also work with LXD, including:

* `--shell`	
* `--shell-after`
* `--debug`

Similarly, snapcraft's lifecycle commands, *pull*, *build*, *stage* and *prime*, together with *clean*, can also use the `--use-lxd` option.

```bash
$ snapcraft clean --use-lxd
The LXD provider is offered as a technology preview for early adopters.
The command line interface, container names or lifecycle handling may change in upcoming releases.
```

## Building without *bases*

> ⓘ If *snapcraft* is not yet installed, enter `sudo snap install snapcraft --classic`.

First make sure the following environment variable is set:

```bash
$ export SNAPCRAFT_BUILD_ENVIRONMENT=lxd
```

To build your project using `lxd` run:

```bash
$ cd $HOME/my-snap-project
$ snapcraft
```

If the build fails, add the `--debug` option to the `snapcraft` command. This will drop you into a shell running within the LXD environment that just attempted to build your snap, allowing you to examine where the issue may be.

## Building manually

These instructions are intended to be only a general guide. For further details on using LXD as a container environment, see the [LXD Documentation](https://lxd.readthedocs.io/en/latest/).

First, create and run a new container based on Ubuntu 18.04 LTS (Bionic Beaver). Our example calls this container *mysnapcraft*:

```bash
$ lxc launch ubuntu:18.04 mysnapcraft
```

Copy your snap's *snapcraft.yaml* to this new container:

```bash
$ lxc file push snap/snapcraft.yaml mysnapcraft/home/ubuntu/
```
Now open an interactive shell within your container and install *snapcraft*:

```bash
$ lxc exec mysnapcraft -- /bin/bash 
$ snap install snapcraft --classic
```

Finally, staying within the container, start the build by running snapcraft with the `--destructive-mode` argument. This forces snapcraft to build the snap directly within the current host (the *mysnapcraft* LXC container):

```bash
$ cd /home/ubuntu
$ snapcraft --destructive-mode
```
You can troubleshoot the build process just as you would on the native machine. The container is persistent and will remain until stopped and deleted.

With the build complete, you can copy your new snap to your native environment with the following command:

```bash
$ lxc file pull mysnapcraft/home/ubuntu/mysnap.snap .
```

<!-- DEPRECATED (17/01/19)

### Experimental: persistent containers

When building with LXD, the old container is discarded. This means that LXD needs to build a new environment,  each time you build your snap. This is acceptable with small snaps, or for a final build, but can be problematic during development. 

For example, during development, you might normally use:

```bash
$ snapcraft
$ snap try prime
```

The 'try' method allows you to directly edit files in a snap's prime directory without having to re-install or re build after each change. However, when using `cleanbuild`, this feature is not supported.

But there is an experimental feature that uses LXD in a different way, allowing you to retain intermediate files, and the container:

```bash
$ export SNAPCRAFT_BUILD_ENVIRONMENT=host
$ snapcraft
```

If you get the following error:

```no-highlight
Failed to start container: the local folder could not be mounted into the container. 
```

Add a line containing `root:1000:1` to the following files:

- `/etc/subuid` 
- `/etc/subgid`
 
You may need to log out and back in again before reattempting the build. If successful, you can now *try* the snap, make changes, and rebuild quickly:

```bash
$ snap try prime
```

The environment variable `SNAPCRAFT_BUILD_ENVIRONMENT` instructs *snapcraft* to use experimental LXD integration to build the snap in a persistent LXD container. This container remains after the build has finished, and retains  intermediate build files to speed up rebuilds.

--><br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/build-on-lxd/4157'>the forum topic</a>.