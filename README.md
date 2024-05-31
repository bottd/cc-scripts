# Computer Craft
This repo houses scripts for [CC: Tweaked](https://tweaked.cc/), a fork of the original [ComputerCraft](https://computercraft.info/wiki/Main_Page). Scripts are written in Fennel or Lua.

## Getting Started

To build and run scripts you need the Fennel compiler. This can be installed with [Luarocks](https://luarocks.org/)

```luarocks install fennel```

From here you can build using the Makefile by running `make` and clean the `/build` directory with `make clean`.

## Automation

On push to `main` all `.fnl` files will be compiled to Lua code and pushed to the `build` branch
