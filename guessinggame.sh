#!/bin/bash
#File: guessinggame.sh

function guessinggame {
	local files=(*)
	local num_files=${#files[*]}
	local guess

	ask_num_files() {
		echo 'How many files are in the current directory?'
		read guess
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
