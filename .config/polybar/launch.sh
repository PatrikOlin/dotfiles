#!/usr/bin/env bash

killall -q polybar

echo "---" | tee -a /tmp/polybar_main.log
polybar main 2>&1 | tee -a /tmp/polybar_main.log & disown
polybar secondary 2>&1 | tee -a /tmp/polybar_secondary.log & disown

echo "Bars launched"
