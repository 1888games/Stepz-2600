
 ;----------------
                org $FFFA
                
InterruptVectors

    .word VBlank           ; NMI
    .word Reset           ; RESET
    .word VBlank             ; IRQ

