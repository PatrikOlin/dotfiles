#!/usr/bin/env bash

xclip -sel c -o | jq "." | xclip -sel c 
