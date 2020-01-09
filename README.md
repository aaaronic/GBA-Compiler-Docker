# Docker GBA Complier
Windows people have had a particularly rough time getting up and running with GBA development.
Since installing cygwin + devkitPro, updating system paths, and updating the Makefile to match
has proven difficult time and time again, this Dockerfile + Makefile represents an attempt to
unify things cross-platform in a less brittle way.

## Requirements
Docker for Desktop:
* Windows 10 (Pro only): https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe
  - Note: Docker for Windows currently uses a feature (Hyper-V) that makes it completely incompatible with VirtualBox version 5 and older (6 is supposedly okay).
- Window Home: https://github.com/docker/toolbox/releases/download/v19.03.1/DockerToolbox-19.03.1.exe
  - Note: I haven't tested this option yet...
- Mac: https://download.docker.com/mac/stable/Docker.dmg

Ths following `docker build` command is no longer required, since the
image is now available on Docker Hub as aaaronic/gba-compiler:1.0.

Once docker is installed, you could choose to do a one-time build of the Dockerfile on your machine (*from the folder containing the `Dockerfile`*):

```
    docker build . -t gba-compiler
```
A few minutes later, you should have a docker image named gba-compiler that you should not
need to rebuild (hopefully ever again). It might spend a long time on the "Generating pacman
keyring master key..." step).

## Running a build (aka, compiling your GBA project)
1. The provided Makefile needs to be in your GBA project's directory (next to all your `.h` and
`.c` files).
   - You should (hopefully) not need to change much about the Makefile aside from the
`PRODUCT_NAME` line. It defaults to "Project", which leads to your resulting `.gba` file
being named `Project.gba`. Feel free to change it to anything _without spaces or special characters_ (ex: "BouncingBox"). You can always rename the resulting file after the compilation instead.

2. Run the docker image we built above with the following special sauce:

```
    docker run --rm -it -v ${PWD}:/gba aaaronic/gba-compiler:1.0
```
or, alternatively (if you chose to do your own `docker build` locally):
```
    docker run --rm -it -v ${PWD}:/gba gba-compiler
```

If the compilation succeeded, you should now see a `Project.gba` (or whatever you renamed it
to) in your project's folder.

## Setting it and forgetting it for a project in Visual Studio Code
Copy the included `.vscode` folder (containing `tasks.json`) into your project folder.
Update `tasks.json`'s "build" command to point to your visualboyadvance-m installation:

Windows example:
```
    "command": "C:/Users/Aaron/Desktop/visualboyadvance-m.exe ./Project.gba",
```
Mac Example:
```
    "command": "open /path/to/visualboyadvance-m.app ./Project.gba",
```

Note: If you've renamed `Project.gba`, you should fix that part of the command as well.
Also Note: if you did a local `docker build` and want to use that image,
update the docker commands for build and clean accordingly (basically
just remove the "aaaronic/" and the ":1.0").

Once that's all set up and happy, the Terminal -> Run Build Task... command in the menu
should now compile your project and open the emulator with the result (if the compile
succeeds).

Terminal -> Run Task should provide 3 options:
- **build run**: build and run the project
- **build**: just build the project (but don't run anything).
- **clean**: remove all the intermediate files from builds so the next build is _from
 scratch_. This is helpful if something buggy is going on or if you've only changed header
 files and aren't seeing your expected changes in the build.

## Acknowledgements
The provided Dockerfile is a fork/combination of the Dockerfiles provided by devkitPro:
https://github.com/devkitPro/docker. I have included the GPLv3 License in this repository
to match theirs, as this work is derivative.

The example main.c is a nice little demo and I have no clue where it came from. I will
provide an acknowledgement here once I know its original author.
