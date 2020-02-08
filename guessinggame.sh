#!/bin/bash
#File: guessinggame.sh

function ask_num_files() {

	echo 'How many files are in the current directory?'
	read guess
	
	# input sanitation
	re='^[0-9]+$'
	if ! [[ $guess =~ $re ]]
	then
		echo 'Not a number, try again.'
		ask_num_files
	fi
	guess=$(echo $guess | sed 's/^0*//')
	if [[ ${#guess} -gt 19 ]]
	then
		echo 'Your guess was too large to process'
		ask_num_files
	fi
}

num_files=$(ls -A | wc -l)
guess

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
echo 'There are' $num_files 'files in the directory.'

