#!/bin/bash
dialog --title "Area Calculator" --msgbox "Hello World" 5 20

tput setaf 3 # Set a foreground colour
echo "XYX Corp LTD."
tput sgr0 # When you turn it off, new text in the terminal returns to normal display.
tput cup 5 17
# Set reverse video mode
tput rev
echo "M A I N - M E N U"
tput sgr0
tput cup 7 15
printf "1. User Management"
tput cup 8 15
echo "2. Service Management"
tput cup 9 15
echo "3. Process Management"
tput cup 10 15

echo "4. Backup"
# Set bold mode
tput bold
tput cup 12 15
read -p "Enter your choice [1-4] " choice
tput clear
tput sgr0
tput rc # Restore the cursor position
