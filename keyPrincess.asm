

NoWallCheck:

 
        lda #255
        sta brickIndex
	
        lda delayTimer
        bne NoKey
        
        
        lda #%10000000
        bit CXPPMM
        beq NoKey
        
        lda doorOpen
        beq GotKey

CompletedLevel:

        ;lda #0
        ;sta keyY
        
        ldy #sfxCOLLECT; else do a sound effect
        jsr SFX_TRIGGER
        
        lda #100
        sta delayTimer 
        
        lda keyX
        sta playerX
        
        lda keyY
        sta playerY
        
        inc restarting
        
        lda #0
        tay 
        ldx bonus
        jsr AddScore
        
        ldx power
        lda PowerScores,x
        tax
        
        lda #0
         tay
        jsr AddScore
   	
   	
    
        jmp NoKey
        
GotKey:
        
        lda #%11100111
        
      
       	sta rowData + 37
        sta rowData + 38
       
        ldy #sfxPING; else do a sound effect
        jsr SFX_TRIGGER
        
 
        lda #%11000000
        sta rowData + 36
        
        inc doorOpen
        
        lda #151
        sta keyY
        
        lda princessX
        sta keyX

        lda #<Frame1
        sta keyFramePointer

        lda #>Frame1
        sta keyFramePointer + 1

        lda #<ColorFrame1
        sta colorFramePointer

        lda #>ColorFrame1
        sta colorFramePointer + 1

        