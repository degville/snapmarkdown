

The majority of snaps expose their functionality via applications that run on the local system. Most of these applications are started either from [the command line](commands-and-aliases.md), the graphical desktop, or as services that run automatically.

A single snap may provide multiple applications and services. With a database snap, for example, you might expect an interactive client application alongside the service daemon. 

Snaps manage their own services without the need for manual intervention. However, experienced administrators may want to interact with a snap's services to help improve their integration with the local environment. For that reason, snapd offers a set of commands to allow a snap's services to be inspected and their statuses changed.

## Listing services

Use `snap services` to lists all the services added to the system by the currently installed and enabled snaps. Adding a snap name as an argument will list only those services added by that snap:

```bash
$ sudo snap services lxd
Service     Startup  Current
lxd.daemon  enabled  active
```
The output includes the service name, whether the service is started when the system starts up, and whether it's currently running.

!!! Note:
    Before snapd 2.32, the service name was split in two different columns,
    Snap and Service, but the service name was incorrectly reported as its
    suffix only.

## Restarting services

Services are restarted using the `snap restart <snap name>` command. This may be necessary if you've made custom changes to the snap application, for example, which the service needs to reload.

By default, all services for a specified snap will be restarted:

```bash
$ sudo snap restart lxd
Restarted.
```

Using a more specific service name performs the same operation on an individual service:

```bash
$ sudo snap restart lxd.daemon
Restarted.
```

The option to perform an operation on all of a snap's services, or on one specific service, is common to all commands that operate on services.

## Starting and stopping services

The `start` and `stop` commands control whether a service should be currently running:

```bash
$ sudo snap stop lxd.daemon
Stopped.

$ sudo snap start lxd.daemon
Started.
```
As mentioned above, these commands can operate both on individual snap's services and on all services for a named snap, depending on the parameter provided.



To prevent a service from starting on the next boot, use the `--disable` option:

```bash
$ sudo snap stop --disable lxd.daemon
```

The *start* command includes an `--enable` option to re-enable the automatic starting of a service  when the system boots:

```bash
$ sudo snap start --enable lxd.daemon
```

## Inspecting logs

If you need to see the log output for a snap's services, use the `logs` command:

```bash
$ snap logs lxd
2018-09-14T10:38:23Z lxd.daemon[11096]: => LXD is ready
(...)

$ snap logs lxd.daemon
(...)
```

Adding the `-f` option will keep log output  open so you can follow new entries as they occur:

```bash
$ sudo snap logs lxd -f
```<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/service-management/3965'>the forum topic</a>.