#!/bin/bash

get_desc() {
	curl -X POST "https://aztro.sameerkumar.website/?sign={$1}&day=today" | jq '.description' | sed 's/\"//g' >> ~/horoscopes
}

for i in aries taurus gemini cancer leo virgo libra scorpio sagittarius capricorn aquarius pisces

do
	get_desc $i
done
