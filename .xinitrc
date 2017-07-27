# Swap caps lock and control :)
xmodmap -e "clear lock" "clear control" "add control = Caps_Lock Control_L Control_R" "keycode 66 = Control_L Caps_Lock NoSymbol NoSymbol"
xbindkeys
exec i3
#autocutsel -fork &
#autoctusel -selection PRIMARY -fork &
