#!/bin/bash

SLACK_INFO=$(lsappinfo info -only StatusLabel `lsappinfo find LSDisplayName=Mail`)
COUNT=${SLACK_INFO:25:1}

if [ $COUNT = "a" ]; then
  DRAWING=off
else
  DRAWING=on
fi

sketchybar --set slack drawing=$DRAWING label="Slack (${COUNT})"