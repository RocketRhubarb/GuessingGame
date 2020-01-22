all: README.md

README.md:
	echo "#Guessing game" > README.md
	date >> README.md
	echo "Number of lines in guessinggame.sh:" >> README.md
	wc -l guessinggame.sh | egrep -o "[0-9]+" >> README.md

clean:
	rm README.md
