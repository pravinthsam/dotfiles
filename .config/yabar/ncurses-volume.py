import urwid
import subprocess
import re

def on_key_press(key):
    global currentvol
    if key=='up':
        subprocess.check_output("amixer -q set Master 1%+ unmute".split(' '))
        currentvol = find_volume()
        loop.widget = urwid.Filler(generate_widget(currentvol))
    if key=='down':
        subprocess.check_output("amixer -q set Master 1%- unmute".split(' '))
        currentvol = find_volume()
        loop.widget = urwid.Filler(generate_widget(currentvol))
    if key=='esc':
        raise urwid.ExitMainLoop()

def generate_widget(vol):
    numrows = 10
    txt = ['o' if vol>100 - (i+1)*100/numrows else '.' for i in range(numrows)]
    txt = [urwid.Text(t) for t in txt]
    txt.append(urwid.Text(str(vol)))
    pile = urwid.Pile(txt)
    
    return pile

def find_volume():
    proc_output = subprocess.check_output("pactl list sinks | grep '^[[:space:]]Volume:' |  head -n $(( $SINK + 1 )) | tail -n 1 ", shell=True)
    currentvol = int(re.findall('([0-9]+)\%', proc_output.decode('ASCII'))[0])
    return currentvol

currentvol = find_volume()
top = generate_widget(currentvol)
loop = urwid.MainLoop(urwid.Filler(top), unhandled_input=on_key_press)
loop.run()
