After [creating a snap](creating-a-snap.md), you should upload it to the [Snap Store](https://snapcraft.io/store), from where it can reach a potential audience of millions. 

You will need the following:
- a free Snapcraft [developer account](/t/creating-your-developer-account/6760) account
- your own built and tested snap working with [strict](snap-confinement.md#strict) or [classic](snap-confinement.md#classic) confinement

> ⓘ If your snap requires [classic confinement](snap-confinement.md#classic), your snap will need manual approval before being released. See [Classic confinement review process](/t/process-for-reviewing-classic-confinement-snaps/1460) for further details.

## Publishing process

To get started, first [register a name](/t/registering-your-app-name/6793) for your snap in the Snap Store.

Return to the terminal and the location of your `.snap` file. You now need to authenticate the *snapcraft* command using your Snapcraft developer account credentials. This can be accomplished with the following:

```bash
$ snapcraft login
```

Next, upload the snap and release it into the [stable channel](channels.md):

```bash
$ snapcraft push --release=stable mysnap_latest_amd64.snap
```

If no errors are detected in the automated review of your upload, your app will be immediately available for installation.

!!! Note:
    If errors are detected, the snapcraft command will give a brief summary
    and guidance on how to correct each.

You can now test-install your snap from the Snap Store, ideally from a different testing environment to the one used to build your snap:

```bash
$ sudo snap install mysnap
```
Congratulations, your snap has now been released and is available on the Snap Store!



See [Using the Snap Store](using-the-snap-store.md) for help with making the most of a snap's store entry, and [Release management](release-management.md) for controlling which revisions appear on which channels.<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/releasing-your-app/6795'>the forum topic</a>.