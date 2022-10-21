

;------------------------------------------------
; Constants
;------------------------------------------------

; Modify values to suit style
; 
FACE_DURATION = 25	; Number of frames each face lasts on screen. Decrease to speed up, increase to slow down.
SPRITE_HEIGHT = 4; Native number of pixels tall the sprite is (before being stretched by a 2LK or whatever).
NUM_ANIMATION_FACES = 1	; Number of faces of animation. (!)Corresponds with number of color tables(!)					; If true, sprite mirrors when moved left.



THREE_COPIES = %011

LEFT_FULL = %11110000
RIGHT_FULL = %00001111
BOTH_FULL = %11111111
EMPTY = %00000000

START_X = 6 
START_Y = SPRITE_HEIGHT + 4

START_SHOW = 80
START_HIDE = 120

SHOW_PER_LEVEL = 3
HIDE_PER_LEVEL = 4
START_LIVES = 3




NO_ILLEGAL_OPCODES = 0

;------------------------------------------------
; Region
;------------------------------------------------

NTSC            = 0
PAL             = 1
COMPILE_VERSION =  NTSC

    IF COMPILE_VERSION = NTSC
   
VBLANK_TIME = 37
OVERSCAN_TIME = 30
kernel_lines = 192


    ELSE
    
VBLANK_TIME = 64
OVERSCAN_TIME = 52
kernel_lines = 192

    ENDIF

playfield_lines = 45
playfield_line_height = 3
padding_lines = 1

playfield_scanlines = #playfield_lines*#playfield_line_height
remaining_lines = #kernel_lines-#playfield_scanlines-#padding_lines-2



;------------------------------------------------
; TIA Music Player
;------------------------------------------------


; 1: Global song speed, 0: Each pattern has individual speed
TT_GLOBAL_SPEED         = 1
; duration (number of TV frames) of a note
TT_SPEED                = 3
; duration of odd frames (needs TT_USE_FUNKTEMPO)
TT_ODD_SPEED            = 3

; 1: Overlay percussion, +40 bytes
TT_USE_OVERLAY          = 0
; 1: Melodic instrument slide, +9 bytes
TT_USE_SLIDE            = 0
; 1: Goto pattern, +8 bytes
TT_USE_GOTO             = 1
; 1: Odd/even rows have different SPEED values, +7 bytes
TT_USE_FUNKTEMPO        = 0
; If the very first notes played on each channel are not PAUSE, HOLD or
; SLIDE, i.e. if they start with an instrument or percussion, then set
; this flag to 0 to save 2 bytes.
; 0: +2 bytes
TT_STARTS_WITH_NOTES    = 0