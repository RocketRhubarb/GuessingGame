all: README.md

README.md:
	echo "# Guessing game \n\n" > README.md
	echo "README created: " >> README.md
	date >> README.md
	echo "\nNumber of lines in guessinggame.sh: " >> README.md
	wc -l guessinggame.sh | egrep -o "[0-9]+" >> README.md

clean:
	rm README.md
