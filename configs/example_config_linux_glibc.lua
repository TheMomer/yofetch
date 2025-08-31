local yo = require("Yofetch")
local separator = "{style.reset} - "
local accent = "{style.reset}{style.bold}{color.cyan}"

--yo.logo([[
--{color.cyan}      /\{style.reset}
--{color.cyan}     /  \{style.reset}
--{color.cyan}    /\   \{style.reset}
--{color.cyan}   /      \{style.reset}
--{color.cyan}  /   __   \{style.reset}
--{color.cyan} /   |  |  -\{style.reset}
--{color.cyan}/_-''    ''-_\{style.reset}
--
--]])
yo.padding(
    3,  -- Padding Right
    0,  -- Padding Left
    1   -- Padding Top
)
yo.mode("default")
-- yo.shell({"/bin/sh", "-c"})

local function parse_flag_value(input, flag)
    local pattern_with_value = "%-" .. flag .. "='(.-)'"
    local raw_value = input:match(pattern_with_value)

    if raw_value then
        if raw_value:find(",") then
            local values = {}
            for val in raw_value:gmatch("([^,%s]+)") do
                table.insert(values, val)
            end
            return values
        else
            return raw_value
        end
    end

    local pattern_flag_only = "%-" .. flag .. "%s"
    if input:find(pattern_flag_only) or input:match("%-" .. flag .. "$") then
        return true
    end

    return false
end

function weather_get(city, icon)
    city = city or "Moscow"

    if city == "Rostov-gon-Don" or city == "Rostov-gon-don" then
        city = "Rostov-on-Don"
    end
    
    if icon == "true" then
        format = "?format=%c+%C+%t+(%l)'"
    else
        format = "?format=%C+%t+(%l)'"
    end

    local result = yo.exec("curl -s 'wttr.in/" .. city .. format)
    return result:gsub("\n", "")
end

local birthday = yo.exec([==[
    bday_date=$(stat -c %W / | xargs -I{} date -d @{} '+%d %b %Y')
    bday_age="$(( ( $(date +%s) - $(stat -c %W /) ) / 86400 )) days"
    echo $bday_date \($bday_age\)
]==])
local wm = yo.exec([==[
    id=$(xprop -root -notype _NET_SUPPORTING_WM_CHECK)
    id=${id##* }
    wm=$(xprop -id "$id" -notype -len 100 -f _NET_WM_NAME 8t)
    wm=${wm/*WM_NAME = }
    wm=${wm/\"}
    wm=${wm/\"*}
    if [ "$wm" = "Metacity (Marco)" ]; then
        wm="Marco"
    elif [ "$wm" = "Hyprland :D" ]; then
        wm="Hyprland"
    fi
    echo $wm
]==])
local de = yo.exec([==[
    if pgrep -x "gnome-shell" >/dev/null; then
        de="GNOME"
    elif pgrep -x "plasmashell" >/dev/null; then
        de="KDE Plasma"
    elif pgrep -x "xfce4-session" >/dev/null; then
        de="Xfce4"
    elif pgrep -x "xfce5-session" >/dev/null; then
        de="Xfce5"
    elif pgrep -x "mate-session" >/dev/null; then
        de="MATE"
    elif pgrep -x "cinnamon" >/dev/null; then
        de="Cinnamon"
    elif pgrep -x "lxqt-session" >/dev/null; then
        de="LXQt"
    elif pgrep -x "budgie-desktop" >/dev/null; then
        de="Budgie"
    else
        if [ -n "$DESKTOP_SESSION" ]; then
            de="${DESKTOP_SESSION##*/}"
        elif [ -n "$XDG_CURRENT_DESKTOP" ]; then
            de="$XDG_CURRENT_DESKTOP"
        else
            de="Unknown DE"
        fi
    fi

    session_type="${XDG_SESSION_TYPE:-unknown}"

    if [ "$de" = "hyprland" ]; then
        echo "nah"
    elif [ "$de" = "i3" ]; then
        echo "nah"
    elif [ "$de" = "sway" ]; then
        echo "nah"
    else
        echo "$de (${session_type})"
    fi
]==])
local shell = yo.exec("ps -o comm= -p $(ps -o ppid= -p $(ps -o ppid= -p $$)) | sed 's/^-//'")
local dm = yo.exec([==[
    # For systemd only
    echo "$(basename $(readlink /etc/systemd/system/display-manager.service))"
]==]):gsub("%.service$", "")
local gpu = yo.exec([==[
    gpu=$(lspci | grep -i -E 'vga|3d|display' | cut -d ':' -f3- | sed 's/^ //')

    brand=""
    if [[ "$gpu" =~ AMD.*ATI ]]; then
        brand="AMD ATI"
    elif [[ "$gpu" =~ AMD ]]; then
        brand="AMD"
    elif [[ "$gpu" =~ ATI ]]; then
        brand="ATI"
    fi

    model=$(echo "$gpu" | grep -oP 'Radeon.*' | head -n1 | tr -d '[]')
    echo "$brand $model"
]==])
local cpu = yo.exec([==[
    cpu=$(grep -m1 'model name' /proc/cpuinfo | cut -d ':' -f2 | sed 's/^ //')
    cpu="${cpu//(TM)}"
    cpu="${cpu//(tm)}"
    cpu="${cpu//(R)}"
    cpu="${cpu//(r)}"
    cpu="${cpu//CPU}"
    cpu="${cpu//Processor}"
    cpu="${cpu//Dual-Core}"
    cpu="${cpu//Quad-Core}"
    cpu="${cpu//Six-Core}"
    cpu="${cpu//Eight-Core}"
    cpu="${cpu//[1-9][0-9]-Core}"
    cpu="${cpu//[0-9]-Core}"
    cpu="${cpu//, * Compute Cores}"
    cpu="${cpu//(\"AuthenticAMD\"*)}"
    cpu="${cpu//with Radeon * Graphics}"
    cpu="${cpu//, altivec supported}"
    cpu="${cpu//FPU*}"
    cpu="${cpu//Chip Revision*}"
    cpu="${cpu//Technologies, Inc}"
    cpu="${cpu//Core2/Core 2}"
    echo $cpu
]==])

local user_info = yo.exec("echo $(whoami)@$(uname -n)")

yo.print("{color.cyan}" .. user_info)
yo.print(accent .. string.rep("-", #user_info))

yo.print(accent .. "OS"         .. separator .. yo.exec(". /etc/os-release; echo $PRETTY_NAME"))
yo.print(accent .. "Kernel"     .. separator .. yo.exec("echo $(uname -r) $(uname -m)"))
yo.print(accent .. "Bday"       .. separator .. birthday)
if de ~= "nah" then
    yo.print(accent .. "DE"     .. separator .. de)
end
yo.print(accent .. "WM"         .. separator .. wm)
yo.print(accent .. "DM"         .. separator .. dm)
yo.print(accent .. "Shell"      .. separator .. shell)
yo.print(accent .. "Uptime"     .. separator .. yo.exec("echo $(uptime -p | sed 's/^up //')"))
yo.print(accent .. "CPU"        .. separator .. cpu)
yo.print(accent .. "GPU"        .. separator .. gpu)
yo.print(accent .. "Mem"        .. separator .. yo.exec([[free -k | awk '/Mem:/ {printf "%.1f GiB / %.1f GiB\n", $3/1048576, $2/1048576}']]))
yo.print(accent .. "Term"       .. separator .. yo.exec("ps -o comm= -p $(ps -o ppid= -p $(ps -o ppid= -p $(ps -o ppid= -p $$))) | sed 's/^-//'"))

local w_flag_value = parse_flag_value(yo.config_args, "w")
if type(w_flag_value) == "table" then
    yo.print(accent .. "Weather".. separator .. weather_get(w_flag_value[1], w_flag_value[2]))
end

yo.print(accent .. "Locale"     .. separator .. yo.exec("echo $LANG"))
yo.print("")
yo.print(
    "{color.black}███{color.red}███{color.green}███{color.yellow}███{color.blue}███{color.magenta}███{color.cyan}███{color.white}███{style.reset}\n"..
    "{color.black_light}███{color.red_light}███{color.green_light}███{color.yellow_light}" ..
    "███{color.blue_light}███{color.magenta_light}███{color.cyan_light}███{color.white_light}███{style.reset}\n"
)
