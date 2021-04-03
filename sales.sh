#!/bin/bash

# whiptail --inputbox "Enter a Month:" 10 30 / --inputbox "Enter a Month:" 10 30 
basic=2000

selector(){
 firstSelector=$(whiptail --title "Salary Calcuator" --fb --menu "Please Choose option:\nKey:[up|down|right|left|Enter]" 17 59 5 \
        "1" ":Record the new data " \
        "2" ":Sort data by Name order" \
        "3" ":Sort data by salary DESC" \
        "4" ":Sort data by salary ASC" \
        "5" ":Sort By Name with asscoiated Net salary" 3>&1 1>&2 2>&3)
    case $firstSelector in
        1)
getInput
calculate
saveData $month $name $total 
runAgain
        ;;
        2)
data=$(cat record3.txt)
whiptail --title "Sort data By Name order" --msgbox "`cat record3.txt`" 20 80 
            ;;
            3)
data=$(cat record3.txt)
whiptail --title "Sort data by salary DESC" --msgbox "$data" 20 80 
            ;;
            4)
data=$(cat record3.txt)
whiptail --title "Sort data by salary ASC" --msgbox "$data" 20 80 
            ;;
            5)
data=$(cat record3.txt)
whiptail --title "Sort By Name with asscoiated Net salary" --msgbox "$data" 20 80 
            ;;
    esac

}


getInput(){
 month=$(whiptail --title "Choose Month" --fb --menu "Please Choose Month:\nKey:[up|down|right|left|Enter]" 25 35 12 \
"January" ""  \
"February" ""  \
"March" ""  \
"April" ""  \
"May" ""  \
"June" ""  \
"July" ""  \
"August" ""  \
"September" ""  \
"October" ""  \
"November" ""  \
"December" ""  3>&1 1>&2 2>&3)

name=$(whiptail --inputbox "Enter a Salesperson Name:" 10 30 3>&1 1>&2 2>&3)

# month=$(whiptail --inputbox "Enter a Month in Number[Jan-Dec]:" 10 30 3>&1 1>&2 2>&3)
model=$(whiptail --title "Choose Car Model" --fb --menu "Please Choose Model:\nKey:[up|down|right|left|Enter]" 18 35 7 \
"A Class" "" \
"B Class" "" \
"C Class" "" \
"E Class" "" \
"AMG C65" "" \
3>&1 1>&2 2>&3)


Quantity=$(whiptail --inputbox "How many Car he/she solds (Quantity):" 10 30 3>&1 1>&2 2>&3)
runAgain
}

runAgain(){
if (whiptail --title "Exit/Run" --yesno "Do You Want to run this programe again?\nKey:[right|left|Enter]" 9 46)
    then
        getInput
    else
        whiptail --title "Exit" --msgbox "Thank you for using my programe..." 7 44 
fi



}

calculate(){

if [[ ${model} == "A Class" ]]; then
	av=31095
elif [[ ${model} == "B Class" ]]; then
av=33162
elif [[ ${model} == "C Class" ]]; then
 av=42537
elif [[ ${model} == "E Class" ]]; then
av=53437
elif [[ ${model} == "AMG C65" ]]; then
    av=31095
fi
total=$(bc <<< "${av} * ${Quantity} + basic")
Netsalary= bonusCalculate $total


   # case ${model} in
   #      "A Class")
   #    av=31095
   #    total=$(bc <<< "${av} * ${Quantity}")
   #    bonusCalculate $total
   #    echo $total
   #      ;;
   #      "B Class")
   #      av=33162
   #      total=$(bc <<< "${av} * ${Quantity}")
   #    bonusCalculate $total
   #      ;;
   #      "C Class")
   #      av=42537
   #      total=$(bc <<< "${av} * ${Quantity}")
   #    bonusCalculate $total
   #      ;;
   #      "E Class")
   #      av=53437
   #      total=$(bc <<< "${av} * ${Quantity}")
   #    bonusCalculate $total
   #      ;;
   #      "AMG C65")
   #      av=31095
   #      total=$(bc <<< "${av} * ${Quantity}")
   #    bonusCalculate $total
   #          ;;
   #  esac
}

bonusCalculate(){
a=$1
if [[ "$a" -ge 200000 && "$a" < 300000   ]]; then
	bonus=1000 
elif [[ "$a" -ge 300000 && "$a" < 400000  ]]; then
 bonus=1500
elif [[ "$a" -ge 400000 && "$a" < 500000  ]]; then
	bonus=2000
elif [[ "$a" -ge 500000 && "$a" < 650000  ]]; then
	bonus=2500
	echo $bonus
elif [[ "$a" -ge 650000 ]]; then
    bonus=3000
fi
}

saveData(){
month=$1
name=$2
total=$3
echo $month","$name","$total>> record3.txt
cat record3.txt

}
selector







