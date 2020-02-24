

A snap is a bundle of an app and its dependencies that works without modification across many different Linux distributions. Snaps are discoverable and installable from the [Snap Store](https://snapcraft.io/store), an app store with an audience of millions.

The following sections provide a basic overview of using snaps, from their installation to their management and manipulation.

## Installing  snapd

The *snapd* daemon manages the snap environment on the local system. Its installation will include the *snap* tool for interacting with snaps. You can check both are installed by attempting to run `snap version` on the command line:

```bash
$ snap version
snap    2.36.1
snapd   2.36.1
series  16
ubuntu  18.04
kernel  4.15.0-39-generic
```

If all is well, version numbers for the main system components will be output, as shown above, albeit with potentially different versions and Linux distribution identifier.

If the _snap_ command is not found, or if the command takes a while to respond before reporting that *snapd is unavailable*, make sure [snapd is properly installed](/t/can-i-use-snaps/6735) before continuing.

> ⓘ The `"$"` above represents the command line prompt. Sample commands come after this prompt with any relevant output shown below.

## Searching for snaps

With snapd installed, snaps can be discovered, searched for, and installed  from the [Snap Store](https://snapcraft.io/store), from the [Snap Store desktop app](t/installing-the-snap-store-app/10077), and directly from the command line. For example, the following command returns a list of media players:

```bash
$ snap find "media player"
Name  Version  Developer  Notes  Summary
(...)
vlc        3.0.4     videolan✓    -      The ultimate media player.
mpv        0.26.0    casept       -      a free, open source, and cross-platform media player.  
(...)
```

The `✓` alongside *videolan* in the above output indicates that the snap publisher has been verified.

## Learning about a snap

The *snap info* command makes it easy to find more details about a specific snap. These details include what a snap does, who publishes it, the command(s) it provides and which channel versions are available for installation:

``` yaml
$ snap info vlc
name:      vlc
summary:   The ultimate media player
publisher: VideoLAN✓
contact:   https://www.videolan.org/support/
description: |
  VLC is the VideoLAN project's media player.
  (...)
snap-id: RT9mcUhVsRYrDLG8qnvGiy26NKvv6Qkd
commands:
  - vlc
channels:
  stable:    3.0.0                   (158) 197MB -
  candidate: 3.0.0                   (158) 197MB -
  beta:      3.0.0-5-g407d4ba        (160) 197MB -
  edge:      4.0.0-dev-1218-g201542f (159) 197MB 
```

## Installing a snap

Installing a snap is straightforward:

```bash
$ sudo snap install vlc
```
[Channels](channels.md) are an important snap concept. They define which release of a snap is installed and tracked for updates. The *stable* channel is used by default, but opting to install from a different channel is easily accomplished:

```bash
$ sudo snap install --channel=edge vlc
```

After installation, the channel being tracked can be changed with:

```bash
$ sudo snap switch --channel=stable vlc
```

!!! Note:
    The _sudo_ command ensures the command following it is executed as the
    _root_ administrative user.

## Running snap commands

A snap's installed applications can be found under `/snap/bin`, and subsequently, often added to _$PATH_. This makes commands directly accessible from the command line. 

For example, the command installed via the VLC snap is simply _vlc_:

```bash
$ which vlc
/snap/bin/vlc
```

If executing a command directly doesn't work, try prefixing it with the */snap/bin* path:

```bash
$ /snap/bin/vlc
```

!!! Note:
    Adding `/snap/bin` to your default _$PATH_ makes running snaps that
    don't automatically add themselves more convenient.

## Listing installed snaps

Use `snap list` to show a list of snaps installed on your system:

```bash
$ snap list
Name     Version        Rev   Tracking  Publisher   Notes
core     16-2.35.1      5419  beta      canonical✓  core
spotify  1.0.88.353     19    stable    spotify✓    -
vlc      3.0.4          555   stable    videolan✓   -
```
Some snaps, such as *core* listed above, are installed by automatically by snapd to satisfy the requirements of other snaps. 

## Refreshing an installed snap

Snaps are updated automatically. However, to manually check for updates, use the following command:

```bash
$ sudo snap refresh vlc
```
The above will check the channel being tracked by the snap. If a newer version of the snap is available, it will be downloaded and installed.

Changing the channel being tracked and refreshing the snap can be accomplished with a single command:

```bash
$ sudo snap refresh --channel=beta vlc
```

Updates are automatically installed within 6 hours of a revision being made to a tracked channel, keeping most systems up-to-date. This schedule can be tuned via configuration options.

## Versions and revisions

Versions and revisions convey different details about one specific release of a snap:

- _Version_ : the version of the software being packaged, as assigned by the developers
- _Revision_: the sequence number assigned by the store when the snap file was uploaded

The *version* is a string that was assigned to a project by its developers, according to their development practices. It tells the user what content to expect from a snap. The *revision* is an automatic number assigned by the Snap store, giving the snap it a unique identity within the channel.

Neither the version nor the revision enforce an order of release. The local system will simply attempt to install whatever snap is recommended by the publisher in the channel being tracked.


<h2 id="heading--revert">Reverting an installed snap</h2>

A snap may be reverted to a previously used revision with the `snap revert` command:

```bash
$ sudo snap revert vlc
vlc reverted to 3.0.5-1
```

This operation will revert both the snap revision and the data associated with the software. If the previously used revision of the snap is from a different channel, that snap will be installed but the channel being tracked won't change.

A snap won't automatically update to a version previously reverted from, and the output from `snap refresh` will continue to state *All snaps up to date*. A reverted snap will be automatically updated when a new and different revision is made available by the publisher.

However, explicitly adding the snap name to `snap refresh` *will* update the snap, regardless of whether the latest revision was previously reverted from or not:

```bash
$ snap list --all vlc
Name  Version  Rev  Tracking  Publisher  Notes
vlc   3.0.5-1  768  stable    videolan✓  -
vlc   3.0.6    770  stable    videolan✓  disabled
$ sudo snap refresh
All snaps up to date.
$ sudo snap refresh vlc
vlc 3.0.6 from VideoLAN✓ refreshed
```

On an [Ubuntu Core](https://www.ubuntu.com/core) system, such as Ubuntu Core 18 and Ubuntu Core 16, reverting twice will work too. This is because snapd attempts to keep three revisions of a snap: the most recently installed plus the two previous installations. On *classic* systems like Ubuntu 18.04 LTS or Ubuntu 16.04 LTS, two revisions are retained by default. This behaviour can be modified with the [refresh.retain](system-options.md#retain) system option. 

## Listing all available revisions

The following command lists all revisions available for every installed snap, and also highlights which particular revisions are disabled at the moment:

```bash
$ snap list --all
Name   Version         Rev   Tracking  Publisher   Notes
vlc    4.0.0-dev-4620  560   edge      videolan✓   disabled   
vlc    3.0.4           555   edge      videolan✓   -
```

A previously used snap that was reverted from will display *disabled* in the Notes column of the output. 

Manually keeping track of which snap revisions available is generally unnecessary. A single revision will only ever be in use at a time, and snapd will remove old revisions automatically.

## Enabling and disabling snaps

If a snaps is temporarily undesired, it can be disabled and later enabled again. This avoids having to remove and reinstall them in the system:

```bash
$ sudo snap disable vlc
vlc disabled

$ sudo snap enable vlc
vlc enabled
```

## Removing a snap

To remove a snap from your system, along with its internal user, system and configuration data, use the *remove* command:

```bash
$ sudo snap remove vlc
vlc removed
```

By default, all of a snap's revisions are also removed. To remove a specific revision, add the `--revision=<revision-number>` argument to the *remove* command.

Prior to removal (except on [Ubuntu Core](https://www.ubuntu.com/core) systems), a snap's internal user, system, and configuration data is saved as a *snapshot* (_snapd 2.39+_), and retained for 31 days. A snapshot can be used to restore the state of your snap upon reinstallation. See [Snapshots](snapshots.md) for further details.

## Where to go next

  * [Channels](channels.md)
  * [Commands and aliases](commands-and-aliases.md)
  * [Service management](service-management.md)
  * [Interface management](interface-management.md)
  * [Configuration in snaps](configuration-in-snaps.md)

<!-- work in progress
  * Changes and tasks _(work in progress)_
  * Looking inside snaps _(work in progress)_
-><br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/getting-started/3876'>the forum topic</a>.