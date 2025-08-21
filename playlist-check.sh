#!/bin/bash

RED="\033[1;31m"
GREEN="\033[0;32m"
PURPLE="\033[1;35m"
NOCOLOR="\033[0m"

find . -name '*.m3u' | while read file; do
    CHECKED=0
    echo ""
    echo -e "${PURPLE}'$file'${NOCOLOR}"
    mapfile -t songArray < "$file"
    for song in "${songArray[@]}"; do
        if [[ "$song" =~ (.mp3|.flac|.wav) ]]; then
            CLEAN=`echo $song | sed 's/\\r//g'`
            if [ -e "$CLEAN" ]; then
                # echo -e "${GREEN}$CLEAN${NOCOLOR}"
                ((CHECKED+=1))
            else
                echo -e "${RED}$CLEAN${NOCOLOR}"
            fi
        fi
    done
    echo -e "${GREEN}Located $CHECKED tracks successfully.${NOCOLOR}"
done

echo ""
echo ""