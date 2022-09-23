
                processor 6502


                SEG.U vars	; the label "vars" will appear in our symbol table's segment list
                ORG $80		; start of RAM

Labels:
                include "zeropage.asm"
                include "constants.asm"
                include "vcs.h"
		include "colours.asm"
                
Macros:
                include "macro.h"

		SEG     	
		ORG $F000

VBlank:

                include "newGame.asm"  
		include "vSync.asm"
		include "vBlank.asm"
                
Score:

             	include "displayScore.asm"
		include "playAreaInit.asm"

PlayArea:
		include "gameKernal.asm"
   
                
Overscan:
		include "overscan.asm"
		include "lives.asm"
                
		include "checkGameOver.asm"	
		include "checkFlash.asm"	
		include "controls.asm"
		
		include "wallcheck.asm"
		include "keyPrincess.asm"
		include "endFrame.asm"
                

Subroutines:
             
                include "score.asm"

Data:
		;include "musicData.asm"
                ;include "musicPlayer.asm"
                
		include "levels.asm"
                
	 
                
                
		include "title.asm"

		include "sfx.asm"
		include "graphics.asm" 
                include "functions.asm"
                		
		include "vectors.asm"
		


	

