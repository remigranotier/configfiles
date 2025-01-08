#!/bin/bash

calendar=(
  icon=􀐫
  icon.font="$FONT:Black:12.0"
  label.font="SF Mono:Semibold:13.0"
  icon.padding_right=5
  label.align=left
  padding_left=3
  update_freq=1
  script="$PLUGIN_DIR/calendar.sh"
  click_script="$PLUGIN_DIR/zen.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
