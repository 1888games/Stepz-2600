

MoveJoystick

	ldx #0
        stx isMoving
	
        lda power
        bne NoRemove

        stx fireHeld
       
        
NoRemove:
        lda frameCounter
        and #%00000001
        clc
        adc fireHeld
        beq DontHide
; Move vertically
; (up and down are actually reversed since ypos starts at bottom)
	ldx playerY
	lda #%00100000	;Up?
	bit SWCHA
	bne SkipMoveUp
        cpx #8
        bcc SkipMoveUp
        dex
        inc isMoving
SkipMoveUp
	lda #%00010000	;Down?
	bit SWCHA 
	bne SkipMoveDown
        cpx #220
        bcs SkipMoveDown
        inx
        inc isMoving
SkipMoveDown
	stx playerY
; Move horizontally
        ldx playerX
	lda #%01000000	;Left?
	bit SWCHA
	bne SkipMoveLeft
        cpx #1
        bcc SkipMoveLeft
        dex
        inc isMoving
SkipMoveLeft
	lda #%10000000	;Right?
	bit SWCHA           
	bne SkipMoveRight
        cpx #157
        bcs SkipMoveRight
        inx
        inc isMoving
SkipMoveRight
	stx playerX
	
Switches:


	
;lda SWCHB
        ;lsr
        ;bcs NoReset
        
        ;jmp NoClear 
        
NoReset:	

        
        lda isMoving
        beq NotMoving
        
        inc steps
        inc steps
        lda steps
        and #%00000111
        bne NotMoving
        
        ldy #sfxCOLLIDE
        jsr SFX_TRIGGER
        
        jsr AddOne
        
      
        
        
NotMoving:
;SWCHB.0    Reset Button          (0=Pressed)
 ; SWCHB.1    Select Button         (0=Pressed)
 ; SWCHB.2    Not used
  ;SWCHB.3    Color Switch          (0=B/W, 1=Color) (Always 0 for SECAM)
  ;SWCHB.4-5  Not used
  ;SWCHB.6    P0 Difficulty Switch  (0=Beginner (B), 1=Advanced (A))
  ;SWCHB.7    P1 Difficulty Switch  (0=Beginner (B), 1=Advanced (A))
