

CheckGameOver:

  
        jsr SFX_UPDATE

	
	lda fireHeld
        sta fireLastFrame

	lda #0
        sta fireHeld

 	lda #%10000000			; read button input
        bit INPT4
        bmi SkipFire
		
	inc fireHeld
        
        lda showPlayfield
        bne SkipFire
        
        inc usedPower
        
SkipFire:

       	lda gameOver
        beq CheckFlash
        
        lda fireHeld
        beq NoFireButton
    
        lda #0
        sta keyY

        inc restarting       

        jsr ResetGame
                   
NoFireButton:  

	jmp NoKey


