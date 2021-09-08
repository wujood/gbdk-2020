# GBDK-2020
[GBDK](http://gbdk.sourceforge.net/) A C compiler, assembler, linker and set of libraries for the Z80 like Nintendo Gameboy.

## Releases

<a href="https://github.com/gbdk-2020/gbdk-2020/releases/latest/download/gbdk-win.zip"><img src="https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white" alt="Windows"></a>
<a href="https://github.com/gbdk-2020/gbdk-2020/releases/latest/download/gbdk-linux64.tar.gz"><img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" alt="Linux"></a>
<a href="https://github.com/gbdk-2020/gbdk-2020/releases/latest/download/gbdk-macos.zip"><img src="https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=apple&logoColor=white" alt="MacOS"></a>
<a href="https://hub.docker.com"><img src="https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white" alt="Docker"></a>

Upgrading to a new version? Check the [Migration notes](https://gbdk-2020.github.io/gbdk-2020/docs/api/docs_migrating_versions.html). You can find older versions [here](https://github.com/gbdk-2020/gbdk-2020/releases).

## Current status
[![GBDK Build and Package](https://github.com/gbdk-2020/gbdk-2020/actions/workflows/gbdk_build_and_package.yml/badge.svg?branch=develop)](https://github.com/gbdk-2020/gbdk-2020/actions/workflows/gbdk_build_and_package.yml)
- updated CRT and library that suits better for game development
- the latest nightlies of **sdcc** (the compiler and toolchain) are used from [sourceforge](http://sdcc.sourceforge.net). At the moment of writing this the last stable version is 4.1.0, which is missing features from newer SDCC builds that GBDK-2020 uses. Please use one of the nightlies available [here](http://sdcc.sourceforge.net/snap.php) (we used 4.1.6 #12439)
- The compiler driver **lcc** supports the latest sdcc toolchain.

For full list of changes see the [ChangeLog](https://github.com/gbdk-2020/gbdk-2020/blob/master/gbdk-support/ChangeLog) file

## Docs
Online documentation is avaliable [HERE](https://gbdk-2020.github.io/gbdk-2020/docs/api)

A good place to start is the [Getting Started Section](https://gbdk-2020.github.io/gbdk-2020/docs/api/docs_getting_started.html).

Check the [Links and Third-Party Tools Section](https://gbdk-2020.github.io/gbdk-2020/docs/api/docs_links_and_tools.html) for a list of recommended emulators, graphics tools, music drivers and more.

## Origin

Over the years people have been complaining about all the issues caused by a very old version of SDCC (the compiler). This is a proper attempt of updating it while also keeping all the old functionallity working, like support for banked code and data and so on

The last version in the OLD repo is [2.96](https://sourceforge.net/projects/gbdk/files/gbdk/2.96/) although releases are available until 2.95-3. Version [2.96](https://sourceforge.net/projects/gbdk/files/gbdk/2.96/) is the starting point of this repo

## Usage
Most users will only need to download and unzip the latest [release](https://github.com/gbdk-2020/gbdk-2020/releases)

Then go to the examples folder and build them (with compile.bat on windows or running make). They are a good starting point.

## Discord servers
* [gbdk/zgb Discord](https://discord.gg/XCbjCvqnUY) - For help with using GBDK (and ZGB), discussion and development of gbdk-2020
* [gbdev Discord](https://discordapp.com/invite/tKGMPNr) - There is a #gbdk channel and also people with a lot of Game Boy development knowledge

For SDCC you can check its [website](http://sdcc.sourceforge.net/) and the [manual](http://sdcc.sourceforge.net/doc/sdccman.pdf)

[The Game Boy Development Forum](https://gbdev.gg8.se/forums/) is a good place to search for answers. 


## Build instructions
Unless you are interested on recompiling the sources for some reason (like fixing some bugs) **you don't need to build GBDK**

- **Windows only**: Download and install [mingw](http://mingw-w64.org/)
- Clone, download this repo or just get the source form the [releases](https://github.com/gbdk-2020/gbdk-2020/releases)
- Download and install [**sdcc nightlies from 4.1.6 #12439 onwards**](http://sdcc.sourceforge.net/snap.php) (SDCC is no longer part of GDDK so you need to download it (just the binaries) in the platform you need)
- On Linux **don't use package managers** The latest release available won't work, you need to compile or download one of the nightlies
- Create **SDCCDIR** environment variable, that points into the folder, where you installed sdcc
- Open command prompt or a terminal, go to the root directory of the repo and run **make**
