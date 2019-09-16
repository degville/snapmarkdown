As the name implies, the _kernel_ snap is responsible for defining the Linux kernel that will run in a snap-based system. The correct kernel snap for a given system is selected via the model assertion, produced and signed by the device's brand account before the image is built. Once the image is built, the kernel snap may be updated, but it cannot be replaced by a completely different kernel snap.

Canonical publishes some reference kernel snaps as well as kernel snaps for main Canonical models such as official Ubuntu Core VMs on various certified public clouds, as well as general purpose computing images for popular physical devices such as the 64-bit x86 PC and Raspberry Pi 2 and 3.

## Setup files

In additional to traditional snap metadata, the kernel snap also holds some setup files fundamental to the initialization and lifecycle of the device.

The current layout for a kernel snap is straightforward:

- `meta/snap.yaml` - Traditional snap details, with `type: kernel` explicitly defined
- `kernel.img` - The actual kernel image
- `initrd.img` - The respective initrd image
- `modules/<version>/` - Kernel modules; version must match the one in `snap.yaml`
- `firmware/` - Optional firmware files.
- `dtbs/` - Optional binary device-tree files, if [gadget.yaml](the-gadget-snap.md/2) states `device-tree-origin: kernel`

Sample configuration files may be found in the reference gadget snaps.<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/the-kernel-snap/697'>the forum topic</a>.