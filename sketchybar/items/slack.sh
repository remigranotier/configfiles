#!/bin/sh

slack=(
    update_freq=3
    updates=on
    icon.drawing=on
    label.font="$FONT:Bold:14.0"
    script="$PLUGIN_DIR/slack.sh"
)

sketchybar --add item slack right        \
           --set slack "${slack[@]}"  \