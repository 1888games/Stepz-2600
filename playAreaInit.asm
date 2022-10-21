		
             	lda keyX
                ldx #$1
                jsr placeSprite
                
             
                sta WSYNC
           
                lda #0
                sta COLUBK
         
       		
               ; TIMER_SETUP 180
		