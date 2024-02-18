#!/bin/bash

# kill existing instances
killall -q polybar

# launch config
polybar catppuccin 2>&1 | tee -a /tmp/polybar.log & disown
