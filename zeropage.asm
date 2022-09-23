

;------------------------------------------------
; Variables
;------------------------------------------------

frameCounter		ds 1
Temp			ds 1
LoopCount		ds 1
Digit0			word 1
Digit1			word 1
Digit2			word 1
Digit3			word 1
Digit4 			word 1
Digit5			word 1
restarting		ds 1
Rand8			ds 1
playerX			ds 1
playerY			ds 1
kernelY			ds 1
showPlayfield		ds 1
currentSpriteLine	ds 1
keySpriteLine		ds 1
pfColor			ds 1
keyY			ds 1
keyX			ds 1
brickData		ds 1
brickIndex		ds 1
flashCounter		ds 1
levelShow		ds 1
levelHide		ds 1
keyFramePointer		word 1
colorFramePointer	word 1
princessX		ds 1
doorOpen		ds 1
blockCount		ds 1
lives			ds 1
gameOver		ds 1
fireHeld		ds 1
levelID			ds 1
power			ds 1
fireLastFrame		ds 1
usedPower		ds 1
bonus			ds 1
canMoveLight		ds 1
SFX_LEFT:      		ds 1    ; stored in $B1
SFX_RIGHT:      	ds 1    ; stored in $B2
titleScreen		ds 1
PlayFieldHeightCounter  ds 1
PlayFieldLinesCounter   ds 1
padding			ds 1
addressPointer		word 1
rowData			ds 39
delayTimer		ds 1
KeyColours		ds 4
kernalRow		ds 1
tt_timer                ds 1    ; current music timer value
tt_cur_pat_index_c0     ds 1    ; current pattern index into tt_SequenceTable
tt_cur_pat_index_c1     ds 1
tt_cur_note_index_c0    ds 1    ; note index into current pattern
tt_cur_note_index_c1    ds 1
tt_envelope_index_c0    ds 1    ; index into ADSR envelope
tt_envelope_index_c1    ds 1
tt_cur_ins_c0           ds 1    ; current instrument
tt_cur_ins_c1           ds 1
tt_ptr                  ds 2
BCDScore		hex 000000
BCDHigh			hex 000000
steps			ds 1
isMoving		ds 1
bounceAmount		ds 1
yUse			ds 1
switched		ds 1
 
 