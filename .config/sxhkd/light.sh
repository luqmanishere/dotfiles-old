#!/usr/bin/bash

level=$1
msgId=12833

if [ $# != 2 ]; then
  echo "USAGE: $0 [-A -U] [brightness_level% (0 to 100)]"
  exit 1
fi

light $1 $2
dunstify -a "Brightness" -u low -r "$msgId" \
  Brightness: $(light -G)

# "Volume: ${volume}%" "$(getProgressString 10 "<b> </b>" " " $volume)"
