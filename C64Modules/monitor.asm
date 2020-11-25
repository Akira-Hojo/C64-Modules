;Usage:
;        jsr MemDump
;        word $CEED      ;Address
;        byte $3          ;Lines

monitor_memdump:

MemDump

        pha
        txa
        pha
        tya
        pha
        tay
                ;jsr Monitor
                tsx
              
                ;jsr Monitor
                
                lda SPpage+$04,x
                sta t_RetAddrL
                ;jsr Monitor
                lda SPpage+$05,x
                sta t_RetAddrH
                ;jsr Monitor

                ldy #1
                lda (t_RetAddr),Y
                sta t_MemdumpL
                ;jsr Monitor
        
                iny
                lda (t_RetAddr),Y
                sta t_MemdumpH
                ;jsr Monitor
        
                iny
                lda (t_RetAddr),Y
                
                tax  
                jsr MemDumpDirectB

                tsx
                inc SPpage+$04,x
                inc SPpage+$04,x
                inc SPpage+$04,x
                                
                                
                lda SPpage+$04,x
                cmp #3
                bcs MemDump_NoIncSpH
                                inc SPpage+$05,x
MemDump_NoIncSpH
        pla
                tay
        pla
        tax
        pla

                
        rts

MemDumpDirect
        ldy #8
MemDumpDirectB
        lda t_MemdumpH
        sta t_MemdumpBH
        jsr printhex
        lda t_MemdumpL
        sta t_MemdumpBL
        jsr printhex

        lda #":"
        jsr PrintChar
        jsr NewLine

        ldy #0
MemDump_Again
                ;jsr Monitor

        tya
        pha
MemDump_AgainHex
                lda (t_MemdumpL),y

                jsr printhex
                lda #" "
                jsr PrintChar
                iny
                tya
                and #%00000111
                bne MemDump_AgainHex
        pla
        tay
MemDump_AgainChar
        lda (t_MemdumpBL),y
        cmp #32
        Bcc MemDump_BadChar
        cmp #128
        Bcs MemDump_BadChar
MemDump_AgainCharRet
        
        jsr PrintChar

        iny
        tya
        and #%00000111
        bne MemDump_AgainChar
                ifndef BuildNES
                ifndef BuildPCE
                ifndef BuildSNS
                        jsr NewLine
                endif
                endif
                endif
MemDump_CarryOn
                
        dex
        bne MemDump_Again
                        
        rts
MemDump_BadChar
        lda #"."
        jmp MemDump_AgainCharRet
                
                
                
Monitor:
        php
        pha
                pushpair z_bc
                tya 
                pha 
                txa 
                pha 
                
                lda #"a"
                jsr printmonitorchar
                tsx
                lda SPpage+$05,x                        ;Show Accumulator
                jsr printmonitorhex

                lda #"x"
                jsr printmonitorchar
                pla
                pha
                jsr printmonitorhex

                lda #"y"
                jsr printmonitorchar
                tya
                jsr printmonitorhex


                lda #"s"
                jsr printmonitorchar

                tsx
                txa
                clc
                adc #8
                jsr printmonitorhex                     ;Calculate Stack pointer before call

                lda #"f"
                jsr printmonitorchar
                tsx
                lda SPpage+$06,x
                jsr printmonitorhex
                
                lda #"p";Program Counter
                jsr printmonitorchar
                lda SPpage+$08,x
                jsr printhex
                lda SPpage+$07,x
                jsr printhex
                
                Jsr NewLine

                
                pla
                tax
                pla
                tay
                pullpair z_bc
                pla     ;Pop A

        plp     ;Pop F
                
        rts
printmonitorchar
        jsr PrintChar
        lda #":"
        jmp PrintChar
printmonitorhex
        jsr printhex
        lda #" "
        jmp PrintChar
   


