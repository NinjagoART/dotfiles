#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

style="$($HOME/.config/rofi/applets/applets/style.sh)"

dir="$HOME/.config/rofi/applets/applets/configs/$style"
rofi_command="rofi -theme $dir/screenshot.rasi"

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "Please install 'scrot' first."
}

# Options
screen=""
area=""
window=""

# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -p 'scrot' -dmenu -selected-row 1)"
case $chosen in
    $screen)
		if [[ -f /usr/bin/scrot ]]; then
                  sleep 1; scrot $name_screen -e 'mv $f $$(xdg-user-dir PICTURES)/Capturas ; xclip -selection clipboard -t image/png -i $$(xdg-user-dir PICTURES)/Capturas/$f; viewnior $$(xdg-user-dir PICTURES)/Capturas/$f' 
		else
			msg
		fi
        ;;
    $area)
		if [[ -f /usr/bin/scrot ]]; then
			scrot -s $name_screen -e 'mv $f $$(xdg-user-dir PICTURES)/Capturas ; xclip -selection clipboard -t image/png -i $$(xdg-user-dir PICTURES)/Capturas/$f; viewnior $$(xdg-user-dir PICTURES)/Capturas/$f'
		else
			msg
		fi
        ;;
    $window)
		if [[ -f /usr/bin/scrot ]]; then
			sleep 1; scrot -u $name_screen -e 'mv $f $$(xdg-user-dir PICTURES)/Capturas ; xclip -selection clipboard -t image/png -i $$(xdg-user-dir PICTURES)/Capturas/$f; viewnior $$(xdg-user-dir PICTURES)/Capturas/$f'
		else
			msg
		fi
        ;;
esac

