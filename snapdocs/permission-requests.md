By design, snaps run in isolation from one another and the host system. However, this behaviour can be modified by the snap's developer in the following ways to meet the requirements of each individual snap:

- **devmode** can be enabled during a snap's development to help debug and troubleshoot applications prior to their confinement. Snaps running in *devmode* have full system access but cannot be published on the [Snap Store](https://snapcraft.io/store) to a snap's *stable* channel. 
- **interfaces** allow a snap to access specific system resource, such as the network or an audio device. Individual interfaces are either enabled automatically or after the user requests a specific connection
- **classic confinement** is a special case reserved for snaps that are unsuitable for strict confinement. Its access to the system is synonymous with the full system access of traditionally packaged applications and requires users to append `--classic` during installation.

See [Snap confinement](snap-confinement.md) for further details on confinement, and [Interface management](interface-management.md) for how interfaces interact with system resources.

## Extra permissions

For the majority of interfaces, as well as for *devmode*, there are no special considerations. They can be used to develop strictly confined snaps, access system resources, and publish snaps to the Snap Store without any manual oversight. 

However, there are specific circumstances when a manual review and approval process is required, and these circumstances are when a snap requires one of the following:

1. *classic confinement* and publishing to the Snap Store
1.  automatic alias creation for an executable with a different name to the snap name
  (see [Application aliases](https://snapcraft.io/docs/commands-and-aliases#heading--aliases) for more details)
1. automatic interfaces connection with an interface that defaults to no auto-connection
1. a new [track](channels.md#heading--tracks), often used to provide a stable version path with production grade applications
1. use of a more permissive interfaces, such as [personal-files](/t/the-personal-files-interface/9357)

In all of the above cases, a snap's publisher needs to make a permission request in the [store-requests](https://forum.snapcraft.io/c/store-requests) category of [https://forum.snapcraft.io](https://forum.snapcraft.io).

## Approval process

In general, the approval process requires a forum post making a request by describing the  requirement and the reasoning behind it. It then needs approved by the review team.

For next steps, and for more information on what's required for each type of request, see one of the following forum posts:

1. [classic confinement](https://forum.snapcraft.io/t/process-for-reviewing-classic-confinement-snaps/1460)
1. [automatic alias creation](https://forum.snapcraft.io/t/process-for-aliases-auto-connections-and-tracks/455)
1. [automatic interface connections](https://forum.snapcraft.io/t/process-for-aliases-auto-connections-and-tracks/455)
1.  Tracks:
    - [one-off track creation](https://forum.snapcraft.io/t/process-for-aliases-auto-connections-and-tracks/455)
    - [repeating track creation for versions with a predictable release cadence](https://forum.snapcraft.io/t/simplified-track-request-process-for-snaps-with-predictable-cadence/3136)
1. [permissive interfaces](https://forum.snapcraft.io/t/process-for-aliases-auto-connections-and-tracks/455)<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/permission-requests/12822'>the forum topic</a>.