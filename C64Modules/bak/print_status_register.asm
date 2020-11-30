;▒█▀▄▒█▀▄░█░█▄░█░▀█▀░░░▄▀▀░▀█▀▒▄▀▄░▀█▀░█▒█░▄▀▀░░▒█▀▄▒██▀░▄▀▒░█░▄▀▀░▀█▀▒██▀▒█▀▄
;░█▀▒░█▀▄░█░█▒▀█░▒█▒▒░▒▄██░▒█▒░█▀█░▒█▒░▀▄█▒▄██▒░░█▀▄░█▄▄░▀▄█░█▒▄██░▒█▒░█▄▄░█▀▄
;*******************************************************************************
;* This routine prints the contents of the status register                     *
;*******************************************************************************
;*  Inputs : Accumulator : Status Register                                     *
;*******************************************************************************
;* Variables                                                                   *
streg
    brk
;*******************************************************************************
;* Code                                                                        *
print_status_register
    ldy #0                  ; Initialise Y Register
streg1
    sta streg               ; Store Acc. into Status Register Variable
streg3 
    asl streg               ; logically shift the acc left, and carry set or not
    lda #0                  ; Load Zero into Accu.
    adc #"0"                ; Add "0" to Acc. with  carry
    cpy #2                  ; is y = 2
    bne streg2              ; if yes, branch past the '-' symbol
    lda #"-"                ; Load Acc with "-"
streg2
    jsr CHROUT               ; Print The contents of the Acc
    iny                     ; increase the index Y
    cpy#8                   ; test for 8 (8th bit of the number)
    bne streg3              ; Branch if not equal back to next bit
    rts                     ; Return Back