#!/bin/bash
# Reference-2021-2-26s https://bradgillap.com/blog/guide/post/bash-gui-whiptail-menu-tutorial-series-1
#https://stackoverflow.com/questions/1298066/check-if-an-apt-get-package-is-installed-and-then-install-it-if-its-not-on-linu
isInstalled(){ #this function will check if the required pacakage is installed or not
if [ ! "$(dpkg-query -W --showformat='${db:Status-Status}' "$1" 2>&1)" = installed ]; then
     echo -e $1 'is not installed!!\n' $1'is required to run this programe!! '
     read -p "Enter Y|y to install:[Y/y] Key= " a #read from user and store in a variable
    if [[ ${a} = "Y" ||  ${a} = "y" ]]; then #if the input is equall to y or Y then
      sudo apt install $1 #install whiptail
      isInstalled $1
    else #else exit
      echo "wrong input"
    exit 0
fi
fi
}



checkIntOrFloat(){ #Creating checkIntOrFloat function which take one parameter $1 
if [[ $1 = $height ]] #if parameter $1 is = $height then
 then
  if [[ ${height} =~ ^[0-9]+$ ]] # checking if the height variable is integer or float
  then 
  hInt=true #if the height is int the boolean hInt is true
  elif [[ ${height} =~ ^[-+]?[0-9]*\.?[0-9]+$ ]] #checking else if height is other then integer 
   then 
  hInt=false #if the height is float then the boolean hInt is false
  else
  # echo $'\nPlease enter a valid Height...\n' #displaying error if the height is other then int or float
  whiptail --title "Error" --msgbox "Please enter a valid Height...\nKey:[Enter]" 10 46 #displaying error if the height is other then int or float
  readAndCheckHeight
  fi #terminating the nested if 
elif [[ $1 = $width ]] #ellse $1 is width then
 then 
  if [[ ${width} =~ ^[0-9]+$ ]] # checking if the width variable is integer or float
  then
  wInt=true #if the width is int the boolean wInt is true
  elif [[ ${width} =~ ^[-+]?[0-9]*\.?[0-9]+$ ]];then  #checking else if width is other then integer then 
  wInt=false #if the width is float the boolean wInt is false
  else
   whiptail --title "Error" --msgbox "Please enter a valid Width...\nKey:[Enter]" 10 46 #displaying error if the width is other then int or float
    readAndCheckWidth
   fi #terminating the nested if 
 fi #terminating the main if statement
}

areaOfRecInSqCm(){ #creating are

RecHeight=$1 
RecWidth=$2
if [[ "$hInt"=true && "$wInt"=true ]];then
areaOfrec=$((${RecHeight} * ${RecWidth}))
whiptail --title "Result" --msgbox "Area of recangle having Height $RecHeight cm and Width $RecWidth cm is $areaOfrec sq.m" 8 66
elif [[ "$hInt" = false || "$wInt" = false ]];then
areaOfrec=$(bc <<< "scale=4;${RecHeight} * ${RecWidth}")
whiptail --title "Result" --msgbox "Area of recangle having Height $RecHeight cm and Width $RecWidth cm is $areaOfrec sq.m" 8 66
fi 
}

areaOfRecInSqInches(){
RecHeight=$1; HeightInInch=$(bc <<< "scale=4;1/${RecHeight} * 2.54")
RecWidth=$2;  WidthInInch=$(bc <<< "scale=4;1/${RecHeight} * 2.54")
areaOfrec=$(bc <<< "${HeightInInch} * ${WidthInInch}")
whiptail --title "Result" --msgbox "Area of recangle having Height $RecHeight inch and Width $RecWidth inch is $areaOfrec sq.inch" 8 66
}

readAndCheckHeight(){
  if [[ ${menu2} = 1 ]]; then
   height=$(whiptail --inputbox "Enter a Height in centimeter:" 10 30 3>&1 1>&2 2>&3)
 elif [[ ${menu2} = 2 ]]; then
      height=$(whiptail --inputbox "Enter a Height in inch:" 10 30 3>&1 1>&2 2>&3)
  fi
  checkIntOrFloat $height
}
readAndCheckWidth(){
    if [[ ${menu2} = 1 ]]; then
    width=$(whiptail --inputbox "Enter a width in centimeter:" 10 30 3>&1 1>&2 2>&3)
 elif [[ ${menu2} = 2 ]]; then
     width=$(whiptail --inputbox "Enter a width in inch:" 10 30 3>&1 1>&2 2>&3)
  fi
  checkIntOrFloat $width
}

runAgain(){
if (whiptail --title "Exit/Run" --yesno "Do You Want to run this programe again?\nKey:[right|left|Enter]" 9 46)
    then
        SecondMenu
    else
        whiptail --title "Exit" --msgbox "Thank you for using my programe..." 7 44 
fi



}

function firstMenu() {
    menu1=$(whiptail --title "Rectangle Area Calculator" --fb --menu "Please Choose option:\nKey:[up|down|right|left|Enter]" 14 59 3 \
        "1" "Calculate the area of Rectangle" \
        "2" "Exit:Program" 3>&1 1>&2 2>&3)
    case $menu1 in
        1)
SecondMenu
        ;;
        2)
whiptail --title "Exit" --msgbox "Thank you for using my programe..." 7 44 
            ;;
    esac
}

function SecondMenu() {
    menu2=$(whiptail --title "Rectangle Area Calculator" --fb --menu "Please Choose option:\nKey:[up|down|right|left|Enter]" 14 59 3 \
        "1" "Calculate area of Rectangle in Square Meter" \
        "2" "Calculate area of Rectangle in Square inches" \
        "3" "Exit:Program" 3>&1 1>&2 2>&3)
    case $menu2 in
        1)
    readAndCheckHeight
    readAndCheckWidth
    areaOfRecInSqCm ${height} ${width} #then calculating the area of recangle
    runAgain #call runAgain function 
        ;;
        2)
    readAndCheckHeight
    readAndCheckWidth
    areaOfRecInSqInches ${height} ${width}
    runAgain
            ;;
        3)
        whiptail --title "Exit" --msgbox "Thank you for using my programe..." 7 44 
            ;;
    esac
}
isInstalled "whiptail"
firstMenu
