#!#!/bin/bash

source "$CONFIG_DIR/globalstyles.sh"

SLACK_INFO=$(lsappinfo info -only StatusLabel `lsappinfo find LSDisplayName=Slack`)
COUNT=${SLACK_INFO:25:1}

if [ $COUNT = "•"  ]; then
  DRAWING=off
  COLOR=$LABEL_COLOR
else
  DRAWING=on
  COLOR=$(getcolor red)
fi


#sketchybar --set slack label.drawing=$DRAWING label="${COUNT}"
sketchybar --animate tanh 20 --set slack label.drawing=$DRAWING label=$COUNT icon.color=$COLOR
