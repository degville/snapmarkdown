A hook is an executable that runs within a snap's confined environment when a certain action occurs.

Common examples of actions requiring hooks include:

- **notifying a snap that something has happened**
     Example: If a snap has been upgraded, the snap may need to trigger a scripted migration process to port an old data format to the new one.

- **notifying a snap that a specific operation is in progress**
     Example: A snap may need to know when a specific interface connects or disconnects.

A hook is defined as an executable within a snap's `meta/hooks/` directory, and consequently, also within `snap/hooks/` when building with *snapcraft*.

The filename of the executable is based on the name of the hook. If this file exists, *snapd* will execute the file when required by that hook's action.
 
> ⓘ **Default shell environment**: A hook script can only assume a POSIX-compliant shell environment for its execution. If your script needs a specific shell, such as *Bash* or *Zsh*, it needs to be explicitly declared within the script's *hashbang* header (`#!/bin/bash`, for example). Your snap also needs to ensure your chosen shell is available. 

## Accessing resources

If a hook requires access to system resources outside of a snap's confined environment, it will need to use [slots and plugs](interface-management.md#slots-plugs) via the [interface](interface-management.md) mechanism to access those resources.

When using *Snapcraft* to build the snap, the interface definition will go inside [snapcraft.yaml](the-snapcraft-format.md), and the *snapcraft* command create a [snap.yaml](the-snap-format.md) within the snap to hold the required metadata.

For example, the following excerpt registers an _install_ hook making use of a [network](/t/the-network-interface/7880) plug:

```yaml
apps:
    ...

hooks:
    install:
        plugs: [network]
```

Hooks are called with no parameters. When a hook needs to request or modify information in within *snapd*,  they can do so via the *snapctl* tool, which is always available within a snap's environment. See `snapctl --help` and `snapctl <command> --help` for details on how to use the tool.

A hook is executed as a single transaction, where a transaction object holds all the configuration changes for that hook. These changes are invisible to the running system until the hook completely finishes. This allows for changes to be rolled back or *unset* if errors occur during the execution of a hook.

<h2 id='heading--the-configure-hook'>The configure hook<sup><a href='#heading--the-configure-hook'>⚓</a></sup></h2>

The `configure` hook is called when the following actions happen:
- initial snap installation
- snap refresh
- whenever the user runs `snap set` to change a configuration option

The hook should use `snapctl get` to retrieve configuration values from snapd. If the hook exits with a non-zero status code, the configuration will not be applied.

For example, given the following command:

```bash
$ snap set mysnap username=foo password=bar
```

The `configure` hook located within the _mysnap_ snap at `meta/hooks/configure` would be called to apply the configuration changes, if necessary.

The hook might look similar to:

```sh
#!/bin/sh -e

username="$(snapctl get username)"
password="$(snapctl get password)"

if [ -z "$username" -o -z "$password" ]; then
    echo "Username and password are required."
    exit 1
fi

mkdir -m 0600 $SNAP_DATA/options
echo "username: $username" > $SNAP_DATA/options/credentials
echo "password: $password" >> $SNAP_DATA/options/credentials
```

The same hook can also modify the configuration of a snap within the context of the current transaction. This is accomplished using `snapctl set` and `snapctl unset`. 

For example, the following sets a value of `80` for *http*:

```sh
#!/bin/sh
snapctl set ports.http=80
```

To unset a value, pass its name with `snapctl unset`, and more than one value can be passed at a time:

```sh
#!/bin/sh
snapctl unset ports.http ports.https
```

For convenience, an option can also be negated by adding an exclamation mark (`!`) to the end of a value. For example, the following *unsets* `https`: 

```sh
#!/bin/sh
snapctl set ports.http=80 ports.https!
```

## The install hook

The `install` hook is called upon initial install only, i.e. it's not called on subsequent refreshes.

The hook is executed before starting snap services (if it has any) and before the `configure` hook. The install hook is the place for one-time actions, such as an early initialisation of a resource when installed for the first time.

## The interface hooks

Interface hooks are executed when an interface is either connected or disconnected via the interface’s plugs and slots mechanism.

They can be used to read or write attributes from a connection and, for example, acquire new resources, update internal options or update databases.

For further details, see [Interface hooks](/t/interface-hooks/8214).

## The pre-refresh hook

The `pre-refresh` hook is called whenever the snap gets refreshed.

This hook is executed for the already installed revision of the snap with its services still running (if the snap has any services) and before switching to the newly installed revision. This hook is a good place for any maintenance or cleanup actions that prepare the snap for switching to the new revision.

## The post-refresh hook

The `post-refresh` hook is similar to `pre-refresh` (above) in that it is called whenever the snap gets refreshed.

This hook is executed for the newly installed snap, before starting new services (if applicable). This hook is a good place for any extra actions that need to be performed for the new revision of the snap.

## The remove hook

The `remove` hook is called when the last revision of the snap gets removed from the system.

This hook is executed after stopping the services of the snap (if the snap has any services), therefore it's useful for any custom cleanup logic.

## The prepare-device hook

This hook is only supported in gadget snaps.

See [The gadget snap](the-gadget-snap.md) documentation for more details.<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/supported-snap-hooks/3795'>the forum topic</a>.