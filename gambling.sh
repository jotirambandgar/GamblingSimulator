#!/bin/bash -x

echo "Welcome to Gambling Simulator"
stake=100
BET=1
win=0
loss=0
function gamblingForDay(){
	lossLimit=$(( $stake / 2 ))
	winLimit=$(( $stake + $lossLimit ))
	while [[ $stake -gt $lossLimit ]] && [[ $stake -lt $winLimit  ]]
	do
		if [ $((RANDOM%2)) -eq 1 ]
  		then
			stake=$(( $stake + $BET ))
			((win++))
		 else
			stake=$(( $stake - $BET ))
			((loss++))
   	fi
	done
	echo "$stake"
} 

function main(){
	for (( i=0; i<20 ; i++ ))
	do
		gamblingForDay
	done
	echo "winning amount for 20 days : $win"
	echo "loss amount for 20 days : $loss"

}
main

