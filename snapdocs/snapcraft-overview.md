[Snapcraft](https://snapcraft.io/snapcraft) is a powerful and easy to use command line tool for building [snaps](getting-started.md). It helps you to:
- build and then publish your snaps on the [Snap store](https://snapcraft.io/store)
- use [channels, tracks and branches](channels.md) to finely control updates and releases
- build and debug snaps within a confined environment
- update and iterate over new builds without rebuilding the environment
- test and share your snaps locally

On Linux distributions [with snap support](/t/installing-snapd/6735), the easiest way to install *snapcraft* is via its snap:

```bash
$ sudo snap install snapcraft --classic
```
The `--classic` argument is required because snapcraft uses [classic confinement](snap-confinement.md).

Snapcraft can also be installed and run on Apple's macOS. See [Install snapcraft on macOS](/t/install-snapcraft-on-macos/9607) for details.

See below for a general overview of Snapcraft's capabilities, and see [Creating a snap](creating-a-snap.md) for a more detailed look at the process, alongside a selection of self-contained examples for some popular languages and frameworks, including [Go](/t/go-applications/7818), [Python](/t/python-apps/6741) and [C/C++](/t/c-c-applications/7817).

## Working with snapcraft

At the heart of the snapcraft build process is a file called [snapcraft.yaml](the-snapcraft-format.md). This file describes a snap's build dependencies and run-time requirements, it integrates remote repositories and extensions, and runs custom scripts and hooks for better integration with CI systems.

[Snapcraft 3.0](/t/snapcraft-release-notes/10721), and later releases, are designed to use *bases* (see [Base snaps](/t/base-snaps/11198)) and [Multipass](https://multipass.run/) to both simplify the build process and to to confine the build environment within a virtual machine. Confining the build in this way isolates potentially conflicting libraries and other files from your host system, and vice-versa.

Alternatively, if it better suits your processes, building directly on your system, or with either [LXD](build-on-lxd.md) or [Docker](build-on-docker.md), is also supported.

## Creating snapcraft.yaml

To get started, run `snapcraft init`. This creates a buildable snapcraft.yaml template within a snap sub-directory relative to your current filesystem location. If the command cannot be found, make sure `/snap/bin` is on your PATH.

The typical snap build process centres on iterating over the configuration of  *parts*, *plugins* and *interfaces* within this snapcraft.yaml file:

- **parts** are the raw building blocks of a snap, used to collect and build binaries and their dependencies.
- **[plugins](snapcraft-plugins.md)** are used within parts to better integrate projects using languages and framework.
- **[interfaces](interface-management.md)** enable resources from one snap to be shared with another, and with the host system.

The following lists how you might want to approach building a new snap for your application with [snapcraft.yaml](the-snapcraft-format.md):
 1. describe your application with [top-level metadata](/t/snapcraft-top-level-metadata/8334)
 1. use [parts metadata](/t/snapcraft-parts-metadata/8336) to import and build your application and its dependencies
    -  incorporate *plugins* within parts to easily integrate applications using specific languages and frameworks, or work with binary files directly. You can also [write your own](/t/writing-local-plugins/5125) plugin.
    - use [plugin metadata](supported-plugins.md) to locate your project, or sync with a remote repository
    - set build dependencies, if required, and any run-time dependencies
 1. add [interface metadata](/t/snapcraft-app-and-service-metadata/8335) to connect external system resources to your application

## Building your snap

When you are ready to test the contents of snapcraft.yaml, simply run `snapcraft --debug` in the same directory where you initialised the snap,

The `--debug` argument isn't necessary, but it helps hugely when testing a new snapcraft.yaml. 

With `--debug`, if snapcraft encounters an error it will automatically open a shell *within* your snap's virtual environment. You can then explore the build issue directly, working on your project within the *parts* directory, or the files being staged within *prime*, depending on the build stage when the error occurred.

Critically, you can update snapcraft.yaml *outside* of the build environment and run `snapcraft` *within* the build environment to incorporate any external changes and continue with the build. If there are no further errors, your snap will be built.

>  ⓘ  See [Debugging building snaps](/t/debugging-building-snaps/6274) for common problems and their solutions.

To see snapcraft build the template created by *snapcraft init*, simply run `snapcraft --debug`:

```bash
$ snapcraft --debug
Launching a VM.
Launched: snapcraft-my-snap-name [...]
Pulling my-part
Building my-part
Staging my-part
Priming my-part
Snapping 'my-snap-name' |
Snapped my-snap-name_0.1_amd64.snap
```
If you don't have Multipass installed, *snapcraft* will first prompt for its automatic installation via a snap.

The build process will proceed through the [Snapcraft lifecycle](/t/snapcraft-lifecycle/5123), installing and building your project's dependencies, as described by your snapcraft.yaml. The time this takes will depend on the complexity of your project and the capabilities of your system.

After a snap has been built, it can be installed locally with the `--dangerous` and `--devmode` flags, enabling your unsigned and unconfined snap to be installed:

```bash
$ sudo snap install my-snap-name_0.1_amd64.snap --dangerous --devmode
my-snap-name 0.1 installed
```
For a more comprehensive and iterative break-down of the snap building process, see [Creating a snap](creating-a-snap.md).

> :information_source: To see what new in each release of Snapcraft, take a look at [Snapcraft release notes](/t/snapcraft-release-notes/10721).<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/snapcraft-overview/8940'>the forum topic</a>.