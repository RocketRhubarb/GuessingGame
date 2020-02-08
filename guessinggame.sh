#!/bin/bash
#File: guessinggame.sh

function guessinggame {
	local num_files=$(ls -A | wc -l)
	local guess

	ask_num_files() {
		echo 'How many files are in the current directory?'
		read guess
		
		# input sanitation
		re='^[0-9]+$'
		if ! [[ $guess =~ $re ]]
		then
			echo 'Not a number, try again.'
			ask_num_files
		fi
	}

	ask_num_files

	while [[ ! $guess -eq $num_files ]]
	do
		if [[ $guess -gt $num_files ]]
		then
			echo 'You guessed too many.'
		else
			echo 'You guessed too few.'
		fi	
		ask_num_files
	done

	echo 'You guess the correct number of files in this directory.'
	echo 'There were' $num_files 'files in the directory.'
}

guessinggame
