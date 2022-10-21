

;------------------------------------------------
; Picture (192 scanlines)
;------------------------------------------------		
        	
	

ResetForGame:	
		
   
                ldx #0
        	stx VDELP0
                stx COLUPF
    
                lda playerX
                jsr placeSprite
   
                lda #RED + 5
                sta COLUP0
                
                lda #YELLOW + 10
                sta COLUP1
		
                lda #152
                sta kernelY
                
                lda #SPRITE_HEIGHT-1	;37		
		sta currentSpriteLine	;40
                sta keySpriteLine
                
                lda #36
                sta Temp
                
                lda #12
                sta kernalRow
           
                lda keyY
                sta yUse
      		
                lda delayTimer
                clc
                adc gameOver
                sta delayTimer        

NoBlock:             
             	
   

                TIMER_WAIT
                
                lda restarting
                bne NoBounce
                        
                lda delayTimer
                and #%00000011
                tax   

LineLoop:
		beq NoBounce
		sta WSYNC
                dex
                jmp LineLoop
               
             
NoBounce:                
               	  SLEEP 24
		jmp KernalRowLoop
         
        	
               ALIGN 256
             
KernalRowLoop:

	;MAC ROW_KERNAL



                ldx #6

               	lda pfColor
               	clc
                adc #16
                sta COLUPF
                sta pfColor
               
               	lda showPlayfield	;6
                bne .DoShow
                
                SLEEP 24
               
                jmp .GameKernal

.DoShow:

            	
                ldy Temp
              
                         
                lda rowData,y		;10
                sta PF0		 
                
                lda rowData + 1,y	;17
                sta PF1			;20
                
                lda rowData + 2,y	;24
                sta PF2			;27

   
.GameKernal:							;3
		 sty WSYNC
               
          	                
 
.RowLoop:
		lda kernelY			;30
            
		cmp playerY		;33	
		bcs .NoPlayer			
               								
		ldy currentSpriteLine	;43		
                bmi .NoPlayer		;46		

		lda SpriteGraphicTable,y		
		sta GRP0		
                
                lda ColorFrame0,y
                sta COLUP0
               		
		dec currentSpriteLine			;39
                
             
                
                jmp .EndLoop
.NoPlayer:               
		
                lda #0
                sta GRP0
           	

.EndLoop          
			;3
               	dec kernelY
          
                lda yUse 
                 sty WSYNC
                beq .NoPlayer2

		cmp kernelY		;33	
		bcc .NoPlayer2			
               								
		ldy keySpriteLine	;43		
                bmi .NoPlayer2		;46		

		lda (keyFramePointer),y		
		sta GRP1	
                
                lda (colorFramePointer),y
                sta COLUP1
                

                dec keySpriteLine
                
                jmp .NextScanline

.NoPlayer2:  	
		
		lda #0
                sta GRP1
                

.NextScanline:
		
               
                dec kernelY		;32
                dex			;34 
               
                bne .GameKernal		;36
               	
                lda Temp
                sec 
                sbc #3
                sta Temp
                
                lda restarting
                beq .NoGreen
                
                lda #GREEN - 6
;sta pfColor
                jmp .NoRed
.NoGreen:               

                lda delayTimer
                beq .NoRed   
             
                lda #RED - 14
                sta pfColor
                
                
.NoRed:
                
               	dec kernalRow
                bmi Finished 
                
                jmp KernalRowLoop 
              
Finished:       	
		
                lda delayTimer
                sec
                sbc gameOver
                sta delayTimer
         
                
                 
                

           	
