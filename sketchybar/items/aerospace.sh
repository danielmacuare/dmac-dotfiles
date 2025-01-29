#!/bin/bash

source ../colors.sh
sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        background.color=$ACCENT_COLOR \
        background.corner_radius=5 \
        background.height=20 \
        label="$sid" \
        label.padding_right=20 \
        label.y_offset=-1 \
        click_script="aerospace workspace $sid" \
        script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done
