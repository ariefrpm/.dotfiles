#!/bin/bash

# Load defined icons
source "$CONFIG_DIR/icons.sh"

# Load defined colors
source "$CONFIG_DIR/colors.sh"

PADDINGS=6
FONT="JetBrainsMono Nerd Font"
#FONT="MesloLGM Nerd Font"

# Bar Appearance
bar=(
  color=$BAR_COLOR
  position=top
  topmost=off
  sticky=on
  height=40
  padding_left=4
  padding_right=4
  corner_radius=0
  blur_radius=0
  notch_width=170
)

# Item Defaults
item_defaults=(
  background.padding_left=$(($PADDINGS / 2))
  background.padding_right=$(($PADDINGS / 2))
  background.height=20
  icon.padding_left=0
  icon.padding_right=0
  icon.background.corner_radius=4
  icon.font="$FONT:Regular:15"
  icon.color=$ICON_COLOR
  icon.highlight_color=$HIGHLIGHT
  label.font="$FONT:Regular:14"
  label.color=$LABEL_COLOR
  label.highlight_color=$HIGHLIGHT
  label.padding_left=$(($PADDINGS / 2))
  updates=when_shown
  scroll_texts=on
  background.corner_radius=4
)

icon_defaults=(
  label.drawing=off
)

notification_defaults=(
  updates=on
  update_freq=300
  background.padding_left=$PADDINGS
  background.padding_right=$PADDINGS
  label.drawing=off
)

bracket_defaults=(
  background.color="$(getcolor grey 50)"
)

menu_defaults=(
  popup.blur_radius=32
  popup.background.color=$POPUP_BACKGROUND_COLOR
  popup.background.corner_radius=$PADDINGS
  popup.background.shadow.drawing=on
  popup.background.shadow.color=$(getcolor black 50)
  popup.background.shadow.angle=90
  popup.background.shadow.distance=16
)

menu_item_defaults=(
  label.font="$FONT:Regular:12"
  padding_left=$PADDINGS
  padding_right=$PADDINGS
  icon.padding_left=0
  icon.padding_right=4
  icon.color=$HIGHLIGHT
  background.color=$TRANSPARENT
  scroll_texts=on
)

separator=(
  background.height=1
  width=180
  background.color="$(getcolor white 25)"
  background.y_offset=-16
)