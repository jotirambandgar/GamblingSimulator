#!/bin/bash -x

echo "Welcome to Gambling Simulator"
stake=100
BET=1
win=0
loss=0
declare -A gamblingRecord;
function gamblingForDay(){
	stake=100
	win=0
	loss=0
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
			((loss--))

   	fi
	done

	if [ $stake -eq 50 ]
	then
		echo "-50"
	else
		echo "50"
	fi

}

function main(){
	stakeRecord=0
	unluckiestDay=""
	for (( i=0; i<20 ; i++ ))
	do
		echo "stake for day $i"
		dayAmount=$(gamblingForDay)
    	stakeRecord=$(( $stakeRecord + $dayAmount ))
		#echo "day1   stake total-->$stakeRecord     $dayAmount"
		gamblingRecord["day$i"]="$dayAmount $stakeRecord"
	done
		echo ${gamblingRecord[@]}

	 #for key in ${!gamblingRecord[@]}
  	for(( i=0; i<20 ; i++ )) 
	do
     
      echo "day$i" ${gamblingRecord["day$i"]}
  	 done | sort -k3 -nr | awk 'NR==20{ print "unluckiestDay " $0 } AND NR==1{ print "luckiestDay " $0 }'

}
main

