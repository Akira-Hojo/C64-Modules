;▒█▀▄▒█▀▄░█░█▄░█░▀█▀░░░█▄█▒██▀░▀▄▀░░░▀█░░░▄▀▀░▄▀▀▒█▀▄▒██▀▒██▀░█▄░█
;░█▀▒░█▀▄░█░█▒▀█░▒█▒▒░▒█▒█░█▄▄░█▒█▒░░█▄▒░▒▄██░▀▄▄░█▀▄░█▄▄░█▄▄░█▒▀█
;*******************************************************************************
;  Print Hex - Takes a HEX value and prints it as ASCII
;  Label - print_hex2screen
;
;  REQUIRED - "c64_kernal.asm"
;  REQUIRED - "convert_hex2ascii.asm"
;
;  Inputs - A
;  Outputs - Screen
;  Modifies - A
;*******************************************************************************

print_hex2screen
        pha ;push a on stack
        lsr a ; shift the high bite down to the low bite
        lsr a ; just ^
        lsr a ; keep ^ 
        lsr a ; shifting ^
        jsr conv4 ;call hex2ascii
        jsr chrout
        pla ;pull a from stack
        and #$0f ;clear high nibble keep low nibble ;%00001111
        jsr conv4
        jsr chrout
        rts