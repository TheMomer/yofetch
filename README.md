# Yofetch
Yofetch is a fast, minimal system fetch tool written in Go.

[![Yofetch with my config](screenshot.png)](configs/example_config_linux_glibc.lua)

![License](https://img.shields.io/github/license/TheMomer/yofetch?style=for-the-badge)
[![Latest version](https://img.shields.io/github/v/release/TheMomer/yofetch?display_name=release&include_prereleases&style=for-the-badge&label=Latest%20version)](https://github.com/TheMomer/yofetch/releases/latest)

![Forks](https://img.shields.io/github/forks/TheMomer/yofetch?style=for-the-badge)
![Stars](https://img.shields.io/github/stars/TheMomer/yofetch?style=for-the-badge)

Information about the API configuration can be found [here](LuaConfigInfo.md).

## Features
- Fast & portable
- Configurable via Lua API
- Minimal dependencies
- Cross-platform

> Dependencies: [pflag](https://github.com/spf13/pflag), [gopher-lua](https://github.com/yuin/gopher-lua)

# Platforms

![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Windows](https://custom-icon-badges.demolab.com/badge/Windows-0033a6.svg?logo=windows10&logoColor=white&style=for-the-badge)
![macOS](https://img.shields.io/badge/macOS-555555?style=for-the-badge&logo=apple&logoColor=white)
![FreeBSD](https://img.shields.io/badge/FreeBSD-red?style=for-the-badge&logo=freebsd)

- Linux x64: prebuilt binaries available.  
- Windows, macOS, FreeBSD: manual compilation required.

## Tested OS
- Linux:
  - Arch Linux x64 - all good
  - Debian 13 Trixie x64 - all good
- Windows:
  - Windows 10 22H2 x64 - all good
  - Windows 10 21H2 x64 - all good
  - Windows 8.1 build 9600 - all good (but PowerShell 4.0 and cmd do not support ANSI color codes)
  - Windows 7 SP1 x64 - not working ("Exception 0xc0000005")
  - Windows XP SP2 x64 - not working ("yofetch.exe is not a valid Win32 application")
- macOS:
  - macOS Sonoma 14.7.8 x64 - all good

### Note
- On Windows 10/11, run Yofetch in [Windows Terminal](https://github.com/microsoft/terminal), since cmd does not support ANSI color codes.
- On Linux/macOS, run Yofetch in modern terminal emulators with True Color support, since older terminals may not fully support ANSI color codes.

# Contributing
Pull requests are welcome - please keep speed and minimalism in mind.  
Report issues [here](https://github.com/TheMomer/yofetch/issues).
