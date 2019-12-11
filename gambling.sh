#!/bin/bash -x

echo "Welcome to Gambling Simulator"
STAKE=100
BET=1

function main(){
	if [ $((RANDOM%2)) -eq 1 ]

	then

		echo " win"

	else

		echo "loss"

	fi
}
main
