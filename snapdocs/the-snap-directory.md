The `/snap` directory is, by default, where the files and folders from installed snap packages appear on your system.

It has the following structure:

```no-highlight
/snap/bin                   - Symlinks to snap applications
/snap/<snapname>/<revision> - Mountpoint for snap content
/snap/<snapname>/current    - Symlink to current revision, if enabled
```

<h2 id=heading--storage-space>Storage space</h2>

A file manager, or the output from some storage-related commands, will show the files and directories within */snap* taking up space:

```bash
$ du -hs /snap/vlc
766M    /snap/vlc
```

However, these files and folders are mounted from the heavily compressed data that's stored within the original snap, located in */var/lib/snapd/snaps*. These snaps take far less space on your system than their mount points imply:

```no-highlight
$ mount | grep vlc
/var/lib/snapd/snaps/vlc_555.snap on /snap/vlc/555 type squashfs (ro,nodev,relatime,x-gdu.hide)
$ df -h 
Filesystem      Size  Used Avail Use% Mounted on
/dev/loop12     196M  196M     0 100% /snap/vlc/555
[...]
```

>ⓘ  For a detailed overview of how snaps are constructed, see  [The snap format](the-snap-format.md) documentation.<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/the-snap-directory/2817'>the forum topic</a>.