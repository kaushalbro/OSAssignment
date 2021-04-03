# https://bradgillap.com/blog/guide/post/bash-gui-whiptail-menu-tutorial-series-1
function firstMenu() {
    menu1=$(whiptail --title "Rectangle Area Calculator" --fb --menu "Please Choose option:\nKey:[up|down|right|left]" 14 59 3 \
        "1" "Calculate the area of Rectangle" \
        "2" "Exit:Program" 3>&1 1>&2 2>&3)
    case $menu1 in
        1)
SecondMenu
        ;;
        2)
exit 0
            ;;
    esac
}
function SecondMenu() {

    menu2=$(whiptail --title "Rectangle Area Calculator" --fb --menu "Please Choose option:\nKey:[up|down|right|left|Enter]" 14 59 3 \
        "1" "Calculate area of Rectangle in Square Meter" \
        "2" "Calculate area of Rectangle in Square inches" \
        "3" "Exit:Program" 3>&1 1>&2 2>&3)
    case $menu3 in
        1)
            whiptail --title "Option 1" --msgbox "You chose option 1.?" 7 44
        echo "Option 1"
        ;;
        2)
        whiptail --title "Option 2" --msgbox "You chose option 2." 7 44
        echo "Option 1"
            ;;
        3)
        exit 0
            ;;
    esac
}

firstMenu