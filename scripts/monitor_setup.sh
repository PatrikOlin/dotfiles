#!/usr/bin/env bash

d1=0
d2=0
d3=0
d4=0
i=0

query=`bspc query -M --names`
read -a monitors <<<$query

if [[ ${#monitors[@]} == 1 ]]; then
  for monitor in ${monitors[@]}; do
    bspc monitor ${monitors[0]} -d 1 2 3 4 5 6 7 8
  done
else
  for monitor in ${monitors[@]}; do
    let d1=${i}*4+1
    let d2=${i}*4+2
    let d3=${i}*4+3
    let d4=${i}*4+4
    bspc monitor $monitor -d $d1 $d2 $d3 $d4
    let i++
  done
fi
