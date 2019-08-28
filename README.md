# Docker GBA Complier
Windows people have had a particularly rough time getting up and running with GBA development.
Since installing cygwin + devkitPro, updating system paths, and updating the Makefile to match
has proven difficult time and time again, this Dockerfile + Makefile represents an attempt to
unify things cross-platform in a less brittle way.

## Requirements
Docker for Desktop:
* Windows: https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe
  - Note: Docker for Windows currently uses a feature (Hyper-V) that makes it completely incompatible with VirtualBox version 5 and older (6 is supposedly okay).
- Mac: https://download.docker.com/mac/stable/Docker.dmg

Once docker is installed, you need to do a one-time build of the Dockerfile on your machine (*from the folder containing the `Dockerfile`*):

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
2. Run the docker image we build in the 