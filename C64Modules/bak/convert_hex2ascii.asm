;░█▄█▒██▀░▀▄▀░▀█▒▄▀▄░▄▀▀░▄▀▀░█░█
;▒█▒█░█▄▄░█▒█░█▄░█▀█▒▄██░▀▄▄░█░█

;*******************************************************************************
;  From Hex to ASCII converters - Choose 1 or Modify Labels
;
;  Label - convert_hex2ascii
;
;  REQUIRED - NONE
;
;  Inputs - A
;  Outputs - A
;  Modifies - A, Sometimes X
;*******************************************************************************


;*******************************************************************************
;  22 bytes
;*******************************************************************************


;convert_hex2ascii
;        tax ; transfer a to x
;        lda @table,x ;lda with value from below table offset by x
;        rts

;@table ; table of petscii values  
;        byte 48,49,50,51,52 ;0-4
;        byte 53,54,55,56,57 ;5-9
;        byte 65,66,67,68,69,70 ;A-F
;        ;22 bytes


;*******************************************************************************
;  9 bytes
;*******************************************************************************

;convert_hex2ascii
;        cmp #10  ;compare to 10
;        bcc @ahead  ;carry clear less than, carry set greater than
;        adc #6  ;carry set adds one extra, 6+carry=7 skip petscii 58-63
;@ahead  adc #"0"  ;petscii 0
;        rts



;*******************************************************************************
;  8 bytes
;*******************************************************************************

;convert_hex2ascii
;        sed  ;set decimal mode (addition) 00-99 e.g. h32+h45=h77
;        clc  ;always good to do this!
;        adc #$90 
;        adc #$40
;        ; Remember we are in decimal hex mode.
;        ; If 0-9 then adc #$90 = $90-$99, adc #$40 = $30-$39 (petscii 0-9)
;        ; If A-F then adc #$90 = $100-$105, adc #$40 = $41-$46 (petscii A-F)
;        cld  ;clear decimal mode
;        rts



;*******************************************************************************
;  7 bytes
;*******************************************************************************

convert_hex2ascii
        sed  ;set decimal mode (addition) 00-99 e.g. h32+h45=h77
        cmp #10
        adc #48
        cld  ;clear decimal mode
        rts

