<!--
## released

:white_check_mark: snapd 2.27 ([topic](https://forum.snapcraft.io/t/1993))
-->

## snapd 2.44

:gear: Switch within tracks with risk-only channel specification ([old topic](https://forum.snapcraft.io/t/11769), [new topic](https://forum.snapcraft.io/t/14970))
:gear: Support for default tracks ([topic](https://forum.snapcraft.io/t/14970))
:white_check_mark: Plug/slot rules: plug-names/slot-names constraints ([topic](https://forum.snapcraft.io/t/plug-slot-rules-plug-names-slot-names-constraints/12439))
:white_check_mark: `snap remove-user` support

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_medium_square: | _beta_ | Feb 21  | 
| :white_medium_square:  | _candidate_ | Mar 09  |
| :white_medium_square: | _stable_ | March 16 |

## snapd 2.43
:white_check_mark: snapctl is-connected plug|slot ([topic](/t/14144))
:white_check_mark: Remodel: gadget support
:white_check_mark: Plug/slot declaration rules: greedy plugs ([topic](/t/12438))
:white_check_mark: `system-backup` interface ([PR](https://github.com/snapcore/snapd/pull/6436))
:white_check_mark: Speedup seccomp backend setup ([PR](https://github.com/snapcore/snapd/pull/7821))


**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Nov 12th | 
| :white_check_mark:  | _candidate_ |  Feb 13th |
| :white_check_mark: | _stable_ | Feb 19th  |

## snapd 2.42
:white_check_mark: Little-Kernel bootloader support 
:white_check_mark: Improve performance in lxd when snapfuse is used ([topic](/t/10747/6))
:white_check_mark: Work with cgroup v2 only systems
:white_check_mark: Improved icon-theme support ([topic](/t/10676))

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Sep 18th | 
| :white_check_mark:  | _candidate_ |  Oct 2st |
| :white_check_mark: | _stable_ | Oct 10th  |



## previous

[details=Expand]

## snapd 2.41
:white_check_mark: Daemon user support ([topic](https://forum.snapcraft.io/t/10624), [older topic](https://forum.snapcraft.io/t/1461))
:white_check_mark: Gadget asset updates ([topic](https://forum.snapcraft.io/t/490))
:white_check_mark: Remodel: transition to a new store ([topic](/t/10477))
:white_check_mark: Remodel: re-registration ([topic](/t/10477))
:white_check_mark: Health checks phase 1 ([topic](/t/10605))

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Aug 22th | 
| :white_check_mark:  | _candidate_ |  Sep 3th |
| :white_check_mark: | _stable_ | Sep 9th  |


## snapd 2.40
:white_check_mark: Cohort support ([topic](https://forum.snapcraft.io/t/8995))
:white_check_mark: Much improved performance measure ([topic](https://forum.snapcraft.io/t/12141))
:white_check_mark: Refresh awareness - Part 1 ([topic](https://forum.snapcraft.io/t/10736))
:white_check_mark: Support for "base: none"

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | July 2nd | 
| :white_check_mark:  | _candidate_ |  July 17th |
| :white_check_mark: | _stable_ | Aug 12th  |

## snapd 2.39
:white_check_mark: Automatic snapshots on removal ([topic](https://forum.snapcraft.io/t/9468))
:white_check_mark: Auto install snpad for non-core base snaps
:white_check_mark:  Remodel API/cli with support for switching kernel tracks/required-snaps within the same model
:white_check_mark: Use the "core" snap as a fallback for "core16"
:white_check_mark: Retain only 2 snap revision on classic systems
:white_check_mark: Optimize  seccomp bpf compilation

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Apr 18th | 
| :white_check_mark:  | _candidate_ |  May 03th |
| :white_check_mark: | _stable_ | May 14th  |

## snapd 2.38
:white_check_mark: `snap connections` command ([topic](https://forum.snapcraft.io/t/4296))
:white_check_mark: Epochs (stepped upgrades) ([topic](https://forum.snapcraft.io/t/1757))
:white_check_mark: Improved prepare-image channel selection support ([topic](https://forum.snapcraft.io/t/5988))
:white_check_mark: Support for apparmor 2.13 
:white_check_mark: Minimal go version switch to 1.9
:white_check_mark: New intel-mei,multipass-support,network-manager-observe,  u2f-devices,block-devices interfaces
:white_check_mark: Initial performance measures available ([topic](https://forum.snapcraft.io/t/10105))


**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Mar 05th | 
|:white_check_mark:   | _candidate_ |  Mar 20th |
| :white_check_mark:   | _stable_ | Mar 28th  |

## snapd 2.37

:white_check_mark: Snapshots ([topic](https://forum.snapcraft.io/t/1670/11))
:white_check_mark: Interface hooks ([topic](https://forum.snapcraft.io/t/673))
:white_check_mark: Parallel snap installs for confined snaps ([topic](https://forum.snapcraft.io/t/5763))
:white_check_mark: Show the date the snap was released to a channel in snap info ([topic](https://forum.snapcraft.io/t/9368))
:white_check_mark: The personal-files and system-files interfaces ([topic](https://forum.snapcraft.io/t/9357)) and ([topic](https://forum.snapcraft.io/t/9358))
:white_check_mark: Add new `snap run --trace-exec <snap>.<app>` support ([topic](https://forum.snapcraft.io/t/9337))

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Jan 10 |
| :white_check_mark:   | _candidate_ |  Jan 16th |
| :white_check_mark:   | _stable_ | Jan 30h  |


## snapd 2.36

:white_check_mark: Warnings pipeline infrastructure ([topic](https://forum.snapcraft.io/t/2371))
:white_check_mark: Go into socket activtion mode no snaps are installed
:white_check_mark: Much improved `snap help` output
:white_check_mark: Support core config proxy on classic
:white_check_mark: Support rate-limit of background refreshes via `core.refresh.rate-limit` core config option
:white_check_mark: Honor core config `proxy.http{,s}` settings on classic as well
:white_check_mark: Warn when prerequisites to run snapd (like minimal kernel version) are not met

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark:  | _beta_ | Oct 02h |
| :white_check_mark:   | _candidate_ |  Nov 12th |
| :white_check_mark:   | _stable_ | Nov 20th  |

## snapd 2.35

:white_check_mark: Support to build/seed core18 based images
:white_check_mark: Interface improvements: i2c (sysfs-name support)
:white_check_mark: `apt install` hook integration, apt may suggest snaps
:white_check_mark: Allow building amazon linux rpm packages
:white_check_mark: Show verified publishers with a green check mark


**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark:  | _beta_ | Aug 08h |
| :white_check_mark:   | _candidate_ |  Aug 21th |
| :white_check_mark:   | _stable_ | Aug 29th  |

## snapd 2.34

:white_check_mark: Interface connection via gadget ([topic](https://forum.snapcraft.io/t/1431))
:white_check_mark: [Hardware watchdog on Ubuntu Core](https://forum.snapcraft.io/t/5695/)
:white_check_mark: New dvb interface ([topic](https://forum.snapcraft.io/t/3497))
:white_check_mark: New {contacts,calendar}-service interfaces
:white_check_mark: Snapd selftest check on startup ([topic](https://forum.snapcraft.io/t/6216))
:white_check_mark: New can-bus interface
:white_check_mark: Support to disable ipv6 via ` snap set system network.disable-ipv6`

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark:  | _beta_ | Jun 29th |
| :white_check_mark:   | _candidate_ |  Jul 30th |
| :white_check_mark:   | _stable_ | Aug 6th  |


## snapd 2.33
:white_check_mark: [ Reboot experience on core or kernel refresh](https://forum.snapcraft.io/t/reboot-experience-on-core-or-kernel-refresh/1584)
:white_check_mark: Service watchdog support ([topic](https://forum.snapcraft.io/t/2268/45))
:white_check_mark: [Support for appstream ID](https://forum.snapcraft.io/t/support-for-appstream-id/2327)
:white_check_mark: Selftest support to ensure squashfs can be mounted
:white_check_mark: New juju-client-observer interface
:white_check_mark: [Snap refresh over metered connections](https://forum.snapcraft.io/t/snap-refresh-over-metered-connections/5001)
:white_check_mark: [Snapd support for xdg-desktop-portal](https://forum.snapcraft.io/t/snapd-support-for-xdg-desktop-portal/161/9)

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark:  | _beta_ | May 24th |
| :white_check_mark:  | _candidate_ |  Jun 08th |
| :white_check_mark:  | _stable_ | Jun 18th  |

## snapd 2.32
:white_check_mark: Auto install of content snap dependencies 
:white_check_mark: [Versionized profiles](https://forum.snapcraft.io/t/versionized-profiles/827/24)
:white_check_mark: Layouts (custom mount points) ([topic](https://forum.snapcraft.io/t/1471))
:white_check_mark: Support to pass options to strace ([topic](https://forum.snapcraft.io/t/1433/15))
:white_check_mark: Support for service timers ([topic](https://forum.snapcraft.io/t/1068))
:white_check_mark: Support for CDNs that are cloud aware ([topic](https://forum.snapcraft.io/t/3474))
:white_check_mark: Support for `snap run --gdb` 
:white_check_mark: Service survival across refreshes ([topic](https://forum.snapcraft.io/t/140/21))
:white_check_mark: Timer services ([topic](https://forum.snapcraft.io/t/1068))
:white_check_mark: Refresh hold option ([topic](https://forum.snapcraft.io/t/4106/3))
:white_check_mark: Autostart desktop applications ([topic](https://forum.snapcraft.io/t/2449))
:white_check_mark: Support for `stop-mode` ([topc](https://forum.snapcraft.io/t/140/37))

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Feb 23th |
| :white_check_mark: | _candidate_ |  Mar 22th |
| :white_check_mark: | _stable_ | Apr 10th  |

## snapd 2.31

:white_check_mark: Snap service start ordering ([topic](https://forum.snapcraft.io/t/1470/11))
:white_check_mark: Refresh snaps with needed credentials ([topic](https://forum.snapcraft.io/t/3081))
:white_check_mark: Use snapcraft export-login data in `snap {download,prepare-image}`
:white_check_mark: Additional sanity check on installs ([topic](https://forum.snapcraft.io/t/3566))
:white_check_mark: Monthly refresh scheduling ([topic](https://forum.snapcraft.io/t/1239))
:white_check_mark: Command-not-found support on core ([topic](https://forum.snapcraft.io/t/2370))
:white_check_mark: Support `xdg-settings set default-web-browser` from within snaps ([topic](https://forum.snapcraft.io/t/1547/9))
:white_check_mark: Support `snap run --strace` ([topic](https://forum.snapcraft.io/t/1433))
:white_check_mark: Support for `snap refresh --amend local-snap`
:white_check_mark: Content interface improvements ([topic](https://forum.snapcraft.io/t/2387))

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark:  | _beta_ | Jan 22th |
| :white_check_mark:   | _candidate_ |  Feb 05th |
| :white_check_mark:  | _stable_ | Feb 19th  |


## snapd 2.30

:white_check_mark: Service control on snapctl (start/stop/etc) ([topic](https://forum.snapcraft.io/t/1908))
:white_check_mark: Tab-completion for aliases too ([topic](https://forum.snapcraft.io/t/2261))
:white_check_mark: Add support for socket activation ([topic](https://forum.snapcraft.io/t/2050))
:white_check_mark: Pre-refresh hook support ([topic](https://forum.snapcraft.io/t/478))
:white_check_mark: Allow to configure core before it is installed
:white_check_mark: Run configuration of core internally  
:white_check_mark: Support for Nvidia Vulkan/32-it NVIDIA drivers

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark:  | _beta_ | Nov 30th |
| :white_check_mark:   | _candidate_ |  Dec 11th |
| :white_check_mark:  | _stable_ | Jan 02th  |

## snapd 2.29

:white_check_mark: Improved configuration get output ([topic](https://forum.snapcraft.io/t/522))
:white_check_mark: Automatic download of base snaps ([topic](https://forum.snapcraft.io/t/381))
:white_check_mark: Support $ variables in _command:_ ([topic](https://forum.snapcraft.io/t/2376))
:white_check_mark: Fix classic flag on reverts ([topic](https://forum.snapcraft.io/t/1937))
:white_check_mark: Cache downloaded snaps ([topic](https://forum.snapcraft.io/t/2374))
:white_check_mark: Repair capability phase 1 ([topic](https://forum.snapcraft.io/t/311))
:white_check_mark: Make –ignore-validation sticky and send the flag over ([topic](https://forum.snapcraft.io/t/2139))
:white_check_mark: Improved progress information on long operations

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Oct 23th 
| :white_check_mark:  | _candidate_ |  Oct 30th |
| :white_check_mark: | _stable_ | Dec 04th  |

## snapd 2.28

:white_check_mark: Internal xdg-open implementation ([topic](https://forum.snapcraft.io/t/1420))
:white_check_mark: Post-refresh hook support ([topic](https://forum.snapcraft.io/t/478/10))
:white_check_mark: Lazy registrations on classic ([topic](https://forum.snapcraft.io/t/1232)) 
:white_check_mark: Service control on snap command (start/stop/etc) ([topic](https://forum.snapcraft.io/t/262))
:white_check_mark: Tab-completion for snaps ([topic](https://forum.snapcraft.io/t/2261))
:white_check_mark: Polkit-based authorizations ([topic](https://forum.snapcraft.io/t/1206))
:white_check_mark: Initial support for base snaps ([topic](/t/introducing-base-snaps/381))
:white_check_mark: Snap switch command ([topic](https://forum.snapcraft.io/t/1418))
:white_check_mark: Proxy configuration for core devices ([topic](https://forum.snapcraft.io/t/467))
:white_check_mark: Support for /snap as symlink ([topic](https://forum.snapcraft.io/t/1732)) 

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _beta_ | Sep 4th |
| :white_check_mark:  | _candidate_ | Sep 25th |
| :white_check_mark: | _stable_ | Oct 9th |


## snapd 2.27

See release notes [topic](https://forum.snapcraft.io/t/1993) for details.

:white_check_mark: Dynamic filesystem updates (snap-update-ns) 
:white_check_mark: Android boot support
:white_check_mark: General snapctl support
:white_check_mark: New title field
:white_check_mark: Install --unaliased parameter
:white_check_mark: Seccomp argument filtering
:white_check_mark: Configuration defaults on first boot
:white_check_mark: New or updated interfaces, 17 in total

**Schedule**

|  |  |  |
| --- | --- | --- |
| :white_check_mark: | _stable_ | Sep 5th |

[/details]

## upcoming
:white_medium_square: Improvements in `snap download` ([topic](https://forum.snapcraft.io/t/1422))
:white_medium_square: Refresh App Awareness ([topic](https://forum.snapcraft.io/t//10736))
:white_medium_square: Health checks ([topic](https://forum.snapcraft.io/t/10605))
(other [upcoming](https://forum.snapcraft.io/tags/upcoming) topics)

## backlog
:white_medium_square: Support for wayland sockets ([topic](https://forum.snapcraft.io/t/186))
:white_medium_square: Report disk usage for snaps ([topic](https://forum.snapcraft.io/t/2372))
:white_medium_square: Cache snap summary/etc from store ([topic](https://forum.snapcraft.io/t/2375))
:white_medium_square: Repairs Phase 2 (emergency fixes) ([topic](https://forum.snapcraft.io/t/311))
:white_medium_square: Allow snaps to refresh themselves ([topic](https://forum.snapcraft.io/t/2275))  
:white_medium_square: Configuration schemas
:white_medium_square: Entitlements
:white_medium_square: Alias in service units ([topic](https://forum.snapcraft.io/t/794))
:white_medium_square: Replace a snap by another

(other [backlog](https://forum.snapcraft.io/tags/backlog) topics)<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/the-snapd-roadmap/1973'>the forum topic</a>.