#!/bin/bash -x

echo "Welcome to Gambling Simulator"
stake=100
BET=1

function gamblingForDay(){
	lossLimit=$(( $stake / 2 ))
	winLimit=$(( $stake + $lossLimit ))
	while [[ $stake -gt $lossLimit ]] && [[ $stake -lt $winLimit  ]]
	do
		if [ $((RANDOM%2)) -eq 1 ]
  		then
			stake=$(( $stake + $BET ))
		 else
			stake=$(( $stake - $BET ))

   	fi
	done
	echo "$stake"
} 

function main(){
		gamblingForDay
}
main
