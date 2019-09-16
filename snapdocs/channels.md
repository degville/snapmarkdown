Channels are an important snap concept. They define which release of a snap is installed and tracked for updates.

A channel consists of three parts: risk-levels, tracks and branches.

- *Risk-levels* represent a progressive potential trade-off between stability and new features.
- *Tracks* enable snap developers to publish multiple supported releases of their application under the same snap name.
- *Branches* are optional and hold temporary releases intended to help with bug-fixing.

The complete channel name can be structured as three distinct parts separated by slashes:

  * `<track>/<risk>/<branch>`

## Risk-levels

There are four risk-levels: stable, candidate, beta and edge.  Installing from a less stable risk-level will typically mean more frequent updates.

Snaps are installed using the stable risk-level by default. For example, the following command installs VLC from its stable channel:

```bash
$ sudo snap install vlc
```

Use the `--channel` option to select a different risk-level. The following command will install the latest beta snap of VLC:

```bash
$ sudo snap install --channel=beta vlc
```

If the beta snap isn't available, the next most stable snap will be installed.

> ⓘ For convenience,  `--stable`, `--candidate`, `--beta` and `--edge` can be used instead of `--channel=<risk-level>`

After installation, the risk-level being tracked can be changed with:

```bash
$ sudo snap switch --channel=stable vlc
```

The *switch* option, used above, won't automatically refresh the snap to force the installation of a new snap. To switch channels and update the snap with a single command, add the `--channel` option to the *refresh* command:

```bash
$ sudo snap refresh --channel=stable vlc
```

To check which channel a snap is tracking, look for the *tracking* field in the output from the `snap info`:

```bash
$ snap info vlc
[...]
snap-id:      RT9mcUhVsRYrDLG8qnvGiy26NKvv6Qkd
tracking:     edge
refresh-date: yesterday at 19:54 BST
[...]
```

Risk-levels may not match a project's internal conventions. Some projects may use *alpha* instead of *edge*, for instance. However, a project's own release nomenclature should be close enough to a snap's risk-levels to allow you to judge the relative stability of the version you're installing.

<h2 id='heading--tracks'>Tracks</h2>

All snaps must have a default track called *latest*. The previous examples implicitly install from the *latest* track, but the track can also be specified explicitly:

```bash
$ snap install vlc --channel=latest/edge
```

The releases a track contains is dependent on the snaps's developer. A track could be used to track minor updates (2.0.1, 2.0.2), major updates (2.1, 2.2), or releases held for long-term support (3.2, 4.1).

Tracks are listed in the *channels* section of the output from `snap info`:

```bash
$ snap info skype
[...]
channels:                                  
  stable:            8.28.0.41  (51) 148MB classic
  candidate:         ↑                     
  beta:              ↑                     
  edge:              ↑                     
  insider/stable:    8.30.76.41 (53) 151MB classic
  insider/candidate: ↑                     
  insider/beta:      ↑                     
  insider/edge:      ↑  
[...]
```

In the above output, the [Skype](https://snapcraft.io/skype) snap includes an *insider* track to publish new builds of the application intended for its internal QA team. You can also see which tracks a snap support by clicking *Other versions* from its onlone Store entry.

Developers must currently make a request for tracks to be added to their snap via the [#store-requests](https://forum.snapcraft.io/c/store-requests) forum category. Releases are verified and checked to ensure that reasonable user expectations are being  met. For example, only _3.2.*_ versions are accepted into a _3.2_ track.

## Branches

Branches are optional. They allow the creation of a short-lived sequences of snaps that can be published on demand by snap developers to help with fixes or temporary experimentation.

Branch names convey their purpose, such as `fix-for-bug123`, but the name isn't exposed in the normal way, such as with `snap info`. Instead, they can be tracked by anyone simply knowing the name.

After 30 days with no further updates, a branch will be closed automatically. The replacement snap will then be chosen as it would be with closed channels (see below). For example, *beta/fix-for-bug123* will fallback to *beta* after the *fix-for-bug123* branch is closed.

## Closing channels

A channel can be closed by a snap publisher when there is no longer a snap that fits a channel's original purpose or specification. 

For example, when a specific risk-level channel is closed, the snap store will select a snap from a more conservative risk-level of the same track. If the original channel is re-opened, snaps will once again be selected from the original channel.

This approach is commonly used for beta testing. If a snap is following a beta channel that's then closed, the store will offer the snap from the candidate channel. If candidate isn't available, the snap from *stable* will be selected. If the beta channel re-opens, the snap will once again be selected from beta.<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/channels/551'>the forum topic</a>.