Reset	
	    CLEAN_START
NoClear           
             inc titleScreen
            
            

SoftReset
            lda #0
            sta gameOver
            
            
            beq Initialise
             
            jmp StartOfFrame
             
Initialise:           
          
            jsr ResetGame
      

NewLevel:       	
       		

        
            lda #START_X
            sta playerX
            
            lda #1
            sta showPlayfield
            sta padding
            
            lda #3
            sta power
          
            
            lda #255
            sta brickIndex
            
            lda #0
            sta doorOpen
            sta restarting
            sta usedPower
            sta Temp
            
            lda #$25
            sta bonus
         
            
            lda #START_Y
            sta playerY
            
            lda #<Frame4
            sta keyFramePointer
            
            lda #>Frame4
            sta keyFramePointer + 1
            
            lda #KeyColours
            sta colorFramePointer
            
            lda #>KeyColours
            sta colorFramePointer + 1
            
            jsr GetLevelData
            ;jsr Random
            
            ldx #38
RLoop:

	    jsr Random
            ;jsr Random
           ; jsr Random
            ;jsr Random
        
            eor rowData+1,x
            sta rowData,x
                
            dex
            bne RLoop

	    lda #$00
            sta rowData
            
            lda #$ff
            sta rowData + 38
            sta rowData + 37
            sta rowData + 36
            
             	
           lda frameCounter
           sta Rand8
       