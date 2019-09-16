The *snapcraft.yaml* file is the main entry point to create a snap through Snapcraft. It contains all the details the *snapcraft* command needs to build a snap.

> :information_source: See [Snapcraft checklist](/t/snapcraft-checklist/10926) for an overview of the typical project details needed before creating *snapcraft.yaml*.

In general, snapcraft.yaml can be organised into three principle sections:

**1. top-level metadata**, containing values, such as *name*, typically used by the store:

```yaml
name: hello
base: core18
version: '2.10'
summary: GNU Hello, the "hello world" snap
description: |
  GNU hello prints a friendly greeting.
grade: stable
confinement: strict
```

**2. apps** detailing how apps and services are exposed to the host system:

```yaml
apps:
  hello:
    command: bin/hello
```
**3.** and **parts** to describes how to import, and potentially build, each required part of the snap:

```yaml
parts:
  gnu-hello:
    source: http://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz
    plugin: autotools
```

For further details on the metadata contained within each of the above sections, see one of the following:

1. [Snapcraft top-level metadata](/t/snapcraft-top-level-metadata/8334)
1. [Snapcraft parts metadata](/t/snapcraft-parts-metadata/8336)
1. [Snapcraft app and service metadata](/t/snapcraft-app-and-service-metadata/8335)

A set of environment variables is also available during the build process. See [Environment variables that Snapcraft exposes](/t/environment-variables-that-snapcraft-exposes/7569) for further details.

Additionally, see [Snapcraft.yaml reference](/t/snapcraft-yaml-reference/4276) for a complete overview of the metadata supported by snapcraft.yaml, and [Snapcraft advanced grammar](/t/snapcraft-advanced-grammar/8349/2) to learn how to check for specific conditions for certain YAML keys.<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/the-snapcraft-format/8337'>the forum topic</a>.