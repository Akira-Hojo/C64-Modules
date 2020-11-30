


; 10 SYS (49152)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $34, $39, $31, $35, $32, $29, $00, $00, $00


*=$C000

dump
jsr MemDump
inx
jmp dump

;clearly show your intentions

;InitScreen
;        lda black
;        sta $d020 ; border
;        sta $d021 ; bg
;        lda CHR_ClearScreen
;        jsr chrout
;        lda CHR_White
;        jsr chrout
;        lda CHR_SwitchToUpperCase
;        jsr chrout
;        
;        ;loop all 0-f
;        ldy #0
;loop    tya
;        jsr printh
;        lda #32
;        jsr chrout
;        iny
;        bne loop

;endless jmp endless

;printh
;        pha ;push a on stack
;        lsr a ; shift the high bite down to the low bite
;        lsr a ; just ^
;        lsr a ; keep ^ 
;        lsr a ; shifting ^
;        jsr conv4 ;call hex2ascii
;        jsr chrout
;        pla ;pull a from stack
;        and #$0f ;clear high nibble keep low nibble ;%00001111
;        jsr conv4
;        jsr chrout
;        rts

;conv1
;        tax ; transfer a to x
;        lda table,x ;lda with petscii value from below table offset by x
;        rts

;table   byte 48,49,50,51,52 ;0-4
;        byte 53,54,55,56,57 ;5-9
;        byte 65,66,67,68,69,70 ;A-F
;        ;22 bytes



;conv2
;        cmp #10 ;compare to 10
;        bcc @ahead ;carry clear less than, carry set greater than
;        adc #6 ;carry set adds one extra, 6+carry=7 skip petscii 58-63
;@ahead  adc #"0" ;petscii 0
;        rts
;        ;9 bytes

;conv3
;        sed  ;set decimal mode (addition) 00-99 e.g. h32+h45=h77
;        clc
;        adc #$90
;        adc #$40
;        cld
;        rts
;        ;8 bytes

;conv4
;        sed
;        cmp #10
;        adc #48
;        cld
;        rts
;        ;7 bytes