# Swap caps lock and control :)
xmodmap -e "clear lock" \
        "clear control" \
        "add control = Caps_Lock Control_L Control_R" \
        "keycode 66 = Control_L Caps_Lock NoSymbol NoSymbol" \
        "keycode 0x42 = Escape"

xbindkeys

xrdb -merge ~/.Xresources

xrandr --output VGA1 --primary

exec xautolock -time 15 -locker /home/rowan/documents/code/scripts/lock.sh -corners -000 &
#autocutsel -fork &
#autoctusel -selection PRIMARY -fork &

trayer --edge bottom \
       --align right \
       --SetDockType true \
       --SetPartialStrut true \
       --expand true \
       --width 4 \
       --transparent true \
       --tint 0x000000 \
       --height 20 \
       --monitor "primary" &
#stalonetray --grow-gravity SE &

exec nm-applet &
exec redshift &

#exec /home/rowan/.fehbg &

#exec i3
xmonad

emacs --daemon
