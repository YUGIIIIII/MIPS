This MIPS assembly program prompts the user to enter hours and minutes, calculates the mirrored time, prints the mirrored hours and minutes, and then exits.

Data Section
hr: Prompt for hours input.
min: Prompt for minutes input.
Hr: Label for mirrored hours output.
Min: Label for mirrored minutes output.
Text Section
Prompts for Input:

Prompts and reads integer inputs for hours and minutes.
Calculates Mirrored Time:

Subtracts hours from 12.
Subtracts minutes from 60.
Handles special cases for 12 hours and 60 minutes.
Prints Mirrored Time:

Prints the calculated mirrored hours and minutes.
Exits Program:

Loads the exit code into $v0 and performs a syscall to terminate the program.
