#
#!/bin/bash
#

# this program asks the player to guess how many files
# or directories are in the directory in which the program
# is run

function guess_eval {
	# this function returns the string "high", "low", or signals
	# that the player has correctly guessed by returning an empty string

	# $1 is the player's guess, $2 is the number of files in
	# the directory in question
	[[ $1 -gt $2 ]] && echo "high" && return # case: too high
	[[ $1 -lt $2 ]] && echo "low"  && return # case: too low

	echo "" # if the player guesses correctly, return an empty string
}

# the number of files in the directory is obtained by piping ls into 
# grep, which identifies files from directories, and finally pipes
# into wc to count how many files exist
number=$(ls -la . | grep ^- | wc -l) 

# this while loop will only exit if guess_eval returns an empty string (a win)
while echo "Enter a guess: " && read guess 
do
	str=$(guess_eval $guess $number) # function call for guess_eval equals $str
	if [[ -n $str ]] # if the string returned by guess_eval has non-zero length...
	then
		echo "Incorrect! You're too $str"
	else # by elimination, if the string from guess_eval has zero length (a win!)
		echo "You won! There were $number files"
		break # exits the loop and subsequently ends the program
	fi
done
