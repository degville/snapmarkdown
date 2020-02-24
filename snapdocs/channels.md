Channels are an important snap concept. They define which release of a snap is installed and tracked for updates.

A channel consists of, and is subdivided by, tracks, risk-levels and branches:

- [Tracks](#heading--tracks) enable snap developers to publish multiple supported releases of their application under the same snap name.
- [Risk-levels](/#heading--risk-levels) represent a progressive potential trade-off between stability and new features.
- [Branches](#heading--branches) are optional and hold temporary releases intended to help with bug-fixing.

The complete channel name can be structured as three distinct parts separated by slashes:

  * `<track>/<risk>/<branch>`

The _tracking_ value for an installed snap, as shown in the output from `snap list` for example, shows which channel is installed and is being followed.

<h2 id='heading--tracks'>Tracks</h2>

All snaps must have a default track, called *latest*, and when no track is specified, a snap will implicitly install from the *latest* track. The the track can also be specified explicitly:

```bash
$ snap install vlc --channel=latest/edge
```
Developers can optionally choose whether to supplement the default _latest_ track with additional tracks.

Microsoft's [Skype snap](https://snapcraft.io/skype) is a good example of how tracks can be used. It contains two tracks, the default _latest_ track for the majority of users and an  _insider_ track for Microsoft's QA team and users interested in testing the latest Skype developments ahead of a stable release.

Equally, a track could also be used to track minor updates (2.0.1, 2.0.2), major updates (2.1, 2.2), or releases held for long-term support (3.2, 4.1).

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

In the above output, the [Skype](https://snapcraft.io/skype) snap includes the aforementioned *insider* track. You can also see which tracks a snap support by clicking *Other versions* from its online Store entry.

To install Skype from its _insider_ track, for example, you'd use the following command:

```bash
$ snap install skype --channel=insider/stable
```

A user who already has Skype installed can switch channel with the snap refresh command:-

```bash
$ snap refresh skype --channel=insider/stable
```

Alternatively if using GNOME Software, select the ‘stable’ channel in the store page for Skype, and select a channel to switch to.

Developers must currently make a request for tracks to be added to their snap via the [#store-requests](https://forum.snapcraft.io/c/store-requests) forum category. Releases are verified and checked to ensure that reasonable user expectations are being  met. For example, only _3.2.*_ versions are accepted into a _3.2_ track.

<h2 id='heading--risk-levels'>Risk-levels</h2>

There are four risk-levels: stable, candidate, beta and edge.  Installing from a less stable risk-level will typically mean more frequent updates.

The risk-levels have the following meaning:

- **stable**:  for the vast majority of users running on production environments.

    Releases at this risk level are as stable as they will ever get, according to the project's standards. Important software will only reach this stage once it’s ready for production use and may be used in products. There is an implied promise to avoid any changes that would disrupt those usages.

- **candidate**: for users who need to test updates prior to stable deployment, or those verifying whether a specific issue has been resolved.

    Releases in candidate are considered almost ready for going into stable, but need some additional real world experimentation before they move forward. Software reaching this stage will typically have passed all available QA and review processes, since users following it expect a high stability level. Should almost never break.

- **beta**: for users wanting to test the latest features, typically outside of a production environment.

   Beta is the first level towards the stabilisation of what was before a fast moving stream of changes. Specific projects may have slightly different terminology for such releases (alpha, beta, etc) but all of these are welcome on this risk level. These releases will almost certainly have passed some sort of review and QA, but may still have unfinished parts. Breaking changes are still relatively common here.

- **edge**:  for users wanting to closely track development.

    Edge releases often include a moving stream of changes without QA or review promises and are typically built automatically by a CI process from an arbitrary source code snapshot. Often the CI will only publish after some sort of automatic QA passed, and code reviews remain a good practice, but these are project specific. Assume edge releases may break often.

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

<h2 id='heading--branches'>Branches</h2>

A branch is an optional finer subdivision of a channel for a published snap that allows for the creation of a short-lived sequences of snaps that can be pushed on demand by snap developers to help with fixes or temporary experimentation.

Branch names convey their purpose, such as `fix-for-bug123`, but the name isn't exposed in the normal way, such as with `snap info`. Instead, they can be tracked by anyone simply knowing the name.

After 30 days with no further updates, a branch will be closed automatically. The replacement snap will then be chosen as it would be with closed channels (see below). For example, *beta/fix-for-bug123* will fallback to *beta* after the *fix-for-bug123* branch is closed.

## Closing channels

A channel can be closed by a snap publisher when there is no longer a snap that fits a channel's original purpose or specification. 

For example, when a specific risk-level channel is closed, the snap store will select a snap from a more conservative risk-level of the same track. If the original channel is re-opened, snaps will once again be selected from the original channel.

This approach is commonly used for beta testing. If a snap is following a beta channel that's then closed, the store will offer the snap from the candidate channel. If candidate isn't available, the snap from *stable* will be selected. If the beta channel re-opens, the snap will once again be selected from beta.<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/channels/551'>the forum topic</a>.