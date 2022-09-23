
        
    
;---End Graphics Data---
	 org $FF00
; Font table for digits 0-9 (8x8 pixels)
        ;align $100 ; make sure data doesn't cross page boundary
;;{w:8,h:8,count:10,brev:1,flip:1};;
FontTable
	hex 003c6666766e663c007e181818381818
        hex 007e60300c06663c003c66061c06663c
        hex 0006067f661e0e06003c6606067c607e
        hex 003c66667c60663c00181818180c667e
        hex 003c66663c66663c003c66063e66663c
        


SpriteGraphicTable

Frame0
        .byte #%11100000;$88
        .byte #%11100000;$3E
        .byte #%01000000;$3E
        .byte #%11100000;$1C

Frame4
        .byte #%00110000;$88
        .byte #%00010000;$3E
        .byte #%00101000;$3E
        .byte #%00111000;$1C
        .byte #%00111001;$1E
Frame1
        .byte #%11100000;$68
        .byte #%11100000;$66
        .byte #%01000000;$3E
        .byte #%11100000;$1E
        
        
Frame2
     	.byte #%00000000;$88
        .byte #%00110000;$3E
        .byte #%00001000;$3E
        .byte #%00110000;$1C
;---End Graphics Data---


;---Color Data from PlayerPal 2600---

ColorFrame0
        .byte #$88;
        .byte #$3E;
        .byte #$3E;
        .byte #BROWN +3;
ColorFrame1
        .byte #$68;
        .byte #$66;
        .byte #$3E;
        .byte #$1E;


;---End Color Data---


LiveCopies:	.byte 0, 0, 1, 3
PowerScores:	.byte 0, $03, $06, $10
PrincessPositions:	.byte 2, 30, 62, 82, 110, 142, 62, 82
	    	
POT:		.byte 1, 2, 4, 8, 16, 32, 64, 128
		.byte 129, 66, 36, 65, 130, 68, 33, 17
                
ModeBG:		.byte 0, RED + 5               