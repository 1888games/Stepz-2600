
	
	 ;jsr tt_Player
        
NoKey:
	
         lda delayTimer
         beq NoDelay
         
         sta showPlayfield
         
         dec delayTimer
         bne NoRestart
         
         lda #START_X
         sta playerX
            
         lda #START_Y
         sta playerY
         
         lda #2
         sta power
         
         lda #0
         sta frameCounter
       
     
          
NoDelay:

	  sta  CXCLR 
          lda restarting
          beq NoRestart
          

          TIMER_WAIT
          
          lda gameOver
          beq NotGameOver3
          
          lda #80
          sta delayTimer
          
          inc titleScreen
          jmp StartOfFrame
          
NotGameOver3:

      	jmp NewLevel
 
 
NoRestart:
	
         
     
         
	TIMER_WAIT

        jmp StartOfFrame
                