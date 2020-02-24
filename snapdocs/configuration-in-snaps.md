Certain snaps, such as those providing a background service, expose  configuration options that can be viewed and changed.

The commands for viewing and changing these configuration options are `snap get` and `snap set`.

For example, to see the configuration options exposed by an installed snap, enter `snap get <snap name>`:

```bash
$ sudo snap get nextcloud
Key        Value
mode       production
nextcloud  {...}
php        {...}
ports      {...}
private    {...}
```

The `{...}` in the output indicates that there are further options beneath the current key name level.



To explore configuration options, append the key name to the *get* command:

```bash
$ sudo snap get nextcloud ports
Key          Value
ports.http   80
ports.https  443
```

Use the *set* command to change a configuration option:

```bash
$ sudo snap set nextcloud ports.http=81
$ sudo snap get nextcloud ports
Key          Value
ports.http   81
ports.https  443
```

To clear and return a value to its default state, use the *unset* command  (from _snapd 2.41+_):
```bash
$ sudo snap unset nextcloud ports.http
# sudo snap get nextcloud ports
Key          Value
ports.http   80
ports.https  443
```

Alternatively, adding an exclamation mark (`!`) to the end of an option name  also clears its value:
```bash
$ sudo snap set nextcloud ports.http!
```

Un-setting with an exclamation mark can be mixed with setting other options at the same time:
```bash
$ sudo snap set nextcloud ports.https! ports.http=81
```

The update process will test the validity of the configuration options. If any errors are detected, the overall change is cancelled and the previous configuration reinstated.

Similarly, if the configuration update process takes longer than a reasonable amount of time, currently 5 minutes, the update is forcefully aborted and the once again the configuration is rolled back.



> :information_source: For background details on how snap developers set configuration options, see [Adding snap configuration](/t/adding-snap-configuration/15246) and [The configure hook](supported-snap-hooks.md#heading--the-configure-hook).<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/configuration-in-snaps/510'>the forum topic</a>.