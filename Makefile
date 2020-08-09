all: README.md

README.md: guessinggame.sh
	[[ -e README.md ]] || touch README.md
	echo "# A Bash Guessing Game" > README.md &
	echo "## Program Details" >> README.md & 
	echo "- Written by Miles Z for The Unix Workbench" >> README.md & 
	echo "- Created on $$(date)" >> README.md & 
	echo "- guessinggame.sh contains $$(cat guessinggame.sh | wc -l) lines" >> README.md & 
