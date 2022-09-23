	            
VerticalBlank	
		TIMER_WAIT

VisibleScreen:
                TIMER_SETUP 19
                

                lda #SCORE_BG_COLOR
                sta COLUBK

DrawTheScore:
                jsr DrawDigits
                
                
             
             	lda #0
                sta NUSIZ0
     		sta NUSIZ1
                sta RESP0
                sta RESP1
                

            