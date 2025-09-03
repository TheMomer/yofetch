# yofetch
yofetch is a fast, minimal system fetch tool written in go

[![yofetch with my config](screenshot.png)](configs/example_config_linux_glibc.lua)

![license](https://img.shields.io/github/license/TheMomer/yofetch?style=for-the-badge)
[![latest version](https://img.shields.io/github/v/release/TheMomer/yofetch?display_name=release&include_prereleases&style=for-the-badge&label=Latest%20version)](https://github.com/TheMomer/yofetch/releases/latest)

![forks](https://img.shields.io/github/forks/TheMomer/yofetch?style=for-the-badge)
![stars](https://img.shields.io/github/stars/TheMomer/yofetch?style=for-the-badge)

information about the API configuration can be found [here](LuaConfigInfo.md)

## features
- fast & portable
- configurable via lua api
- minimal dependencies
- cross-platform

> dependencies: [pflag](https://github.com/spf13/pflag), [gopher-lua](https://github.com/yuin/gopher-lua)

# platforms

![linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![windows](https://custom-icon-badges.demolab.com/badge/Windows-0033a6.svg?logo=windows10&logoColor=white&style=for-the-badge)
![macOS](https://img.shields.io/badge/macOS-555555?style=for-the-badge&logo=apple&logoColor=white)
![freebsd](https://img.shields.io/badge/FreeBSD-red?style=for-the-badge&logo=freebsd)

- linux x64: prebuilt binaries available
- windows, macOS, freebsd: manual compilation required

## note
- on windows 10/11, run yofetch in [Windows Terminal](https://github.com/microsoft/terminal), since cmd does not support ansi color codes
- on linux/macOS, run yofetch in modern terminal emulators with true color support, since older terminals may not fully support ansi color codes

# contributing
pull requests are welcome - please keep speed and minimalism in mind
report issues [here](https://github.com/TheMomer/yofetch/issues)
