#!/bin/bash

get_person_key() {	
	curl --silent --show-error https://api.fejk.company/v1/people | jq ".[] | .$1" | sed 's/"//g' | xclip -selection c
}

get_company_key() {	
	curl --silent --show-error https://api.fejk.company/v1/companies | jq ".[] | .$1" | sed 's/"//g' | xclip -selection c
}

while getopts ":c:p:" opt; do
	case ${opt} in
		c)
			get_company_key $OPTARG
			;;
		p)
			get_person_key $OPTARG
			;;
		\?)
			echo "Invalid option: -$OPTARG"
			exit 1
			;;
	esac
done
