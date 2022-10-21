
		ldy lives      
                lda LiveCopies,y
                sta NUSIZ0
                
                ldy power
                lda LiveCopies,y
                sta NUSIZ1
                
                lda YELLOW + 15
                sta COLUP1
                
                ldx #0
                lda #5  
                jsr placeSprite
                
                ldx #1
                lda #60
                jsr placeSprite
                
 		
                ldy #3
LivesLoop:         
		
                lda lives
                beq NoLives

		lda ColorFrame0,y
                sta COLUP0
                
                lda SpriteGraphicTable,y
                sta GRP0
 
NoLives:	
		
                lda power
                beq NoPower
              
                lda Frame2,y
                sta GRP1
                
                lda lives
                bne NoPower
                
                sta GRP0

NoPower:

 		sta WSYNC                
                sta WSYNC
                dey
                bpl LivesLoop
                
                
SkipLives:            
		
		jsr ResetStuff
             
              	TIMER_WAIT
	
		lda #%00000010				;2
		sta VBLANK           		;3 end of screen - enter blanking
               
                
               
            ;------------------------------------------------
; Overscan (30 scanlines)
;----------------------------- -------------------
		TIMER_SETUP #OVERSCAN_TIME - 2
         
              
		; Manage the frame delay between face animations.

                  
                