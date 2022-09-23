

CheckFlash:	

	    

              lda flashCounter
              bne NoSwitch
         
           
              lda showPlayfield
              eor #%00000001
              sta showPlayfield
              
              ldy delayTimer
              bne CheckBonus3
              
              cmp #0
              beq Lowa
         
              ldy #sfxBeepHigh
              jsr SFX_TRIGGER
              
              jmp CheckBonus3

Lowa:
              ldy #sfxBeepLow
              jsr SFX_TRIGGER

CheckBonus3:
                
	 	;inc playerX
           	
  		
              lda bonus
              beq NoReduceBonus
ReduceBonus:              
              sed
              sec
              sbc #1
              sta bonus
    
              cld
              
NoReduceBonus:           
              lda power
              beq ContinuePower

              lda usedPower
              beq ContinuePower

              dec power

              lda #0
              sta usedPower

ContinuePower:

              ldx showPlayfield
              lda levelShow,x
              sta flashCounter

              jmp DontHide

NoSwitch:

              dec flashCounter

              ldx showPlayfield
              beq NoNewBlock

              lda flashCounter

              cmp blockCount
              beq FillBlock

              jmp DontHide
                
NoNewBlock:
                
            
                jmp MoveJoystick
      
		       
FillBlock:  
		lda brickIndex
                bpl Exit
                
                jsr Random
                and #%00011111
                clc
                adc #1
                tax
                stx brickIndex

                lda rowData,x
                sta brickData

                jsr Random
                and #%00001111
                tay

                lda brickData
                ora POT,y    
                sta rowData,x
Exit:
                jmp DontHide



