# Yofetch Lua config info

## Functions
| Function name       | Value type           | Description                                  | Example                    |
|---------------------|----------------------|----------------------------------------------|----------------------------|
| `print(text)`       | Lua string           | Printing the text in information             | `print("Hello!")`          |
| `logo(logo)`        | Any Lua string       | Sets the logo                                |                            |
| `padding(r, l, t)`  | Lua int              | Sets indents: right, left, top               | `padding(3, 0, 1)`         |
| `mode(value)`       | Lua string           | Sets the mode                                | `mode("default")`          | 
| `shell({...})`      | Lua table            | Sets the path to the shell and its arguments | `shell({"/bin/sh", "-c"})` |
| `exec(command)`     | Any Lua string       | Executes the command and returns the result  | `exec("uptime")`           |

## Variables
| Variable name        | Value type       | Description                               |
|----------------------|------------------|-------------------------------------------|
| `version`            | Lua string       | Stores a version of Yofetch               |
| `default_mode`       | Lua int          | Stores a default mode                     |
| `config_args`        | lua string       | Config arguments passed via `-a` CLI flag |

## Colors
| Color ID                | Color type     |
|-------------------------|----------------|
| `{color.black}`         | Black          |
| `{color.red}`           | Red            |
| `{color.green}`         | Green          |
| `{color.yellow}`        | Yellow         |
| `{color.blue}`          | Blue           |
| `{color.magenta}`       | Magenta        |
| `{color.cyan}`          | Cyan           |
| `{color.white}`         | White          |
| `{color.black_light}`   | Light Black    |
| `{color.red_light}`     | Light Red      |
| `{color.green_light}`   | Light Green    |
| `{color.yellow_light}`  | Light Yellow   |
| `{color.blue_light}`    | Light Blue     |
| `{color.magenta_light}` | Light Magenta  |
| `{color.cyan_light}`    | Light Cyan     |
| `{color.white_light}`   | Light White    |

## Styles
| Style ID                   | Style type         |
|----------------------------|--------------------|
| `{style.reset}`            | Reset              |
| `{style.bold}`             | Bold               |
| `{style.faint}`            | Faint              |
| `{style.italic}`           | Italic             |
| `{style.underline}`        | Underline          |
| `{style.blink}`            | Blink (slow)       |
| `{style.blink_fast}`       | Blink (fast)       |
| `{style.reverse}`          | Reverse video      |
| `{style.hidden}`           | Hidden             |
| `{style.strikethrough}`    | Strikethrough      |
| `{style.double_underline}` | Double Underline   |
| `{style.overline}`         | Overline           |


# How to create config
1) Create a file with a .lua extension in any folder (for example, config.lua in the root folder with yofetch)
2) Import the `Yofetch` module in the config:
```lua
local yo = require("Yofetch")
```
3) Use the available functions/variables through the imported `yo`:
```lua
yo.logo([[
{style.bold}{color.white}  /\{style.reset}
{style.bold}{color.white} /  \{style.reset}
{style.bold}{color.white} ----{style.reset}
]])
yo.padding(3, 0, 0)
yo.mode("default")
yo.shell({"/bin/sh", "-c"})

yo.print("{style.italic}{color.red}" .. "OS{style.reset}: " .. yo.exec(". /etc/os-release; echo $PRETTY_NAME $(uname -m)"))
yo.print("{style.italic}{color.red}" .. "Kernel{style.reset}: " .. yo.exec("echo $(uname -r)"))
yo.print("{style.italic}{color.red}" .. "Uptime{style.reset}: " .. yo.exec("echo $(uptime -p | sed 's/^up //')"))
yo.print("{style.italic}{color.red}" .. "Mem{style.reset}: " .. yo.exec([[
    free -k | awk '/Mem:/ {printf "%.1f GiB / %.1f GiB\n", $3/1048576, $2/1048576}'
]]))
```

### This is just a sample config, you can supplement it with your imagination.