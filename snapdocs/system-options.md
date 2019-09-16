Snap supports a set of system-wide options that allow you to customise your snap environment.

As with [Configuration in snaps](configuration-in-snaps.md), these options are changed with the `set` and `get` commands, but with a target of  *system* instead of a specific snap:

```bash
$ snap set system some.option="some value"
$ snap get system some.option
````

!!! Note:
    With snapd versions prior to 2.32.5, the *system* target needs to be
    replaced with *core*.

## Controlling refresh frequency

There are three system-wide options that are used to manage various aspects of your snap environment handles update frequency:

- **refresh.timer**: defines the refresh frequency and schedule
- **refresh.hold**: delays the next refresh until the defined time and date
- **refresh.metered**: pauses refresh updates when network connection is metered
- **refresh.retain**: sets how many revisions of a snap are stored on the system

### refresh.timer

Use *refresh.timer* to modify when, and how frequently, your snaps are refreshed.

The following example asks the system to only refresh snaps between  4.00am and 7.00am, and 7.00pm and 10:10pm:

```bash
$ sudo snap set system refresh.timer=4:00-7:00,19:00-22:10 
```

Other examples for the time and frequency option include:

| Options | Result |
|---|---|
| `mon,10:00,,fri,15:00` | Mondays at 10:00, Fridays at 15:10 |
| `mon,fri,10:00,15:00` | Mondays at 10:00 and 15:00, Fridays at 10:00 and 15:00 |
| `mon-wed,fri,9:00-11:00/2` | Monday to Wednesday and on Friday, twice between 9:00 and 11:10 |
| `mon,9:00~11:00,,wed,22:00~23:00` | Mondays, some time between 9:00 and 11:00, and on Wednesdays, some time between 22:00 and 23:00 |
| `mon,wed` | Monday and on Wednesday, at 0:00 |
| `mon2-wed2,23:00-24:00` | Monday through Wednesday on the 2nd week of the month, between 23:00 and 24:00 |
| `fri5,23:00-01:00` | Last Friday of the month, from 23:00 to 1:00 the next day |

See [Timer string format](/t/timer-string-format/6562) for a comprehensive breakdown of the syntax used to define times and frequencies. 

You can check the update frequency for your environment with the `refresh` command:

```bash
$ snap refresh --time
timer: 00:00~24:00/4
last: today at 07:47 BST
next: today at 12:13 BST
```

By default, the snap system is scheduled to refresh four times per day, as shown in the above output.

!!! Note:
    With snapd versions prior to 2.31, replace `refresh.timer` with
    `refresh.schedule`.

<h3 id='heading--refresh-hold'>refresh.hold<sup><a href='#heading--refresh-hold'>⚓</a></sup></h3>

Use *refresh.hold* to delay snap refreshes until a defined time and date. The time and date format needs to conform to [RFC 3339](https://tools.ietf.org/html/rfc3339). 

For example, *5:22pm (BST), Tuesday 23rd April 2019*, would look like the following: 

```no-highlight
2019-04-24T17:22:54+01:00
```
The correct format can be generated with the *date* command:

```bash
$ date --date="BST 2019-04-23 17:22:54" +%Y-%m-%dT%H:%M:%S%:z
2019-04-23T17:22:54+01:00

$ sudo sudo snap set system refresh.hold="$(date --date=tomorrow +%Y-%m-%dT%H:%M:%S%:z)"
$ sudo snap get system refresh.hold
2019-04-24T17:22:54+01:00
```

After a refresh, the next refresh can be delayed by up to 60 days, after which a refresh will be performed regardless of the *refresh.hold* value.

> ⓘ  We explicitly format the date command output because the version of *date* provided by GNU core utilities breaks RFC3339 compatibility when passing the `--rfc-3339` argument. See the [bug report](http://lists.gnu.org/archive/html/bug-coreutils/2006-05/msg00014.html) for further details.

<h3 id='heading--refresh-metered'>refresh.metered<sup><a href='#heading--refresh-metered'>⚓</a></sup></h3>

Use *refresh.metered* to pause and re-enable the refresh process when  *NetworkManager* detects a metered connection, such as an LTE link with a limited data plan. 

To hold refreshing snaps when on a metered connection:

```
$ sudo snap set system refresh.metered=hold
```

To allow refreshing:

```
$ sudo snap set system refresh.metered=null
```

By default, *refresh* is enabled when a metered connection is detected.

!!! Note:
    refresh.metered is available in snap 2.33 and later.

<a name="retain"></a>

### refresh.retain

Use *refresh.retain* to set the maximum number of a snap's revisions stored by the system *after* the next refresh:

```bash
$ sudo snap set system refresh.retain=3
```
The *refresh.retain* value can be a number between 2 and 20. The default is `refresh.retain=3` on Ubuntu Core systems and `refresh.retain=2` on *classic* Ubuntu systems, such as those running Ubuntu 18.04 LTS (Bionic Beaver) and Ubuntu 16.04 LTS (Xenial Xerus).

!!! Note:
    refresh.retain is available in snap 2.34 and later.

## proxy.{http,https,ftp}

These options may be set to change the proxies to be used by the system when communicating with external sites that speak the respective protocols.

Available since snapd 2.28.

## service.ssh.disable

May be set to _true_ for disabling the SSH service at startup.

Available since snapd 2.22.

## system.power-key-action

Defines the behaviour of the system when the power key is pressed.

May be set to one of:

* ignore
* poweroff
* reboot
* halt
* kexec
* suspend
* hibernate
* hybrid-sleep
* lock

Available since snapd 2.23.


<h2 id='heading--snapshots-automatic-retention'>snapshots.automatic.retention</h2>

[Automatic snapshot](snapshots.md) retention time is configured with the `snapshots.automatic.retention` system option. The default value is 31 days, and the value needs to be greater than 24 hours:

```bash
$ snap set system snapshots.automatic.retention=30h
```

To disable automatic snapshots, set the retention time to `no`:

```bash
$ snap set system snapshots.automatic.retention=no
```

> Disabling automatic snapshots will *not* affect pre-existing automatically generated snapshots, only those generated by subsequent snap removals.

Automatic snapshots require snap version _2.39+_. 

## pi-config

On a Raspberry Pi, the following options set corresponding values in the _config.txt_ system configuration file:

  * pi-config.disable-overscan
  * pi-config.framebuffer-width
  * pi-config.framebuffer-height
  * pi-config.framebuffer-depth
  * pi-config.framebuffer-ignore_alpha
  * pi-config.overscan-left
  * pi-config.overscan-right
  * pi-config.overscan-top
  * pi-config.overscan-bottom
  * pi-config.overscan-scale
  * pi-config.display-rotate
  * pi-config.hdmi-group
  * pi-config.hdmi-mode
  * pi-config.hdmi-drive
  * pi-config.avoid-warnings
  * pi-config.gpu-mem-256
  * pi-config.gpu-mem-512
  * pi-config.gpu-mem

Further details on the above, see the [official Raspberry Pi documentation](https://www.raspberrypi.org/documentation/configuration/config-txt/).<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/system-options/87'>the forum topic</a>.