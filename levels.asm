        

;################################################
		;     00. 01  02. 03   04  05  06   07   08  09   10  11   12  13   14  15
LevelDataKeyX:	.byte 62, 30, 98, 154, 2,  41, 114, 121, 47, 113, 83, 106, 44, 142, 60, 148
		.byte 2, 150, 153, 84, 12, 125, 80, 1, 110, 23, 149, 153, 37,93, 80, 128
                
LevelDataKeyY:	.byte 50, 48, 24, 128, 128,100,50,  12,  44, 93,  8,  45,  86, 72, 8, 82
		.byte 115, 7, 95, 7, 120, 22, 76, 135, 16, 119, 47, 22, 93, 36, 14, 83
                
LevelDataSeed:	.byte 1,  13, 15, 17,  18, 19, 20,  23,  25, 26,  27, 30,  31, 32, 33, 34
		.byte 36, 37, 40, 41, 44, 45, 46, 47, 48, 49, 51, 53, 56, 59, 60
                
LevelOrder:	.byte 1, 0, 2, 6, 5, 7, 3, 8, 11, 12, 13, 14, 15, 4, 10, 9
		.byte 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31



GetLevelData:
	
      
        lda levelID
        and #%00011111
        tax
        lda LevelOrder,x
        tax
        
        lda LevelDataKeyX,x
        sta keyX
        
        lda LevelDataKeyY,x
        sta keyY
        
        lda LevelDataSeed,x
        sta Rand8
        
        lda levelID
        lsr
        sta Temp
        cmp #25
        bcc OkaySpeed
        
        lda #25
       
OkaySpeed:

 	sta Temp
        
        lda #START_SHOW
        sec
        sbc Temp
        sta levelShow
        sta flashCounter
        lsr
        sta blockCount
        
        lda #START_HIDE
        sec
        sbc Temp
        sta levelHide
        
        jsr Random
        and #%00000111
        tax
        lda PrincessPositions,x
        sta princessX
        
        inc levelID
       
 	rts
;---Graphics Da