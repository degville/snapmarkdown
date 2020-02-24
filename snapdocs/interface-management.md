When a snap needs to access a resource outside of its own confinement, it uses an *interface*. Interfaces enable resources from one snap to be shared with another.

Interfaces are commonly used to enable a snap to access OpenGL acceleration, sound playback or recording, your network and your $HOME directory. But which interfaces a snap requires, and *provides*, is very much dependent on the type of snap and its own requirements.

Most users don't need to worry about interfaces. Snaps are designed for strong application isolation and safe interface connections are made automatically. 

To see which interfaces a snap is using, type `snap connections <snapname>`:

```bash
$ snap connections vlc
Interface            Plug                  Slot               Notes
camera               vlc:camera            -                  - 
desktop              vlc:desktop           :desktop           -
desktop-legacy       vlc:desktop-legacy    :desktop-legacy    -
home                 vlc:home              :home              -
mount-observe        vlc:mount-observe     -                  -
mpris                -                     vlc:mpris          -
pulseaudio           vlc:pulseaudio        :pulseaudio        -
(...)
```

In the above output, you can see that VLC isn't using the `camera` interface because its slot is empty, and that the `home` interface is connected to the system `$HOME` directory (denoted by the `:home` slot name).

See [Supported interfaces](supported-interfaces.md) for a comprehensive list of interfaces supported by snap.

<a name="slots-plugs"></a>

## Slots and plugs

An interface consists of a connection between a *slot* and a *plug*. The slot is the *provider* of the interface while the plug is the *consumer*, and a slot can support multiple *plug* connections. 

![interfaces_plugs-slots|655x162](upload://4KQqeaiItyEeCJKRuOGb8uOOLQB.png)

In the output to `snap connections vlc` (see above), every interface used by VLC is listed in the first column. The *Plug* and *Slot* columns then describe how each interface is connected. For instance, the `pulseaudio` interface connects VLC's PulseAudio plug to the system's PulseAudio slot, shown as `pulseaudio       vlc:pulseaudio    :pulseaudio    -`.

You can see which other snaps are using an interface with the `interface` command:

```bash
$  snap interface pulseaudio
name:    pulseaudio
summary: allows operating as or interacting with the pulseaudio service
plugs:
  - spotify
  - vlc
slots:
  - core
```
In the above output, you can see that both VLC and Spotify snaps are connected to the *Core* PulseAudio slot. *Core* and *system* are synonymous.

<h2 id='heading--manual-connections'>Manual connections</h2>

An interface may be automatically connected when the snap is installed, or manually connected at some point after installation.

To list all currently registered interfaces for your system, along with their slots, plugs and current connections, use the `snap connections` command with no further arguments:

```bash
$ snap connections
Interface       Plug                    Slot                    Notes
home            vlc:home                :home                   -
network         vlc:network             :network                -
network         wormhole:network        :network                -
pulseaudio      vlc:pulseaudio          :pulseaudio             -
(...)
```

Interfaces provided by the system begin with the **:** (colon) symbol and are implemented by the *Core* snap, such as with *:pulseaudio* in the above output. For a slot to be visible, and connectable, its corresponding snap needs to be installed.

To view which snaps provide connectable slots and plugs, use the `snap interface <interface name>` command (not the *connections* command we used earlier):

```bash
$ snap interface pulseaudio
snap interface pulseaudio
name:    pulseaudio
summary: allows operating as or interacting with the pulseaudio service
plugs:
  - vlc
slots:
  - core
```

To make a connection, use the following syntax:

```bash
$ snap connect <snap>:<plug interface> <snap>:<slot interface>
```

A slot and a plug can only be connected if they have the same interface name. For example, to connect FFmpeg's PulseAudio plug to the system's PulseAudio slot, you'd enter the following:

```bash
$ sudo snap connect ffmpeg:pulseaudio :pulseaudio
```

To disconnect an interface, use `snap disconnect`:

```bash
$ snap disconnect <snap>:<plug interface> <snap>:<slot interface>
```

Following our previous example, you could would disconnect *ffmpeg:pulseaudio* with the following command:

```bash
$ sudo snap disconnect ffmpeg:pulseaudio :pulseaudio
```

> ⓘ  A successful connection grants any necessary permissions that may be required by the interface to function.

<!-- TODO; add link to Publishing interfaces doc --><br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/interface-management/6154'>the forum topic</a>.