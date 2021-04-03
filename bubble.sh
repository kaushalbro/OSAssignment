#!/bin/bash
while IFS=, read -r col1 col2 col3;do
    arr+=("$col1, $col2, $col3")
done < record3.txt

echo "Array in original order: "
for i in "${arr[@]}"
do
    echo "$i "field3=`echo $i | cut -d ',' -f 3`
done

lines=`cat record3.txt | wc -l`

#Performing Bubble sort
for ((i = 0; i<$lines; i++))
do
    for ((j = i; j<$lines-i-1; j++))
    do
        if (( `echo ${arr[j]} | cut -d ',' -f 3` > `echo ${arr[$((j+1))]} | cut -d ',' -f 3` ))
        then
                #swap
                temp=${arr[$j]}
                arr[$j]=${arr[$((j+1))]}
                arr[$((j+1))]=$temp
            fi
    done
done

echo "Array in sorted order: "
for i in "${arr[@]}"
do
    echo "$i "
done