Interfaces enable resources from one snap to be shared with another and with the system. For a snap to use an interface, its developer needs to have first defined its corresponding plugs and slots within a snap's [snapcraft.yaml](/t/creating-snapcraft-yaml/11666) file.

For details on how to add an interface to your own snap, see [Snapcraft interfaces](/t/snapcraft-interfaces/13123). For general usage details, see [Interface management](interface-management.md).

The table below lists currently supported interfaces, with links to further details for each interface.

The following column names are used:

- *Interface name* is the syntactical interface name, as used by snaps.  

- *Auto-connect* indicates that the interface will be connected by default when the snap is first installed, requiring no further user action. If `Auto-connect=no`, an interface can still be automatically connected if the snap developer has requested, and been granted, explicit permission. See [Permission requests](permission-requests.md) for details.

- *Transitional interfaces* are used by trusted snaps to access traditional Linux desktop environments that were not designed to integrate with snap isolation. As such, they will become deprecated as replacement or modified technologies that enforce strong application isolation become available.

| Interface name | Description | Auto-connect | 
|--|--|--|
| [account-control](/t/the-account-control-interface/7746) | add/remove user accounts or change passwords | no |
| [accounts-service](/t/the-accounts-service-interface/7802) | allows communication with the accounts service | no |
| [adb-support](/t/the-adb-support-interface/9720) | allows operating as Android Debug Bridge service | no |
| [alsa](/t/the-alsa-interface/7766) | play or record sound | no |
| [appstream-metadata](/t/the-appstream-metadata-interface/13050) | allows access to AppStream metadata | no |
| [audio-playback](/t/the-audio-playback-interface/13089) |  allows audio playback via supporting services | yes |
| [audio-record](/t/the-audio-record-interface/13090) | allows audio recording via supported services | no |
| [autopilot-introspection](/t/the-autopilot-introspection-interface/7768) | be controlled by Autopilot software | no |
| [avahi-control](/t/the-avahi-control-interface/7769) | advertise services over the local network | no |
| [avahi-observe](/t/the-avahi-observe-interface/7770) | detect services and devices over the local network | no |
| [block-devices](/t/the-block-devices-interface/9721) | access to disk block devices | no |
| [bluetooth-control](/t/the-bluetooth-control-interface/7771) | access Bluetooth hardware directly | no |
| [bluez](/t/the-bluez-interface/7772) | use Bluetooth devices | no |
| [bool-file](/t/the-bool-file-interface/7803) | allows access to specific file with bool semantics | no |
| [broadcom-asic-control](/t/the-broadcom-asic-control-interface/7773) | control Broadcom network switches | no |
| [browser-support](/t/the-browser-support-interface/7775) | use functions essential for Web browsers | no when `allow-sandbox: true`, yes otherwise |
| [calendar-services](/t/the-calendar-service-interface/7804) | allows communication with Evolution Data Server calendar  | no |
| [camera](/t/the-camera-interface/7776) | use your camera or webcam | no |
| [can-bus](/t/the-can-bus-interface/7805) | allows access to the CAN bus | no |
| [cifs-mount](/t/the-cifs-mount-interface/13091) | allows the mounting and unmounting of CIFS filesystems | no |
| [classic-support](/t/the-classic-support-interface/7777) | enable resource access to classic snap | no |
| [contacts-service](/t/the-contacts-service-interface/13092) | allows communication with the Evolution Data Server address book | no |
| [content](/t/the-content-interface/1074) |  access resources across snaps | yes for snaps from same publisher, no otherwise |
| [core-support](/t/the-core-support-interface/7778) | deprecated since snap _2.34_  | no |
| [cpu-control](/t/the-cpu-control-interface/7780) | set certain CPU values | no |
| [cups-control](/t/the-cups-control-interface/7779) | print documents | no |
| [daemon-notify](/t/the-daemon-notify-interface/7809) | allows sending daemon status changes to service manager | no |
| [dbus](/t/the-dbus-interface/2038) | allow snaps to communicate over D-Bus | no |
| [dcdbas-control](/t/the-dcdbas-control-interface/7781) | shut down or restart Dell devices | no |
| [desktop](/t/the-desktop-interface/7783) | provides access to common desktop elements | yes |
| [desktop-legacy](/t/the-desktop-legacy-interface/7782) | enables the use of legacy desktop methods (including input method and accessibility services) | yes |
| [device-buttons](/t/the-device-buttons-interface/8598) | use any device-buttons | no |
| [display-control](/t/the-display-control-interface/9723) | allows configuring display parameters | no |
| [docker](/t/the-docker-interface/7787) | start, stop, or manage Docker containers | no |
| [docker-support](/t/the-docker-support-interface/7810) | allows operating as the Docker daemon | no |
| [dummy](/t/the-dummy-interface/7811) | allows testing without additional permissions | no |
| [dvb](/t/the-dvb-interface/7812) | allows access to all DVB devices and APIs | no |
| [firewall-control](/t/the-firewall-control-interface/7813) | configure a network firewall | no |
| [framebuffer](/t/the-framebuffer-interface/7814) | access to universal framebuffer devices | no |
| [fuse-support](/t/the-fuse-support-interface/7816) | enables access to the FUSE filesystems | no |
| [fwupd](/t/the-fwupd-interface/7825) | allows operating as the fwupd service | no |
| [gpg-keys](/t/the-gpg-keys-interface/7827) | read GPG user configuration and keys |  no |
| [gpg-public-keys](/t/the-gpg-public-keys-interface/7828) | read GPG non-sensitive configuration and public keys | no |a
| [gpio](/t/the-gpio-interface/7829) | access specific GPIO pins | no |
| [gpio-control](/t/the-gpio-control-interface/13037) | allows to export/unexport and control all GPIOs | no |
| [gpio-memory-control](/t/the-gpio-memory-control-interface/7830) | allows write access to all GPIO memory | no |
| [greengrass-support](/t/the-greengrass-support-interface/7831) | allows operating as the Greengrass service | no |
| [gsettings](/t/the-gsettings-interface/7832) |  provides access to any *GSettings* item for current user | yes |
| [hardware-observe](/t/the-hardware-observe-interface/7833) | access hardware information | no |
| [hardware-random-control](/t/the-hardware-random-control-interface/7835) | provide entropy to hardware random number generator | no |
| [hardware-random-observe](/t/the-hardware-random-observe-interface/7836) | use hardware-generated random numbers | no |
| [hidraw](/t/the-hidraw-interface/7837) | access hidraw devices | no |
| [home](/t/the-home-interface/7838) | access non-hidden files in the home directory | yes on classic (traditional distributions), no otherwise |
| [hostname-control](/t/the-hostname-control-interface/7841) | allows configuring the system hostname | no |
| [i2c](/t/the-i2c-interface/7842) | access i²c devices | no |
| [iio](/t/the-iio-interface/7846) | access IIO devices | no |
| [intel-mei](/t/the-intel-mei-interface/10203) | access to the Intel MEI management interface  | no |
| [io-ports-control](/t/the-io-ports-control-interface/7848) | allows access to all I/O ports | no |
| [jack1](/t/the-jack1-interface/13093) | allows interaction with the JACK audio connection server | no |
| [joystick](/t/the-joystick-interface/7849) | use any connected joystick | no |
| [juju-client-observe](/t/the-juju-client-observe-interface/7850) | read the Juju client configuration | no |
| [kernel-module-control](/t/the-kernel-module-control-interface/7853) | insert, remove and query kernel modules | no |
| [kernel-module-observe](/t/the-kernel-module-observe-interface/9719) | query kernel modules | no |
| [kubernetes-support](/t/the-kubernetes-support-interface/7855) | use functions essential for Kubernetes | no |
| [kvm](/t/the-kvm-interface/7856) | allows access to the kvm device  | no |
| [libvirt](/t/the-libvirt-interface/7858) | provides access to the libvirt service | no |
| [locale-control](/t/the-locale-control-interface/7859) | change system language and region settings | no |
| [location-control](/t/the-location-control-interface/7860) | allows operating as the location service | no |
| [location-observe](/t/the-location-observe-interface/7861) | access your location | no |
| [login-session-control](/t/the-login-session-control-interface/13094) | allows setup of login sessions and grants privileged access to user sessions | no |
| [login-session-observe](/t/the-login-session-observe-interface/14580) | allows reading login and session information | no |
| [log-observe](/t/the-log-observe-interface/7862) | read system logs | no |
| [lxd](/t/the-lxd-interface/7863) | provides access to the LXD socket | no |
| [lxd-support](/t/the-lxd-support-interface/7864) | allows operating as the LXD service | no |
| [maliit](/t/the-maliit-interface/7872) | use an on-screen keyboard | no |
| [media-hub](/t/the-media-hub-interface/7873) | access snaps providing the media-hub interface | yes |
| [mir](/t/the-mir-interface/7874) | enables access to the Mir display service | yes |
| [modem-manager](/t/the-modem-manager-interface/7875) | use and configure modems | no |
| [mount-observe](/t/the-mount-observe-interface/7876) | read mount table and quota information  | no |
| [mpris](/t/the-mpris-interface/7877) | control music and video players | no |
| [multipass-support](/t/the-multipass-support-interface/13095) | multipass-support allows operating as the Multipass service | no |
| [netlink-audit](/t/the-netlink-audit-interface/7878) | allows access to kernel audit system through Netlink | no |
| [netlink-connector](/t/the-netlink-connector-interface/7879) | communicate through the kernel Netlink connector | no |
| [network](/t/the-network-interface/7880) | enables network access | yes |
| [network-bind](/t/the-network-bind-interface/7881) | operate as a network service | yes |
| [network-control](/t/the-network-control-interface/7882) | change low-level network settings | no |
| [network-manager](/t/the-network-manager-interface/7883) | configure and observe networking via NetworkManager | no |
| [network-manager-observe](/t/the-network-manager-observe-interface/13096) | allows observing NetworkManager settings | no |
| [network-observe](/t/the-network-observe-interface/7884) | query network status information | no |
| [network-setup-control](/t/the-network-setup-control-interface/7885) | change network settings via Netplan | no |
| [network-setup-observe](/t/the-network-setup-observe-interface/7888) | read network settings | no |
| [network-status](/t/the-network-status-interface/7890) | access the NetworkingStatus service | yes |
| [ofono](/t/the-ofono-interface/7891) | allows operating as the *oFono* service | no |
| [online-accounts-service](/t/the-online-accounts-service-interface/7893) | access to the Online Accounts service | yes |
| [opengl](/t/the-opengl-interface/7894) | access OpenGL/GPU hardware | yes |
| [openvswitch](/t/the-openvswitch-interface/7896) | control Open vSwitch hardware | no |
| [openvswitch-support](/t/the-openvswitch-support-interface/7897) | enables kernel support for Open vSwitch | no |
| [optical-drive](/t/the-optical-drive-interface/7898) | read/write access to CD/DVD drives | yes, unless drive can write |
| [packagekit-control](/t/the-packagekit-control-interface/13052) | control the PackageKit service | no |
| [password-manager-service](/t/the-password-manager-service-interface/7899) | read, add, change, or remove saved passwords | no |
| [personal-files](/t/the-personal-files-interface/9357) | read or write files in the user's home directory | no |
| [physical-memory-control](/t/the-physical-memory-control-interface/7900) | read and write memory used by any process | no |
| [physical-memory-observe](/t/the-physical-memory-observe-interface/7901) | read memory used by any process | no |
| [ppp](/t/the-ppp-interface/7902) | access to configure and observe PPP networking | no |
| [process-control](/t/the-process-control-interface/7903) | pause or end any process on the system | no |
| [pulseaudio](/t/the-pulseaudio-interface/7906) | play and record sound | no |
| [raw-usb](/t/the-raw-usb-interface/7908) | access USB hardware directly | no |
| [raw-volume](/t/the-raw-volume-interface/14578) | access specific disk partitions | no |
| [removable-media](/t/the-removable-media-interface/7910) | read/write files on removable storage devices | no |
| [screencast-legacy](/t/the-screencast-legacy-interface/13097) | allows screen recording and audio recording alongside writing to arbitrary filesystem paths | no |
| [screen-inhibit-control](/t/the-screen-inhibit-control-interface/7911) | prevent screen sleep, lock and screensaver | yes |
| [serial-port](/t/the-serial-port-interface/7913) | access serial port hardware | no |
| [shutdown](/t/the-shutdown-interface/7914) | restart or power off the device | no |
| [snapd-control](/t/the-snapd-control-interface/7915) | install or remove software | no |
| [spi](/t/the-spi-interface/7916) | access specific SPI devices | no |
| [ssh-keys](/t/the-ssh-keys-interface/7917) | access SSH private and public keys | no |
| [ssh-public-keys](/t/the-ssh-public-keys-interface/7918) | access SSH public keys | no |
| [storage-framework-service](/t/the-storage-framework-service-interface/7919) | operate as, or interact with, the Storage Framework | no |
| [system-backup](/t/the-system-backup-interface/14348) | read-only access to the system for backups | no |
| [system-files](/t/the-system-files-interface/9358) | read or write files in the system | no |
| [system-observe](/t/the-system-observe-interface/7921) | read process and system information | no |
| [system-trace](/t/the-system-trace-interface/7922) | monitor or control any running program | no |
| [thumbnailer-service](/t/the-thumbnailer-service-interface/7923) | create thumbnail images from local media files | no |
| [time-control](/t/the-time-control-interface/7924) | change the date and time | no |
| [timeserver-control](/t/the-timeserver-control-interface/7925) | change time server settings | no |
| [timezone-control](/t/the-timezone-control-interface/7926) | change the time zone | no |
| [tpm](/t/the-tpm-interface/7927) | allows access to the Trusted Platform Module device | no |
| [u2f-devices](/t/the-u2f-devices-interface/9722/) | use any U2F devices | no |
| [ubuntu-download-manager](/t/the-ubuntu-download-manager-interface/7928) | use the Ubuntu Download Manager | yes |
| [udisks2](/t/the-udisks2-interface/7930) | access the UDisks2 service | no |
| [uhid](/t/the-uhid-interface/7931) | create kernel UID devices from user-space | no |
| [unity7](/t/the-unity7-interface/7786) | access legacy desktop resources from Unity7 | yes |
| [unity8](/t/the-unity8-interface/7932) | share data with other Unity 8 apps | yes |
| [unity8-calendar](/t/the-unity8-calendar-interface/7933) | read/change shared calendar events in Ubuntu Unity 8 | no |
| [unity8-contacts](/t/the-unity8-contacts-interface/7934) | read/change shared contacts in Ubuntu Unity 8  | no |
| [upower-observe](/t/the-upower-observe-interface/7935) | access battery level and power usage | yes |
| [wayland](/t/the-wayland-interface/7784) | access compositors providing the *Wayland* protocol  | yes |
| [x11](/t/the-x11-interface/7785) | monitor mouse/keyboard input and graphics output of other apps | yes |<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/supported-interfaces/7744'>the forum topic</a>.