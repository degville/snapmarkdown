The following plugins are currently supported by Snapcraft. See [Snapcraft plugins](snapcraft-plugins.md) for more details in how they're used, and to create your own, see [Writing local plugins](/t/writing-local-plugins/5125).

## Programming languages

### Go

| Plugin name | Description |
|--|--|
| [go](/t/the-go-plugin/8505) | integrates projects written in Go and using the *go get* package installer  |
| [godeps](/t/the-godeps-plugin/8506) | integrates projects written in Go and using the *godep* dependency tool |

### Java

| Plugin name | Description |
|--|--|
| [ant](/t/the-ant-plugin/8507) | Ant build system integration, commonly used by Java projects |
| [jdk](/t/the-jdk-plugin/8508) |  integrate projects written using the Java Development Kit (JDK) |
| [gradle](/t/the-gradle-plugin/5390) | integrate projects built using the Gradle build tool with your snaps |
| [maven](/t/the-maven-plugin/4282) | build system integration with *Maven*, commonly used by Java projects  |

### Node.js / JavaScript

| Plugin name | Description |
|--|--|
| [gulp](/t/the-gulp-plugin/8511) |  build parts from projects using the gulp.js streaming build system |
| [nodejs](/t/the-nodejs-plugin/8514) | create parts that use Node.js and/or the JavaScript package manager, npm |

### Python

| Plugin name | Description |
|--|--|
| [conda](/t/the-conda-plugin/12530) | used for parts incorporating the Conda open source package manager system |
| [python](/t/the-python-plugin/8529) | used for parts incorporating projects written with Python 2 or Python 3 |
| python2 | (deprecated in favour of the [python](/t/the-python-plugin/8529) plugin) |
| python3 |  (deprecated in favour of the [python](/t/the-python-plugin/8529) plugin)   |

### Other languages

| Plugin name | Description |
|--|--|
| [crystal](/t/the-crystal-plugin/12527) | build parts from projects written in the Ruby-like Crystal language |
| [dotnet](/t/the-dotnet-plugin/8584) | integrates with the Microsoft's .NET SDK to build core runtime parts  |
| [ruby](/t/the-ruby-plugin/8587) | built parts from projects written in Ruby and its Gemfile dependency bundler |
| [rust](/t/the-rust-plugin/8588) | build parts from projects written in Rust and using Cargo for dependency management  |

## Build tools

| Plugin name | Description |
|--|--|
| [autotools](/t/the-autotools-plugin/8616) | integrates projects that use the common Autotools suite with your snaps |
| [cmake](/t/the-cmake-plugin/8621) | integrates projects that use the common CMake build tool with your snaps  |
| [make](/t/the-make-plugin/8622) | integrates projects using the commonly found *make* build system |
| [meson](/t/the-meson-plugin/8623) | integrate projects build using the Meson build system into your snap |
| [qmake](/t/the-qmake-plugin/8628) | integrates projects using the qmake build tool, commonly by *Qt*-based projects |
| [scons](/t/the-scons-plugin/8629) | integrates projects that use the SCons construction tool |
| [waf](/t/the-waf-plugin/8630) | integrate projects using the Waf build automation tool |

## Platforms

### Linux kernel

| Plugin name | Description |
|--|--|
| [kbuild](/t/the-kbuild-plugin/8633) | build parts that use the Linux kernel build system (kBuild) |
| [kernel](/t/the-kernel-plugin/8642) | derived from the *kbuild* plugin and used to build your own kernel |

### Robot Operating System (ROS)

| Plugin name | Description |
|--|--|
| [ament](/t/the-ament-plugin/8643) | (deprecated in favour of the [colcon plugin](/t/the-colcon-plugin/11895)) |
| [catkin](/t/the-catkin-plugin/8644) | build catkin-based parts, typically used with version 1 of the Robot Operating System (ROS 1) |
| [catkin-tools](/t/the-catkin-tools-plugin/8645) | alternative method for building projects using version 1 of the Robot Operating System (ROS 1)  |
| [colcon](/t/the-colcon-plugin/11895) | build colcon-based parts, typically used with version 2 of the Robot Operating System (ROS 2)  |

## Tools

| Plugin name | Description |
|--|--|
| copy | (deprecated in favour of the [dump](/t/the-dump-plugin/8007) plugin) |
| [dump](/t/the-dump-plugin/8007) | simply dumps the contents from the specified source |
| [nil](/t/the-nil-plugin/8646) | useful for parts with no source to import |
| [plainbox-provider](/t/the-plainbox-provider-plugin/8647) | create parts containing a Plainbox test collection known as a *provider*  |
| tar-content |  (deprecated in favour of the [dump](/t/the-dump-plugin/8007) plugin) |<br><hr><br><div class='footer'>For questions and comments see <a href='https://forum.snapcraft.io/t/supported-plugins/8080'>the forum topic</a>.