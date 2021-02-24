#!/bin/bash

#---------------------------------------------------------------------------------------------
#PARAMETERS THAT CAN BE CHANGED TO SUIT YOUR NEEDS
#---------------------------------------------------------------------------------------------
OUTPUT_DIR="/home/olin/faces"    #DEFAULT storage path of downloaded portraits
WAIT_TIME_SECONDS=2         #Number of seconds to wait between each fetching of pictures
MAX_DOWNLOADS=20            #Work will stop after having downloaded MAX_DOWNLOADS pictures
FILENAME_PREFIX="thispersondoesnotexist"
#---------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------
#OTHER PARAMETERS
#---------------------------------------------------------------------------------------------
USER_AGENT="Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12"
URL="https://thispersondoesnotexist.com/image"
#---------------------------------------------------------------------------------------------

# DOWNLOAD_TOOL="wget"
# echo "Check if ${DOWNLOAD_TOOL} is installed"
# dpkg -s $DOWNLOAD_TOOL &> /dev/null
# if [ $? -eq 0 ]; then
#     echo "Package ${DOWNLOAD_TOOL} is installed!"
# else
#     echo "Package ${DOWNLOAD_TOOL} is NOT installed and is required ! "
#     exit 1
# fi

[[ ! -d $OUTPUT_DIR ]] && mkdir $OUTPUT_DIR
mkdir -p $OUTPUT_DIR/extract.$$

for (( c=1; c<=$MAX_DOWNLOADS; c++ ))
do
    fullfilename="$OUTPUT_DIR/extract.$$/${FILENAME_PREFIX}.$c.jpg"
    wget ${URL} -O $fullfilename
    sleep ${WAIT_TIME_SECONDS}
done

echo "Extraction finished."
