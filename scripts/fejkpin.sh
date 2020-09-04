curl https://api.fejk.company/v1/people | jq '.[] | .pin' | sed 's/"//g' | xclip -selection c
