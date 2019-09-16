[Snapcraft](snapcraft-overview.md), the snap-building tool, is designed to use [Multipass](https://community.ubuntu.com/t/installing-multipass-on-linux/8328) and [bases](/t/base-snaps/11198) to both simplify the build process and to confine the build environment within a virtual machine. This mostly removes the need to use Docker.

However, Docker can still be used, and is particularly useful when you're already using Docker within your build and test infrastructure. 
All you need is a working *snapcraft.yaml* (see [Creating a snap](creating-a-snap.md) for more details). 

!!! Note:
    Electron apps are built slightly differently, and do not use a
    `snapcraft.yaml` file.  [Follow this guide](/t/electron-apps/6748) to
    build a snap of an Electron app using electron-builder.

To create a snap with Docker, first make sure you have [Docker installed](https://docs.docker.com/install/). You can test that Docker is correctly set up with:
```bash
$ docker run hello-world
[...]
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
[...]
```
If you don't see the "Hello from Docker!" message, consult the [Docker documentation](https://docs.docker.com/install/linux/linux-postinstall/) for troubleshooting steps.

Next, if your `snapcraft.yaml` has no `base` entry or `base: core` defined, pull down the latest snapcraft image:

```bash
$ docker pull snapcore/snapcraft:stable
[...]
Status: Downloaded newer image for snapcore/snapcraft:stable
```

> If you are using any other base, refer to [Creating Docker images for snapcraft](/t/creating-docker-images-for-snapcraft/11739) to use as a reference to create your own docker image.

Return to the root directory of the project containing your snapcraft.yaml and run snapcraft:

```bash
$ docker run -v "$PWD":/build -w /build snapcore/snapcraft:stable snapcraft
```
These options instruct Docker to map the current directory, your project root, to the `/snapcraft_build` directory inside the container, and then start the `snapcraft` command (the final command-line argument) from this same location inside the container.


When the snap build completes successfully, you will find a `.snap` file in the current directory. You can inspect its contents to ensure it contains all of your application's assets:
```bash
$ unsquashfs -l *.snap
```




### Next steps

After creating a snap, you should upload it to the [Snap Store](https://snapcraft.io/store), from where it can reach a potential audience of millions. See [Releasing your app](releasing-your-app.md) for further details.<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/build-on-docker/4158'>the forum topic</a>.