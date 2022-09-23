



DontHide:            
	
        lda brickIndex
        bmi NoBadBrick
        
 	lda #%10000000
	bit CXP1FB
	bne RemoveBrick
        
        bit CXP0FB
        bne RemoveBrick
        
        jmp NoWallCheck
        
        
RemoveBrick:

        ldx brickIndex
        lda brickData
        sta rowData,x
        
        jmp NoWallCheck
        
NoBadBrick:
		
        lda delayTimer
        bne NoWallCheck
        
 	lda #%10000000
 	bit CXP0FB
        beq NoWallCheck
        
HitWall:
        
         lda #70
         sta delayTimer
          

         dec lives
         bpl NotGameOver2
         
         inc gameOver
         
         ldy #sfxGAMEOVER
         jsr SFX_TRIGGER
         
         jsr CheckHighScore
         
         lda #0
         sta lives
         
         jmp NoWallCheck

NotGameOver2:
	
        ldy #sfxGAMEOVER
        jsr SFX_TRIGGER