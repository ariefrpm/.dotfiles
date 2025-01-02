#!/bin/env/bash

date=(
  icon=􀀁
  icon.drawing=off
  icon.font.size=6
  icon.padding_right=1
  icon.color=$(getcolor yellow)          
  icon.y_offset=1.5
  label.font="$FONT:Semibold:9"
  label.padding_left=8
  y_offset=5                         
  width=0                            
  update_freq=60                     
  script='sketchybar --set $NAME label="$(date "+%a, %b %d")"'
  click_script="open -a Calendar.app"
)

clock=(
  "${menu_defaults[@]}"
  icon.drawing=off          
  label.padding_right=6
  label.color=$LABEL_COLOR
  label.font="$FONT:Bold:12"
  update_freq=10            
  popup.align=right
  script="$PLUGIN_DIR/nextevent.sh"
  click_script="sketchybar --set clock popup.drawing=toggle; open -a Calendar.app"
)

calendar_popup=(
  icon.drawing=off
  label.padding_left=0
  label.max_chars=32
  label.scroll_duration=100
)

sketchybar                                      \
  --add item clock right                        \
  --set clock "${clock[@]}"                     \
  --subscribe clock system_woke                 \
                    mouse.entered               \
                    mouse.exited                \
                    mouse.exited.global         \
  --add item clock.next_event popup.clock       \
  --set clock.next_event "${menu_item_defaults[@]}" "${calendar_popup[@]}"
