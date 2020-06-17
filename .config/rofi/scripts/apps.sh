#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## browser : @adi1090x
## music : @adi1090x

rofi_command="rofi -theme themes/apps.rasi"
terminal_command="kitty -o initial_window_width=78c -o initial_window_height=78c --class kitfloat"

# Links
terminal=""
files="ﱮ"
editor=""
browser=""
music=""
settings="漣"

# Variable passed to rofi
options="$terminal\n$files\n$editor\n$browser\n$music\n$settings"

chosen="$(echo -e "$options" | $rofi_command -p "Most Used" -dmenu -selected-row 0)"
case $chosen in
    $terminal)
        $terminal_command &
        ;;
    $files)
        $terminal_command ranger &
        ;;
    $editor)
        $terminal_command nvim &
        ;;
    $browser)
        firefox &
        ;;
    $music)
        $terminal_command ncmpcpp &
        ;;
    $settings)
        xfce4-settings-manager &
        ;;
esac

