#!/bin/bash

slack=(
    "${notification_defaults[@]}"
    update_freq=3
    icon=$ICON_CHAT
    script="$PLUGIN_DIR/slack.sh"
)

sketchybar --add item slack right        \
           --set slack "${slack[@]}"  \

