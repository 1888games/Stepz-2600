

        
placeSprite:
          	sta WSYNC	; start a new line
    bit 0		; waste 3 cycles
	sec		; set carry flag
DivideLoop
	sbc #15		; subtract 15
	bcs DivideLoop	; branch until negative
	eor #7		; calculate fine offset
	asl
	asl
	asl
	asl
	sta RESP0,x	; fix coarse position
	sta HMP0,x	; set fine offset
	rts		; return to calle
                
;Adds value to 6-BCD-digit score.
; A = 1st BCD digit
; X = 2nd BCD digit
; Y = 3rd BCD digit

AddScore: 
        sed	; enter BCD mode
        clc	; clear carry
        sta Temp
        lda BCDScore
        adc Temp
        sta BCDScore
        stx Temp
        lda BCDScore+1
        adc Temp
        sta BCDScore+1
        sty Temp
        lda BCDScore+2
        adc Temp
        sta BCDScore+2
        cld	; exit BCD mode
        rts

AddOne:
	
	sed
        clc
       lda #5
        adc BCDScore
        sta BCDScore
        lda BCDScore + 1
        adc #0
        sta BCDScore + 1
        
        lda BCDScore + 2
        adc #0
        sta BCDScore + 2
        cld
        rts


Random:
        lda Rand8
        lsr
 ifconst Rand16
        rol Rand16      ; this command is only used if Rand16 has been defined
 endif
        bcc noeor
        eor #$B4 
noeor 
        sta Rand8
 ifconst Rand16
        eor Rand16      ; this command is only used if Rand16 has been defined
 endif
        rts
        
ResetStuff:

		lda #0
                sta HMP0
                sta HMP1
               
               
 		;
                sta GRP0
                sta GRP1                
                rts
   
ResetGame:
   	    lda #0
            sta BCDScore
            sta BCDScore + 1
            sta BCDScore + 2  
            sta levelID

            lda #START_LIVES
            sta lives
            
            rts