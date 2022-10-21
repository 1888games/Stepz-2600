
		
;------------------------------------------------
; Start Frame
;------------------------------------------------

StartOfFrame:
		
;------------------------------------------------
; Vertical Sync (3 scanlines)
;------------------------------------------------
		
           	lda titleScreen
                beq UseGameKernal
               	
                jmp NextFrame
             
UseGameKernal:                       ; Enable VBLANK (disable output)
                lda #2
                sta VBLANK
                sta VSYNC
                
                
        ; And hold it on for 3 scanlines...
                sta WSYNC
                sta WSYNC  
              	
                lda frameCounter      
                and #%00001111
                adc #1
                adc #YELLOW
                sta KeyColours
                sta KeyColours + 1
                sta KeyColours + 2
                sta KeyColours + 3
NoChange:

                sta WSYNC
                
                lda #0
                sta VSYNC

          
                inc frameCounter
             