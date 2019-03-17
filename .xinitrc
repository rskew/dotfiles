xbindkeys

xrdb -merge ~/.Xresources
xmodmap ~/.Xmodmap

#xrandr --output VGA1 --primary

xset s off
xset -dpms
xset s noblank 
#exec xautolock -time 15 -locker /home/rowan/documents/code/scripts/lock.sh -corners -000 &
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

exec nm-applet &
exec redshift &

feh --bg-scale ~/Pictures/jupyter_near_north_pole.jpg &
xcompmgr -c &

emacs --daemon &

xmonad
