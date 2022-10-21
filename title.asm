
NextFrame

	VERTICAL_SYNC
        
        TIMER_SETUP #VBLANK_TIME
    ;lda #44
    ;sta TIM64T

; My VBLANK code

	inc frameCounter
      	

WaitVBlank
   ; lda INTIM
    ;bne WaitVBlank ; loop until timer expires
    
    TIMER_WAIT
    
    sta WSYNC
    sta VBLANK

    ldx padding
PaddingLoop
    sta WSYNC
    dex
    bne PaddingLoop

    ldx #playfield_lines-1
    lda #playfield_line_height
    sta PlayFieldHeightCounter


PlayfieldLoop
    sta WSYNC                       ; 3     (0)
    lda PFColors,x                  ; 4     (4)
    adc rowData
    sta COLUPF                      ; 3     (7)
    lda PF0DataA,x                  ; 4     (11)
    sta PF0                         ; 3     (14)
    lda PF1DataA,x                  ; 4     (18)
    sta PF1                         ; 3     (21)
    lda PF2DataA,x                  ; 4     (25*)
    sta PF2                         ; 3     (28)
    lda PF0DataB,x                  ; 4     (32)
    tay                             ; 2     (34)
    lda PF1DataB,x                  ; 4     (38)
    sta PF1                         ; 3     (41)
    sty PF0                         ; 3     (44)
    lda PF2DataB,x                  ; 4     (48)
Check0
    sta PF2                         ; 3     (51)
    dec PlayFieldHeightCounter      ; 5     (56)
    bne ____skip_new_row            ; 2/3   (58/59)
    lda #playfield_line_height      ; 2     (60)
    sta PlayFieldHeightCounter      ; 3     (63)
    dex                             ; 2     (65)
   ; cpx #$FF                        ; 2     (67)
    bmi ____done_playfield_rows     ; 2/3   (69)
____skip_new_row
    jmp PlayfieldLoop               ; 3     (72)



____done_playfield_rows
    lda #0
    sta PF0
    sta PF1
    sta PF2
    lda #remaining_lines
    sec
    sbc padding
    tax
VisibleScreen2
    sta WSYNC
    dex
    bne VisibleScreen2
    
SetupOS
    TIMER_SETUP #OVERSCAN_TIME
   ; sta TIM64T
    lda #2
    sta WSYNC
    sta VBLANK
    
    lda frameCounter
    and #%00000001
    bne NoFlip
    
   inc rowData
    
    lda Temp
    beq GoDown
    
GoUp:
	
   dec padding
   lda padding
   cmp #1
   bcs NoFlip
   
   lda #0
   sta Temp
   
   lda #1
   sta padding
   

   
   jmp NoFlip
    
GoDown:

   inc padding
   lda padding
   cmp #52
   bcc NoFlip
   
   inc Temp
  
   
NoFlip:

  	lda delayTimer
       beq CanFire
       
       dec delayTimer
       jmp NotFire
       
CanFire:
   
	lda #%10000000			; read button input
        bit INPT4
        bmi NotFire
	
        dec titleScreen
        
        lda #0
        sta delayTimer
	jmp SoftReset
NotFire:
            
WaitOverscan
   ; lda INTIM
    ;bne WaitOverscan
    ;sta WSYNC
    
    TIMER_WAIT
    
    jmp NextFrame

   if >. != >[.+(playfield_lines)]
      align 256
   endif

PF0DataA
	.byte %00000000
	.byte %00000000
	.byte %10000000
	.byte %10000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %10100000
	.byte %10100000
	.byte %10100000
	.byte %10100000
	.byte %10100000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000

    

   if >. != >[.+(playfield_lines)]
      align 256
   endif

PF1DataA
	.byte %00000000
	.byte %00101010
	.byte %00101010
	.byte %11101010
	.byte %11111011
	.byte %00101010
	.byte %00101010
	.byte %00101010
	.byte %00011001
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %01010100
	.byte %01010101
	.byte %01100101
	.byte %01010101
	.byte %01100100
	.byte %00000000
	.byte %00001010
	.byte %00001010
	.byte %00001110
	.byte %00001010
	.byte %00001010
	.byte %00000100
	.byte %00000000
	.byte %01001010
	.byte %01001010
	.byte %01001110
	.byte %01001110
	.byte %11001010
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000001
	.byte %00000010
	.byte %00000000
	.byte %00000000
	.byte %00000001
	.byte %00000010
	.byte %00000010
	.byte %00000010
	.byte %00000001
	.byte %00000000



   if >. != >[.+(playfield_lines)]
      align 256
   endif

PF2DataA
	.byte %00000000
	.byte %10101101
	.byte %10100101
	.byte %10100101
	.byte %11100100
	.byte %10100101
	.byte %10100101
	.byte %11100101
	.byte %11000101
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %10101011
	.byte %10101000
	.byte %10111000
	.byte %10101000
	.byte %10101011
	.byte %00000000
	.byte %01010010
	.byte %01010101
	.byte %00110101
	.byte %01010101
	.byte %01010101
	.byte %00110101
	.byte %00000000
	.byte %01010111
	.byte %01010001
	.byte %01110111
	.byte %01110001
	.byte %01010111
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %10001000
	.byte %01001001
	.byte %01001001
	.byte %01001001
	.byte %11001000
	.byte %01001000
	.byte %01001000
	.byte %01001001
	.byte %10011100
	.byte %00000000

    
   if >. != >[.+(playfield_lines)]
      align 256
   endif

PF0DataB
	.byte %00000000
	.byte %01100000
	.byte %10000000
	.byte %10000000
	.byte %01100000
	.byte %00100000
	.byte %00100000
	.byte %00100000
	.byte %11000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00100000
	.byte %10100000
	.byte %10110000
	.byte %10110000
	.byte %00100000
	.byte %00000000
	.byte %00100000
	.byte %01010000
	.byte %01010000
	.byte %01010000
	.byte %01010000
	.byte %00100000
	.byte %00000000
	.byte %00100000
	.byte %01010000
	.byte %01010000
	.byte %01010000
	.byte %00100000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %01010000
	.byte %01000000
	.byte %01000000
	.byte %01000000
	.byte %11010000
	.byte %01000000
	.byte %01000000
	.byte %01000000
	.byte %10010000
	.byte %00000000

    

   if >. != >[.+(playfield_lines)]
      align 256
   endif

PF1DataB
	.byte %00000000
	.byte %00100100
	.byte %01010100
	.byte %01010100
	.byte %01010111
	.byte %01010100
	.byte %01010100
	.byte %01010100
	.byte %00100010
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %10010101
	.byte %01010101
	.byte %01010101
	.byte %01010101
	.byte %10011101
	.byte %00000000
	.byte %10101010
	.byte %10101010
	.byte %11001110
	.byte %10101010
	.byte %10101010
	.byte %11000100
	.byte %00000000
	.byte %10100100
	.byte %10100100
	.byte %11001110
	.byte %10101010
	.byte %11001010
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00111000
	.byte %00100000
	.byte %00100000
	.byte %00110000
	.byte %00010000
	.byte %10011000
	.byte %10001000
	.byte %10001000
	.byte %10111000
	.byte %00000000



   if >. != >[.+(playfield_lines)]
      align 256
   endif

PF2DataB
	.byte %00000000
	.byte %00000010
	.byte %00000010
	.byte %00001110
	.byte %00011110
	.byte %00010010
	.byte %00000010
	.byte %00000011
	.byte %00000100
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000001
	.byte %00000010
	.byte %00000010
	.byte %00000010
	.byte %00000001
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00100100
	.byte %00101010
	.byte %01101010
	.byte %00101010
	.byte %01100100
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000
	.byte %00000000

    

   if >. != >[.+(playfield_lines)]
      align 256
   endif

PFColors
   .byte $0E
   .byte $0E
   .byte $0E
   .byte $1C
   .byte $CA
   .byte $0E
   .byte $0E
   .byte $0E
   .byte $0E
   .byte $3A
   .byte $38
   .byte $38
   .byte $4E
   .byte $9E
   .byte $9E
   .byte $9E
   .byte $7E
   .byte $7E
   .byte $7E
   .byte $6E
   .byte $6E
   .byte $6E
   .byte $5E
   .byte $5E
   .byte $5E
   .byte $5E
   .byte $06
   .byte $06
   .byte $08
   .byte $08
   .byte $08
   .byte $08
   .byte $08
   .byte $26
   .byte $EC
   .byte $EC
   .byte $DC
   .byte $BC
   .byte $AC
   .byte $8C
   .byte $6C
   .byte $5C
   .byte $4C
   .byte $2C
   .byte $1E


