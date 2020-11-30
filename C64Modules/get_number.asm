;*******************************************************************************
;  Get Number - This asks the user to imput an number between 0 and 255
;  Label - get_number
;
;  REQUIRED - "c64_kernal.asm"
;  REQUIRED - "convert_hex2ascii.asm"
;
;  Inputs - A
;  Outputs - Screen
;  Modifies - A
;*******************************************************************************                                                                     *
get_number
    jsr get_line
    lda #1
    ldx #$ff
    sta $7b
    stx $7a
    jsr $0073          ; 8-bit number
    jsr $b79e          ; 8-bit Number
    rts