#!/usr/bin/env bash

io=$(whiptail --title "Add rule" --radiolist "Choose" 20 40 15 \
"A" "CarA" ON \
"B" "CarB" OFF \
"C" "CarC" OFF \
"AMG C65" "AMG C65" OFF \
3>&1 1>&2 2>&3)


if [[ ${io} = "A" ]]; then
	echo "A is pressed"
elif [[ ${io} = "AMG C65" ]]; then
		echo "B is pressed"

fi
# echo "$io"

exit



