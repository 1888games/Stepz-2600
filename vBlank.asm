

  
		
;------------------------------------------------
; Vertical Blank (37 scanlines)
;------------------------------------------------
SetupVBlankTimer:
		
  		TIMER_SETUP #VBLANK_TIME - 6
ResetSprites:
 		
            	lda #0
                sta VBLANK 
                sta PF0
                sta PF1
                sta PF2
                sta GRP0
                sta GRP1
                
                lda #GREEN + 10
                sta COLUPF

       	    	lda #YELLOW - 3 
            	sta pfColor
                
                ldx restarting
                beq NoCelebrate
                
                lda gameOver
                bne NoCelebrate
                
                lda delayTimer
                sta pfColor
                
                
		
NoCelebrate:             ;lda #%00000010
                ;sta CTRLPF
                
  
		jsr SetupScore  
                jsr Random
               
 	
             
                

                

                


                
 