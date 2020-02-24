Layouts modify the execution environment of a snap.

With layouts, you can make elements in `$SNAP`, `$SNAP_DATA`, `$SNAP_COMMON` accessible from locations such as `/usr`, `/var` and `/etc`. This helps when using pre-compiled binaries and libraries that expect to find files and directories outside of locations referenced by `$SNAP` or `$SNAP_DATA`.

> ⓘ Layouts can only help _within_ a snap's environment. They cannot be used to expose elements within a snap to the host environment.

Layouts require snap version _2.36+_. 

## Using layouts

Layouts are transparently supported by [Snapcraft](snapcraft-overview.md) when using a [base snap](/t/base-snaps/11198) (e.g. `base: core18`).

>  ⓘ  When not using a base snap, layout options within `snapcraft.yaml` must be made within the scope of a top-level [passthrough](/t/using-in-development-features-in-snapcraft-yaml/5766) field.

As a simple example, consider an application you want to snap that:

- stores all data in `/var/lib/foo`
- has a configuration file in `/etc/foo.conf`
- uses read-only data in `/usr/share/foo`

A layout that allows such software to be used without snap-specific modifications can be defined as follows:

```yaml
layout:
  /var/lib/foo:
    bind: $SNAP_DATA/var/lib/foo
  /usr/share/foo:
    bind: $SNAP/usr/share/foo
  /etc/foo.conf:
    bind-file: $SNAP_DATA/etc/foo.conf
```

None of the above filesystem modifications are visible to any other snaps, or from the wider user session. They’re only visible within the per-snap mount namespace.

## Layout reference

The syntax for defining a layout is:

```yaml
layout:
  <target-path>: <declaration>
  <target-path>: <declaration>
  ..
```

Layouts are defined as a key-value map, mapping from a `<target-path>` to a layout declaration. Each declaration may be one of the following:

* `symlink: <source-path>`: create a symbolic link. This method is preferred because it is the cheapest; the other methods significantly increase the startup time of your application.
* `bind: <source-path>`: bind-mount a directory.
* `bind-file: <source-path>`: bind-mount a file
* `type: tmpfs`: mount a private temporary in-memory filesystem

> :warning: Layouts using `bind*` and `tmpfs` **significantly increase the startup time** of your snap. We recommend using `symlink` instead, because it has the least amount of overhead. Some applications, however, might treat symlinks differently than regular files or directories so you may need to use a bind mount in those cases.

 `<source-path>` must refer to either `$SNAP`, `$SNAP_DATA` or `$SNAP_USER_DATA`.

 `<target-path>` can include nearly any path except for:
- `/proc`
- `/sys`
- `/dev`
- `/run`
- `/boot`
- `/lost+found`
- `/media`
- `/var/lib/snapd`
- `/var/snap`
- `/home`
- `/tmp`

See below for further limitations.

If `<source-path>` and `<target-path>` don’t already exist, they will be automatically created by snapd. This includes the creation of new empty files, but doesn’t include the creation of symbolic link targets. This is because snapd doesn’t know what kind of objects they may eventually point to. In the previous example, `$SNAP_DATA/etc/foo.conf` is created before any snap application code is executed. 

## Creating new files and directories in read-only spaces

Layouts can create new directories and files even in read-only locations such as `/usr/share`. The following declaration will create `/usr/share/foo`, for example, visible only to executing snap applications (it’s assumed that `/usr/share/foo` does **not** exist in the base snap declared by the application developer):

```yaml
layout:
  /usr/share/foo:
    bind: $SNAP/usr/share/foo
```

To accomplish the above, snapd uses a temporary filesystem (tmpfs) mounted on `/usr/share` and  populated with a set of empty files and directories. These are then used for bind mounts as well as symlinks to reconstruct the original `/usr/share`. This allows snapd to make `/usr/share` writable, and consequently, allows snapd to create `/usr/share/foo` and configure it as desired.

## Current limitations

The following apply as of snapd 2.36:

### New entries in / (root)

Layouts cannot currently create new top-level files or directories. For example, the following layout declaration will not work:

```yaml
layout:
  /foo: # Unsupported, cannot create new top-level directories.
     bind: $SNAP/foo
```

### Incompatible existing file, directory or symbolic link

Layouts cannot replace an existing but incompatible filesystem object. This means, for example, that files cannot replace directories or symbolic links, files cannot replace a directory, and existing symbolic links cannot be redirected to a new target. You can, however, replace a directory with another directory.<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/snap-layouts/7207'>the forum topic</a>.