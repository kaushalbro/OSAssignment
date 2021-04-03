#!/bin/bash
chooseOne(){ #creating chooseOne function
#This chooseOne function display the below text on first screen and read input and store it in a variable
# dialog --menu "Please Choose: and Press:" 0 0 0 1 "For calculating the area of Rectangle " 2 "AnyKey for exit"

echo -e '\nPlease Choose: and Press \n1 For calculating the area of Rectangle \nAnyKey For Exit \n'
read -p "Press 1 or AnyKey: Key= " a #read from user and store in a variable
}

chooseTwo(){ #creating chooseOne function
#this echo text dispaly on calling chooseTwo method/function
echo $'\n  Enter For calculating area of Rectangle in Square Meter\n  Enter 2 For calculating area of Rectangle in Square inches\n  AnyOther key for exit\n'
read -p "Press 1 or 2 or 3:Key = " b #read from user and store in b variable
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
  echo $'\nPlease enter a valid Height...\n' #displaying error if the height is other then int or float
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
  echo $'\nPlease enter a valid Width..\n'  #displaying error if the width is other then int or float
    readAndCheckWidth
   fi #terminating the nested if 
 fi #terminating the main if statement
}

readAndCheckHeight(){
  if [[ ${b} = 1 ]]; then
   read -p "Enter a Height in centimeter: " height #read height 
 elif [[ ${b} = 2 ]]; then
     read -p "Enter a Height in inch: " height #read height
  fi
  checkIntOrFloat $height
}
readAndCheckWidth(){
    if [[ ${b} = 1 ]]; then
   read -p "Enter a width in centimeter: " width #read width
 elif [[ ${b} = 2 ]]; then
     read -p "Enter a width in inch: " width #read width
  fi
  checkIntOrFloat $width
}

areaOfRecInSqCm(){ #creating are
RecHeight=$1 
RecWidth=$2
if [[ "$hInt" = true && "$wInt" = true ]]
then
areaOfrec=$((${RecHeight} * ${RecWidth}))
echo "Area of recangle having Height" ${RecHeight}"cm and Width" ${RecWidth}"cm is" $areaOfrec " sq.m"
echo $'\n'
elif [[ "$hInt" = false || "$wInt" = false ]]
then
areaOfrec=$(bc <<< "scale=4;${RecHeight} * ${RecWidth}")
echo "Area of recangle having Height" ${RecHeight}"cm and Width" ${RecWidth}"cm is" $areaOfrec " sq.m"
echo $'\n'
fi 
}

areaOfRecInSqInches(){
RecHeight=$1; HeightInInch=$(bc <<< "scale=4;1/${RecHeight} * 2.54")
RecWidth=$2;  WidthInInch=$(bc <<< "scale=4;1/${RecHeight} * 2.54")
areaOfrec=$(bc <<< "${HeightInInch} * ${WidthInInch}")
echo "Area of recangle having Height" ${HeightInInch}"inch and Width" ${WidthInInch}"Inch is" $areaOfrec " sq.inches"
}


runAgain(){ #creating runAgain function for run the programme again
read -p "Do You Want to run this programme again Enter( Y/N )? " run #getting permission to run the programme again or not  
if [[ $run -eq "Y" ||  $run -eq "y" ]]; then #if the input is equall to y or Y then
  runProgram #call runProgram function for running the programme
  else #else exit
    echo "Programe Exit"
    exit 0
fi
}

runProgram(){ #creating runProgram function for calculating area
chooseOne #call chooseOne function
if [[ a -eq 1 ]] #if chooseOne function read variable a is equal to 1 then
then
  clear #clear the screen and
chooseTwo #call the chooseTwo function
   if [[ b -eq 1 ]]  #if chooseTwo function read variable b is equal to 1 then
   then 
    clear #clear the screen and
    # userInputAndCheck #call the userInputAndCheck 
    readAndCheckHeight
    readAndCheckWidth
    areaOfRecInSqCm ${height} ${width} #then calculating the area of recangle
    runAgain #call runAgain function 
   elif [[ b -eq 2 ]] #if chooseTwo function read variable b is equal to 1 then
     then
      clear #clear the screen and
    readAndCheckHeight
    readAndCheckWidth
    areaOfRecInSqInches ${height} ${width}
    runAgain
   else 
  clear #clear the screen and
   echo "Thank you for running my programme..."
   exit 0
   fi
else
  clear #clear the screen and
echo "Thank you for running my programme..."
exit 0
fi }
runProgram


