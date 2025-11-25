# Docker GBA Complier
Windows people have had a particularly rough time getting up and running with GBA development.
Since installing cygwin + devkitPro, updating system paths, and updating the Makefile to match
has proven difficult time and time again, this Dockerfile (+ default Makefile) represents an
attempt to unify things cross-platform in a less brittle way.

If you're using the latest version, note that the `gcc` version included in the 1.3+ container
is significantly stricter than the older version. `-fpermissive` and similar options may need
to be added to the `CFLAGS` definition in your fork of the example Makefile.

## Requirements
Docker for Desktop: https://www.docker.com/products/docker-desktop/

Note: Even if you can't get Docker running locally, I now have instructions for how to leverage the docker container from this repo via GitHub Actions! If you're in that camp, please see: [docs/UsingGitHubActions.md](docs/UsingGitHubActions.md)


## Building your own Docker Container (not required)
Ths following `docker build` command is only required if you plan to create your own version of this docker container. The one in this repo is available on Docker Hub as `aaaronic/gba-compiler:1.3.1`.

Once docker is installed, you could choose to do a one-time build of the Dockerfile on your machine (*from the folder containing the `Dockerfile`*):

```
    docker build . -t gba-compiler
```
A few minutes later, you should have a docker image named gba-compiler that you should not
need to rebuild (hopefully ever again).

## Running a GBA project build (aka, compiling your GBA project)
1. Run from your GBA project's directory (with all your `.h` and `.c` files).i
  - You can optionally provide your own Makefile (ideally based on the one in this repo)
2. Run the docker image we built above with the following special sauce:

```
    docker run --rm -it -v ${PWD}:/gba aaaronic/gba-compiler:1.3.1
```
or, alternatively (if you chose to do your own `docker build` locally):
```
    docker run --rm -it -v ${PWD}:/gba gba-compiler
```

If the compilation succeeded, you should now see a `my_project.gba` (or whatever you renamed it
to) in your non-default Makefile.

## Setting it and forgetting it for a project in Visual Studio Code
Copy the included `.vscode` folder (containing `tasks.json`) into your project folder.
Update `tasks.json`'s "build" command to point to your mGBA installation:

Windows example:
```
    "command": "C:/Users/Aaron/Desktop/mGBA.exe ./my_project.gba",
```
Mac Example:
```
    "command": "open -a /Applications/mGBA.app ./my_project.gba",
```

Note: If you've renamed `my_project.gba`, you should fix that part of the command as well.
Also Note: if you did a local `docker build` and want to use that image,
update the docker commands for build and clean accordingly (basically
just remove the "aaaronic/" and the ":1.3.1").

Once that's all set up and happy, the Terminal -> Run Build Task... command in the menu
should now compile your project and open the emulator with the result (if the compile
succeeds).

Terminal -> Run Task should provide 3 options:
- **run**: build and run the project
- **build**: just build the project (but don't run anything).
- **clean**: remove all the intermediate files from builds so the next build is _from
 scratch_. This is helpful if something buggy is going on or if you've only changed header
 files and aren't seeing your expected changes in the build.
- **audio**: convert .wav files (8-bit format) to .c / .h files.

## Acknowledgements
The provided Dockerfile is a fork/combination of the Dockerfiles provided by devkitPro:
https://github.com/devkitPro/docker. I have included the GPLv3 License in this repository
to match theirs, as this work is derivative.

The example main.c is a nice little demo and I have no clue where it came from. I will
provide an acknowledgement here once I know its original author.
