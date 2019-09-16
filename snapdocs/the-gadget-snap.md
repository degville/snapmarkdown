The _gadget_ snap is responsible for defining and manipulating the system properties which are specific to one or more devices that will usually look similar to one another from an implementation perspective. This snap must necessarily be produced and signed by the device brand, which is defined via the model assertion. The brand knows where and how that device will be used, and designs the gadget snap accordingly.

For example, the brand may know that the device is actually a special VM to be used on a particular cloud, or it may know that it is going to be manufactured in a particular factory. The gadget snap may encode the mechanisms for device initialization - key generation and identity certification - as well as particular processes for the lifecycle of the device, such as factory resets. It is perfectly possible for different models to share a gadget snap.

Canonical publishes some reference gadget snaps as well as gadget snaps for main Canonical models such as official Ubuntu Core VMs on various certified public clouds, as well as general purpose computing images for popular physical devices like the 64-bit x86 PC and Raspberry Pi 2 and 3.

<a name="setup-files"></a>

## Setup files

In addition to traditional snap metadata, the gadget snap also holds some setup files fundamental to the initialization and lifecycle of the device:

- `meta/snap.yaml` - Traditional snap details, with `type: gadget` explicitly defined.
- `meta/gadget.yaml` - Gadget-specific information. See below.
- `grub.conf` - Required grub configuration when using this bootloader.
- `u-boot.conf` - Required u-boot configuration when using this bootloader.
- `cloud.conf` - Optional [cloud-init](https://cloudinit.readthedocs.io/en/latest/) configuration; cloud-init is disabled if missing.

Sample configuration files may be found in the reference gadget snaps.

<a name="gadget.yaml"></a>

## gadget.yaml

<!---
Source: https://github.com/CanonicalLtd/ubuntu-image/blob/master/docs/gadget-yaml.rst

Source should probably be removed once this is completed.
-->

The `meta/gadget.yaml` file contains the basic metadata for gadget-specific functionality, including a detailed specification of which structure items composed an image. The latter is used both by snapd and by ubuntu-image when creating images for these devices.

The following specification defines what is supported in `gadget.yaml`:

```
# Define the format of this file. The default and latest format is zero.
# Clients reading this file must reject it the format is greater than
# the supported one. (optional)
format: <int>

# Default configuration options for defined snaps, applied on installation.
# The snap ID may be discovered via the snap info command.
# Since 2.33 snap ID can be the "system" nick to cover the system
# configuration. (optional)
defaults:
    <snap id>:
        <key>: <value>

# Interface connection instructions for plugs and slots of seeded
# snaps to connect at first boot. snap IDs can be the "system"
# nick as well. Omitting "slot" in an instruction is allowed
# and equivalent then to: slot: system:<plug>
# (since 2.34) (optional)
connections:
   -  plug: <plug snap id>:<plug>
      slot: <slot snap id>:<slot>
     
# If device-tree is specified, `dtbs/<filename>` must exist in kernel or
# gadget snap (depends on origin) and `snap_device_tree_origin` and
# and `snap_device_tree` are made available for u-boot and grub. (optional)
device-tree: <filename>

# Defines where the device tree is. Defaults to gadget. (optional)
device-tree-origin: kernel

# Volumes defining the structure and content for the images to be written
# into one ore more block devices of the gadget device. Each volume in
# in the structure represents a different image for a "disk" in the device.
# (optional)
volumes:

  # Name of volume and output image file. Must match [a-z-]+. (required)
  <volume name>:

    # 2-digit hex code for MBR disk ID or GUID for GPT disk id. (optional)
    id: <id>
                  
    # Bootloader in the volume. Required in one volume. (required/optional)
    bootloader: grub | u-boot

    # Which partitioning schema to use. Defaults to gpt. (optional)
    schema: mbr | gpt | mbr,gpt

    # Structure defines layout of the volume, including partitions,
    # Master Boot Records, or any other relevant content. (required)
    structure:
      - # Structure value is a list.

        # Structure item name. There's an implementation-specific constraint
        # on the maximum length. The maximum length of a partition name
        # for GPT is 36 characters in the UTF-16 character set. (optional)
        name: <name>

        # GPT unique partition id, disallowed on MBR volumes. (optional)
        id: <id>

        # Role defines a special role for this item in the image. (optional)
        # Must be either unset, or one of:
        #   mbr - Master Boot Record of the image.
        #   system-boot - Partition holding the boot assets.
        #   system-data - Partition holding the main operating system data.
        #
        # A structure with role:system-data must either have an implicit
        # file system label, or 'writable'.
        role: mbr | system-boot | system-data

        # Type of structure. May be specified as a two-hex-digit MBR partition
        # type, a GPT partition type GUID, or both on hybrid schemas.  The
        # special value `bare` says to not create a disk partition for this
        # structure. (required)
        type: <mbr type> | <gpt guid> | <mbr type>,<gpt guid> | bare

        # Size for structure item. Maximum of 446 for the mbr role. (required)
        size: <bytes> | <bytes/2^20>M | <bytes/2^30>G

        # The offset from the beginning of the image. Defaults to right after
        # prior structure item. (optional)
        offset: <bytes> | <bytes/2^20>M | <bytes/2^30>G

        # Offset of this structure element (in units of 512-byte sectors) is
        # written to the provided position within the volume in LBA48 pointer
        # format (32-bit little-endian). This position may be specified as a
        # byte-offset relative to the start of another named structure item.
        # (optional)
        offset-write: [<name>+]<bytes> |
                      [<name>+]<bytes/2^20>M |
                      [<name>+]<bytes/2^30>G

        # Filesystem type. Defaults to none. (optional)
        filesystem: none | vfat | ext4

        # Filesystem label. Defaults to name of structure item. (optional)
        filesystem-label: <label>

        # Content to be copied from gadget snap into the structure. This
        # field takes a list of one of the following formats. (required)
        content:

            # Copy source (relative to gadget base directory) into filesystem
            # at target (relative to root). Directories must end in a slash.
            - source: <filename> | <dir>/  # (required)
              target: <filename> | <dir>/  # (required)

            # Dump image (relative to gadget base directory) of the raw data
            # as-is into the structure at offset. If offset is omitted it
            # defaults to right after prior content item. If size is omitted,
            # defaults to size of contained data.
            - image: <filename>                                 # (required)
              offset: <bytes> | <bytes/2^20>M | <bytes/2^30>G   # (optional)
              offset-write: (see respective item above)         # (optional)
              size: <bytes> | <bytes/2^20>M | <bytes/2^30>G     # (optional)
```

<a name="prepare-device"></a>

## prepare-device hook

The optional `prepare-device` hook will be called on the gadget at the start of the device initialization process, after the gadget snap has been installed. The hook will also be called if this process is retried later from scratch in case of initialization failures.

The device initialization process is for example responsible of setting the serial identification of the device through an exchange with a device service. The `prepare-device` hook can for example redirect this exchange and dynamically set options relevant to it. 

One must ensure that `registration.proposed-serial`  is set to a value **unique**  across all devices of the brand and model and that it does not contain a `/`. It is going to be used as the "serial number" (a string, not necessarily a number) part of the identification in case the device service supports setting it or **requires** it, as is the case with the *serial-vault*.

#### Example

```bash
#!/bin/sh

# optionally set the url of the service
snapctl set device-service.url="https://device-service"
# set optional extra HTTP headers for requests to the service
snapctl set device-service.headers='{"token": "TOKEN"}'

# set an optional proposed serial identifier, depending on the service
# this can end up being ignored;
# this might need to be obtained dynamically
snapctl set registration.proposed-serial="DEVICE-SERIAL"

# optionally pass details of the device as the body of registration request,
# the body is text, typically YAML;
# this might need to be obtained dynamically
snapctl set registration.body='mac: "00:00:00:00:ff:00"'

```<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/the-gadget-snap/696'>the forum topic</a>.