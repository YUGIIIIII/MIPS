.data
hr:    .asciiz "Enter the hrs(question): "   # String to prompt the user to enter hours.
min:   .asciiz "Enter the min(question): "   # String to prompt the user to enter minutes.
Hr:    .asciiz "\nMirrored hrs: "            # String to print before displaying mirrored hours.
Min:   .asciiz "\nMirrored mins: "           # String to print before displaying mirrored minutes.
        
.text
main:  
        li $v0, 4                              # Load immediate value 4 into $v0 to print a string.
        la $a0, hr                             # Load the address of the 'hr' string into $a0.
        syscall                                # Make the system call to print the string.

        li $v0, 5                              # Load immediate value 5 into $v0 to read an integer.
        syscall                                # Make the system call to read the integer.
        move $t0, $v0                          # Move the read integer (hours) from $v0 to $t0.

        li $v0, 4                              # Load immediate value 4 into $v0 to print a string.
        la $a0, min                            # Load the address of the 'min' string into $a0.
        syscall                                # Make the system call to print the string.

        li $v0, 5                              # Load immediate value 5 into $v0 to read an integer.
        syscall                                # Make the system call to read the integer.
        move $t1, $v0                          # Move the read integer (minutes) from $v0 to $t1.


        li $t4, 12                             # Load immediate value 12 into $t4 (representing 12 hours).
        li $t5, 60                             # Load immediate value 60 into $t5 (representing 60 minutes).

        subu $t2, $t4, $t0                     # Subtract hours from 12 to get mirrored hours ($t2 = 12 - hours).
        beq $t0, $t4, special_case_12_hours    # If input hours are 12, branch to special_case_12_hours.

        subu $t3, $t5, $t1                     # Subtract minutes from 60 to get mirrored minutes ($t3 = 60 - minutes).
        beq $t1, $t5, special_case_60_minutes  # If input minutes are 60, branch to special_case_60_minutes.
        b end_calculation                      # Unconditionally branch to end_calculation.

special_case_12_hours:
        li $t2, 12                             # Set mirrored hours to 12 if the original hours were 12.
        b zero_minutes_calculation             # Continue to the minutes calculation.

special_case_60_minutes:
        li $t3, 0                              # Set mirrored minutes to 0 if the original minutes were 60.
        b end_calculation                      # Continue to the end calculation.

zero_minutes_calculation:
        subu $t3, $t5, $t1                     # Subtract minutes from 60 to get mirrored minutes ($t3 = 60 - minutes).

end_calculation:

        li $v0, 4                              # Load immediate value 4 into $v0 to print a string.
        la $a0, Hr                             # Load the address of the 'Hr' string into $a0.
        syscall                                # Make the system call to print the string.

        li $v0, 1                              # Load immediate value 1 into $v0 to print an integer.
        move $a0, $t2                          # Move the mirrored hours from $t2 to $a0.
        syscall                                # Make the system call to print the integer.

        li $v0, 4                              # Load immediate value 4 into $v0 to print a string.
        la $a0, Min                            # Load the address of the 'Min' string into $a0.
        syscall                                # Make the system call to print the string.

        li $v0, 1                              # Load immediate value 1 into $v0 to print an integer.
        move $a0, $t3                          # Move the mirrored minutes from $t3 to $a0.
        syscall                                # Make the system call to print the integer.

        li $v0, 10                             # Load immediate value 10 into $v0 to exit the program.
        syscall                                # Make the system call to exit the program.
