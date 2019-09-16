A snap's confinement level is the degree of isolation it has from your system. There are three levels of snap confinement:
- **Strict** 
   Used by the majority of snaps. Strictly confined snaps run in complete isolation, and consequently, can not access your files, network, processes or any other system resource without requesting specific access via an interface ([see below](#interfaces)).
- **Classic**
   Allows access to your system's resources in much the same way traditional packages do. To safeguard against abuse, publishing a classic snap requires [manual approval](/t/process-for-reviewing-classic-confinement-snaps/1460), and installation requires the `--classic` command line argument.
- **Devmode**
   A special mode for snap creators and developers. A *devmode* snap runs as a strictly confined snap with full access to system resources, and produces debug output to identify unspecified interfaces. Installation requires the `--devmode` command line argument. Devmode snaps cannot be released to the stable channel, do not appear in search results, and do not automatically refresh.

Strict confinement uses security features of the Linux kernel, including AppArmor, seccomp and namespaces, to prevent applications and services accessing the wider system.

You can discover the confinement mode for any snap using the `snap info --verbose` command:

```bash
$ snap info --verbose vlc
[...]
  confinement:       strict
  devmode:           false
[...]
```

To see which installed snaps are using classic confinement, look for *classic* under the *Notes* column in the output of `snap list`:

```bash
$ snap list
Name      Version   Rev   Tracking  Publisher       Notes
vlc       3.0.6     770   stable    videolan✓       -
code      0dd516dd  5     stable    vscode✓         classic
wormhole  0.11.2    112   stable    snapcrafters    -
```
<a name="interfaces"></a>

## Interfaces and confinement

Each snap's interface is carefully selected by a snap's creator to provide specific access to a resource, according to a snap's requirements. Common interfaces provide [network access](/t/the-network-interface/7880), [desktop access](/t/the-desktop-interfaces/2042) and [sound](/t/the-pulseaudio-interface/7906) for example.

An interface needs to be connected to be active, and connections are made either automatically (at install time) or manually, depending on their function. The desktop interface is connected automatically, for instance, whereas the camera interface is not. See the *Auto-connect* column in [Supported interfaces](supported-interfaces.md) table for details on whether an interface automatically connects or not.

As with classic confinement, a snap's publisher can request an *assertion* to automatically connect an otherwise non-auto-connecting interface. For example, the *guvcview* snap [requested](https://forum.snapcraft.io/t/auto-connect-request-for-the-guvcview-brlin-snap/6042) the camera interface be automatically-connected when the snap is installed.

If a snap is upgraded and includes a new assertion, the user will still need to connect the interface manually. Similarly, if an installed classic snap is upgraded to use strict confinement, its interfaces won't be automatically configured.

> ⓘ Overriding a strictly confined snap with `--classic` is not recommended. This undoes the confinement and causes unpredictable behaviour. 

You can see which interfaces are connected and disconnected with the `snap connections` command (`vlc:camera` is disconnected in the following example):

```bash
$ snap connections vlc
Interface         Plug                  Slot               Notes
camera            vlc:camera            -                  -
desktop           vlc:desktop           :desktop           -
desktop-legacy    vlc:desktop-legacy    :desktop-legacy    -
home              vlc:home              :home              -
mount-observe     vlc:mount-observe     -                  -
[...]
```

See [Interface management](interface-management.md) for further details, including how to disconnect interfaces and make manual connections.<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/snap-confinement/6233'>the forum topic</a>.