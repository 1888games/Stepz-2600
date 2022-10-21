	

		
   		;ldx #0
                stx PF0
                stx PF1
                stx PF2
                ;stx HMP0
                ;stx HMP1
                ;stx GRP0
                
ProcessSwitches:
        lda SWCHB       ; load in the state of the switches
        lsr             ; D0 is now in C
        lsr
     ;   bcs NotReset    ; if D0 was on, the RESET switch was not held
;jsr InitPos     ; Prep for new game 
        ;lda #%10000000  
        ;sta GameState   ; set D7 on to signify Game Active      
        ;rts
        
NotReset:
       ; lsr             ; D1 is now in C
        bcs NotSelect
        lda moveDuringShow
        eor #%00000001
        sta moveDuringShow; clear D7 to signify Game Over
        
NotSelect:
        ;rts
                
             
                
 		;sta WSYNC
 		
		TIMER_SETUP 13
        
               
