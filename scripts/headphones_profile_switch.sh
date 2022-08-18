#!/usr/bin/env bash

function get_headphones_index() {
    echo $(pacmd list-cards | grep bluez_card -B1 | grep index | awk '{print $2}')
}

function set_a2dp_profile() {
    local profile=${1}
    pacmd set-card-profile $(get_headphones_index) ${profile}
}

function main() {
    set_a2dp_profile "a2dp_sink"
}

main
