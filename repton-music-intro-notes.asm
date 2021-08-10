; 2240
; Code will only play 52 notes (last 12 skipped)
; unless value at $2217 is changed

; Music Sequence is where the notes are
; represented as NO where N is the note
; and O is the octave
;       1      2      3
;     -----  -----  -----
;  1    D4    D4     --
;  2    E4    E4     --
;  3    F4    F4     --
;  4    G4    B2     D3  (G Major chord)
;  5    --    --     --
;  6    --    --     --
;  7    --    --     --
;  8    D#4   --     --

;  9    --    --     --
; 10    E4    --     --
; 11    --    --     --
; 12    --    --     --
; 13    --    --     --
; 14    C#4   --     --
; 15    --    --     --
; 16    D4    --     --

; 17    --    --    --
; 18    --    --    --
; 19    --    --    --
; 20    A#3   --    --
; 21    --    --    --
; 22    B3    --    --
; 23    --    --    --
; 24    --    --    --
    
; 25    --    --    --
; 26    F#3   --    --
; 27    --    --    --
; 28    G3    --    --
; 29    --    --    --
; 30    E3    --    --
; 31    --    --    --
; 32    D3    --    --

; 33    --    --    --
; 34    --    --    --
; 35    --    --    --
; 36    D2    D2    --
; 37    --    --    --
; 38    D4    --    --
; 39    --    --    --
; 40    --    --    --

; 41    --    --    --
; 42    D4    --    --
; 43    --    --    --
; 44    F3    G#3   B2
; 45    --    --    --
; 46    --    --    --
; 47    --    --    --
; 48    F3    G#3   B2

; 49    --    --    --
; 50    --    --    --
; 51    --    --    --
; 52    F#3   A3    C3
; [--Ends here by default (code looks for 52 notes)--]
; 53    --    --    --
; 54    --    --    --
; 55    --    --    --
; 56    --    --    --

; 57    --    --    --
; 58    --    --    --
; 59    --    --    --
; 60    --    --    --
; 61    --    --    --
; 62    --    --    --
; 63    --    --    --
; 64    --    --    --

; $3D - D2 
; $61 - B2
; $65 - C3
; $6D - D3
; $75 - E3
; $79 - F3
; $7D - F#3
; $81 - G3
; $85 - G#3 
; $89 - A3
; $8D - A#3
; $91 - B3
; $99 - C#4
; $9D - D4
; $A1 - D#4
; $A5 - E4
; $A9 - F4
; $B1 - G4

; Channel 1 notes
.music_intro_channel_1
    EQUB    $9D,$A5,$A9,$B1,$00,$00,$00,$A1
    EQUB    $00,$A5,$00,$00,$00,$99,$00,$9D
    EQUB    $00,$00,$00,$8D,$00,$91,$00,$00
    EQUB    $00,$7D,$00,$81,$00,$75,$00,$6D
    EQUB    $00,$00,$00,$3D,$00,$9D,$00,$00
    EQUB    $00,$9D,$00,$79,$00,$00,$00,$79
    EQUB    $00,$00,$00,$7D,$00,$00,$00,$00
    EQUB    $00,$00,$00,$00,$00,$00,$00,$00

; 2280
; Channel 2 notes
.music_intro_channel_2
    EQUB    $9D,$A5,$A9,$61,$00,$00,$00,$00
    EQUB    $00,$00,$00,$00,$00,$00,$00,$00
    EQUB    $00,$00,$00,$00,$00,$00,$00,$00
    EQUB    $00,$00,$00,$00,$00,$00,$00,$00
    EQUB    $00,$00,$00,$3D,$00,$00,$00,$00
    EQUB    $00,$00,$00,$85,$00,$00,$00,$85
    EQUB    $00,$00,$00,$89,$00,$00,$00,$00
    EQUB    $00,$00,$00,$00,$00,$00,$00,$00

; 22C0
; Channel 3 notes
.music_intro_channel_3
    EQUB    $00,$00,$00,$6D,$00,$00,$00,$00
    EQUB    $00,$00,$00,$00,$00,$00,$00,$00
    EQUB    $00,$00,$00,$00,$00,$00,$00,$00
    EQUB    $00,$00,$00,$00,$00,$00,$00,$00
    EQUB    $00,$00,$00,$00,$00,$00,$00,$00
    EQUB    $00,$00,$00,$61,$00,$00,$00,$61
    EQUB    $00,$00,$00,$65,$00,$00,$00,$00
    EQUB    $00,$00,$00,$00,$00,$00,$00,$00