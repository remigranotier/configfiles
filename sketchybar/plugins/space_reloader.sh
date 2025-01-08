#!/usr/bin/env bash

reload_workspace_icon() {
  # echo reload_workspace_icon "$@" >> ~/aaaa
  apps=$(aerospace list-windows --workspace "$@" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

  icon_strip=" "
  if [ "${apps}" != "" ]; then
    while read -r app
    do
      APP_INFO=$(lsappinfo info -only StatusLabel `lsappinfo find LSDisplayName=$app`)
      APP_COUNT=
      regex="\"StatusLabel\"=\{ \"label\"=\"(.*)\" }"
      if [[ $APP_INFO =~ $regex ]]
      then
        APP_COUNT="${BASH_REMATCH[1]}"   # same thing stored in a variable
      fi
      icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$app") $APP_COUNT"
    done <<< "${apps}"
  else
    icon_strip=" —"
  fi

  sketchybar --animate sin 1 --set space.$@ label="$icon_strip"
}

for m in $(aerospace list-monitors | awk '{print $1}'); do
  for i in $(aerospace list-workspaces --monitor $m); do
    reload_workspace_icon $i
  done
done