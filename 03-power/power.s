# PURPOSE:  Program to illustrate how functions work
#           This program will compute the value of 
#           2^3 + 5^2
#

# Everything in the main program is stored in registers,
# so the data section doesn't have anything.
.section .data

.equ SYS_EXIT, 60

.section .text

.global _start

_start:
    pushl $3            # push second argument
    pushl $2            # push first argument
    call power          # call the function
    addl $8, %esp       # move the stack pointer back

    pushl %eax          # save the first answer before calling the next function

    push $2             # push second argument
    push $5             # push first argument
    call power          # call the function
    addl $8, %esp       # move the stack pointer back

    popl %ebx           # The second answer is already in %eax. We saved the
                        # first answer onto the stack, so now we can just pop
                        # it out into %ebx

    addl %eax, %ebx     # add them together. The result is in %ebx

    movl $1, %eax       # exit (%ebx is returned)
    int  $0x80

# PURPOSE: This function is used to compute the value of a number raised to
#          a power.
#
# INPUT:   First argument - the base number
#          Second argument - the power to be raised
#
# OUTPUT:  Will give the result as a return value
#
# VARIABLES:
#          %ebx - holds the base number
#          %ecx - holds the exponent
#
#          -4(%ebp) - holds the current result
#
#          %eax - used for tempoarary storage
#
.type power, @function
power:
    pushl %ebp          # save old base pointer
    movl %esp, %ebp     # make stack pointer the base pointer
    subl $4, %esp       # get room for our local storage

    movl 8(%ebp), %ebx   # put first argument into ebx   (ex: 2 in 2^3)
    movl 12(%ebp), %ecx  # put second argument into ecx  (ex: 3 in 2^3)
    
    movl %ebx, -4(%ebp)  # write result to local variable

power_loop_start:
    cmpl $1, %ecx        # if power == 1 then we're done
    je   end_power
    movl -4(%ebp), %eax  # move current result into rax
    imull %ebx, %eax     # multiply the current result by the base number
    movl %eax, -4(%ebp)  # move result back into local variable
    decl %ecx
    jmp power_loop_start # run for the next power

end_power:
    movl -4(%ebp), %eax  # return value goes into %eax
    movl %ebp, %esp      # restore the stack pointer
    popl %ebp            # restore the base pointer
    ret
