@page docs_supported_consoles Supported Consoles & Cross Compile
  
@anchor docs_consoles_supproted_list
# Consoles Supported by GBDK
As of version `4.0.5` GBDK includes support for other consoles in addition to the Game Boy. 

  - Nintendo Game Boy / Game Boy Color
  - Analogue Pocket
  - Sega Master System
  - Sega Game Gear

While the GBDK API has many convenience functions that work the same or similar across different consoles, it's important to keep their different capabilities in mind when writing code intended to run on more than one. Some (but not all) of the differences are screen sizes, color abilities, memory layouts, processor type (z80 vs gbz80/sm83) and speed.

 
@anchor docs_consoles_compiling
# Cross Compiling for Different Consoles

## lcc
When compiling and building through @ref lcc use the `-m<port>:<plat>` flag to select the desired console via it's port and platform combination.


## sdcc
When compiling directly with @ref sdcc use: `-m<port>`, `-D__PORT_<port>` and `-D__TARGET_<plat> `


## Console Port and Platform Settings
  - Nintendo Game Boy / Game Boy Color
    - @ref lcc : `-mgbz80:gb`
    - port:`gbz80`, plat:`gb`
  - Analogue Pocket
    - @ref lcc : `-mgbz80:ap`
    - port:`gbz80`, plat:`ap`
    - Note: The Analogue Pocket is functionally identical to the Game Boy / Color, but has a couple altered register flag / address definitions and a different boot logo.

  - Sega Master System
    - @ref lcc : `-mz80:sms`
    - port:`z80`, plat:`sms`
  - Sega Game Gear
    - @ref lcc : `-mz80:gg`
    - port:`z80`, plat:`gg`


# Platform constants
There are several constant \#defines that can be used to help select console specific code during compile time (with `#ifdef`, `#ifndef`) .

  - When `<gb/gb.h>` is included (either directly or through `<gbdk/platform.h>`)
    - When building for Game Boy:
      - `NINTENDO` will be \#defined
      - `GAMEBOY` will be \#defined
    - When building for Analogue Pocket
      - `NINTENDO` will be \#defined
      - `ANALOGUEPOCKET` will be \#defined

  - When `<sms/sms.h >` is included (either directly or through `<gbdk/platform.h>`)
    - When building for Master System
      - `SEGA` will be \#defined
      - `MASTERSYSTEM` will be \#defined
    - When building for Game Gear
      - `SEGA` will be \#defined
      - `GAMEGEAR` will be \#defined


# Using <gbdk/...> headers
Some include files under `<gbdk/..>` are cross platform and others allow the build process to auto-select the correct include file for the current target port and platform (console).

For example, the following can be used
    
    #include <gbdk/platform.h>
    #include <gbdk/metasprites.h>

Instead of

    #include <gb/gb.h>
    #include <gb/metasprites.h>

and

    #include <sms/sms.h>
    #include <sms/metasprites.h>


@anchor docs_consoles_cross_platform_examples
# Cross Platform Example Projects
GBDK includes an number of cross platform example projects. These projects show how to write code that can be compiled and run on multiple different consoles (for example Game Boy and Game Gear) with, in some cases, minimal differences. 

They also show how to build for multiple target consoles with a single build command and `Makefile`. The `Makefile.targets` allows selecting different `port` and `plat` settings when calling the build stages.
