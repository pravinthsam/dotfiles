xrandr --auto
~/scripts/screens.sh

xrdb ~/.Xresources

DEFAULTSESSION=i3

case "$1" in
  i3) exec i3 ;;
  *) exec $DEFAULTSESSION ;;
esac
