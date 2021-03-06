; Mapping of objects to individual tiles
; Each object is 4 x 4 tiles and the entry below
; specifies those 16 tiles for each
;
; Obj   Description of object
; ---   ---------------------
; $00	Top left rounded brick with yellow border left and top
; $01	Top right rounded brick with yellow border right and top
; $02	Bottom left rounded brick with yellow border left and bottom
; $03	Bottom right rounded brick with yellow border right and bottom
; $04	No curves brick with yellow border left
; $05	No curves brick with yellow border right
; $06	No curves brick with yellow border top
; $07	No curves brick with yellow border bottom
; $08	No curves brick with no yellow border
; $09	Top left rounded solid with yellow border left and top
; $0A	Top right rounded solid with yellow border right and top
; $0B	Bottom left rounded solid with yellow border left and bottom
; $0C	Bottom right rounded solid with yellow border right and bottom
; $0D	No curves solid with yellow border left
; $0E	No curves solid with yellow border right
; $0F	No curves solid with yellow border top
; $10	No curves solid with yellow border bottom
; $11	No curves solid with no yellow border
; $12	Yellow bricks on solid red with no border
; $13	Four circular bricks with yellow border
; $14	Two vertical oval bricks with yellow border
; $15	Two horizontal oval bricks with yellow border
; $16	Brick
; $17	Safe
; $18	Earth 1 
; $19	Earth 2
; $1A	Green Mesh Earth
; $1B	Key
; $1C	Egg
; $1D	Rock
; $1E	Diamond
; $1F	Empty
;
; The following conventions are used for 
; naming the tile positions for an object
; where the object is completely defined
; and not made out of repeating sprites or
; segments
;
; (0,0) (1,0) (2,0) (3,0)
; (0,1) (1,1) (2,1) (3,1)
; (0,2) (1,2) (2,2) (3,2)
; (0,3) (1,3) (2,3) (3,3)
;
; Each tile is 8 bytes vertically 
; and 1 byte wide (so 8 bytes in)
;
; The tiles are referenced as below:
;
; Tile  Description of tile
; ----  ---------------------------------------------
; $00   Rock (0,0) top left rounded corner with yellow edge
; $01   Rock (0,1) top middle left curving with yellow edge
; $02   Rock (0,2) top middle right curving with yellow edge
; $03   Rock (0,3) top right rounded corner with yellow edge
;
; $04   Egg  (0,0) top left 
; $05   Egg  (0,1) top middle left curving 
; $06   Egg  (0,2) top middle right curving 
; $07   Egg  (0,3) top right
;
; $08   Key  (0,0) top left 
; $09   Key  (0,1) top middle left curving 
; $0A   Key  (0,2) top middle right curving 
; $0B   Key  (0,3) top right
;
; $0C   Solid rectangle no coloured edges
; $0D   Solid rectangle with yellow left edge
; $0E   Solid rectangle with yellow bottom edge
; $0F   Solid rectangle with yellow right edge
; $10   Solid rectangle with yellow top edge
; $11   Solid curving top left side with yellow left edge
; $12   Solid curving top right side with yellow right edge
; $13   Solid curving bottom left side with yellow left edge
; $14   Solid curving bottom right side with yellow right edge
;
; $15   Small brick pattern no yellow edges
; $16   Small brick pattern with left yellow edge
; $17   Small brick pattern with right yellow edge
; $18   Small circle bottom left brick pattern with left yellow edge
; $19   Small circle bottom right brick pattern with right yellow edge
; $1A   Small circle top left brick pattern with left yellow edge and line on bottom
; $1B   Small circle top right brick pattern with right yellow edge and line on bottom
; 
; $1C   Left hand top sloping side of diamond
; $1D   Right hand top sloping side of diamond
; $1E   Left hand bottom sloping side of diamond
; $1F   Right hand bottom sloping side of diamond
; $20   Middle of diamond 1
; $21   Middle of diamond 2
;
; $22   Earth segment 1
; $23   Earth segment 2
; $24   Earth segment 3
; $25   Earth segment 4
; $26   Earth segment 5
; $27   Earth segment 6
;
; $28   Rock (1,0) upper middle row with left yellow edge
; $29   Rock (1,1) upper middle row middle left
; $2A   Rock (1,2) upper middle row middle right
; $2B   Rock (1,3) upper middle row with right yellow edge
;
; $2C   Egg  (1,0) upper middle row left edge
; $2D   Egg  (1,1) upper middle row middle left
; $2E   Egg  (1,2) upper middle row middle right
; $2F   Egg  (1,3) upper middle row right edge
;
; $30   Key  (1,0) upper middle row with left edge
; $31   Key  (1,1) upper middle row middle left
; $32   Key  (1,2) upper middle row middle right
; $33   Key  (1,3) upper middle row with right edge
;
; $34   Yellow brick on solid red left hand edge
; $35   Yellow brick on solid red middle
; $36   Yellow brick on solid red right hand edge
;
; $37   Safe top left
; $38   Safe top middle
; $39   Safe top right corner
; $3A   Safe middle left
; $3B   Safe middle middle
; $3C   Safe middle right
; $3D   Safe bottom left
; $3E   Safe bottom middle
; $3F   Safe bottom right
;
; $40   Brick interior 1 
; $41   Brick interior 2 
; $42   Brick with yellow top edge 1 
; $43   Brick with yellow top edge 2
; $44   Brick with yellow left edge
; $45   Brick with yellow right edge
; $46   Brick with yellow bottom edge 1
; $47   Brick with yellow bottom edge 2
; $48   Brick with rounded top left corner with yellow edge
; $49   Brick with slightly rounded left and flat top with yellow edge
; $4A   Brick with slightly rounded right and flat top with yellow edge
; $4B   Brick with rounded top right corner with yellow edge
; $4C   Brick with rounded bottom left corner with yellow edge
; $4D   Brick with slightly rounded left and flat bottom with yellow edge
; $4E   Brick with slightly rounded right and flat bottom with yellow edge
; $4F   Brick with rounded bottom right corner with yellow edge
;
; $50   Rock (2,0) lower middle row with left yellow edge
; $51   Rock (2,1) lower middle row middle left
; $52   Rock (2,2) lower middle row middle right
; $53   Rock (2,3) lower middle row with right yellow edge
;
; $54   Egg  (2,0) lower middle row left edge
; $55   Egg  (2,1) lower middle row middle left
; $56   Egg  (2,2) lower middle row middle right
; $57   Egg  (2,3) lower middle row right edge
;
; $58   Key  (2,0) lower middle row with left edge
; $59   Key  (2,1) lower middle row middle left
; $5A   Key  (2,2) lower middle row middle right
; $5B   Key  (2,3) lower middle row with right edge
;
; $5C   Character - 0
; $5D   Character - 1
; $5E   Character - 2
; $5F   Character - 3
; $60   Character - 4
; $61   Character - 5
; $62   Character - (
; $63   Character - )
;
; $64   Character - top left hand side rounded brick
; $65   Character - top right hand side rounded brick
; $66   Character - bottom left hand side rounded brick
; $67   Character - bottom right hand side rounded brick
; $68   Character - earth 1
; $69   Character - earth 2
; $6A   Character - left hand brick edge
; $6B   Character - right hand brick edge
; $6C   Character - -
; $6D   Character - top brick edge
; $6E   Character - bottom brick edge
; $6F   Character - interior brick
; $70   Character - yellow red brick
; $71   Character - /
; $72   Character - four blocks
; $73   Black tile
; $74   Character - ?
; $75   Character - two vertical oval blocks
; $76   Character - two horizontal oval blocks
; $77   Character - inverted brick
;
; $78   Rock (3,0) bottom left rounded corner with yellow edge
; $79   Rock (3,1) bottom middle left curving with yellow edge
; $7A   Rock (3,2) bottom middle right curving with yellow edge
; $7B   Rock (3,3) bottom right rounded corner with yellow edge
;
; $7C   Egg  (3,0) bottom left 
; $7D   Egg  (3,1) bottom middle left curving 
; $7E   Egg  (3,2) bottom middle right curving 
; $7F   Egg  (3,3) bottom right
;
; $80   Key  (3,0) bottom left 
; $81   Key  (3,1) bottom middle left curving 
; $82   Key  (3,2) bottom middle right curving 
; $83   Key  (3,3) bottom right
;
; $84   Character - 6
; $85   Character - 7
; $86   Character - 8
; $87   Character - 9
; $88   Character - A
; $89   Character - B
; $8A   Character - C
; $8B   Character - D
; $8C   Character - E
; $8D   Character - F
; $8E   Character - G
; $8F   Character - H
; $90   Character - I
; $91   Character - J
; $92   Character - K
; $93   Character - L
; $94   Character - M
; $95   Character - N
; $96   Character - O
; $97   Character - P
; $98   Character - Q
; $99   Character - R
; $9A   Character - S
; $9B   Character - T
; $9C   Character - U
; $9D   Character - V
; $9E   Character - W
; $9F   Character - X
; $A0   Character - Y
; $A1   Character - Z
; $A2   Character - a
; $A3   Character - b
; $A4   Character - c
; $A5   Character - d
; $A6   Character - e
; $A7   Character - f
; $A8   Character - g
; $A9   Character - h
; $AA   Character - i
; $AB   Character - j
; $AC   Character - k
; $AD   Character - l
; $AE   Character - m
; $AF   Character - n
; $B0   Character - o
; $B1   Character - p
; $B2   Character - q
; $B3   Character - r
; $B4   Character - s
; $B5   Character - t
; $B6   Character - u
; $B7   Character - v
; $B8   Character - w
; $B9   Character - x
; $BA   Character - y
; $BB   Character - z
; $BC   Character - !
; $BD   Character - Safe
; $BE   Character - Key
; $BF   Character - Egg
; $C0   Character - Rock
; $C1   Character - :
; $C2   Character - .
; $C3   Character - Diamond
; $C4   Character - [
; $C5   Character - ]
; $C6   Character - =
; $C7   Character = *


; Object definitions
; -------------------
; The tables below specify the 4x4 tiles that make
; up an object - each byte is a reference to the
; the tiles above 
;
; e.g. $48 is a "Brick with rounded top left corner with yellow edge"
;
; $00	Top left rounded brick with yellow border left and top
        EQUB    $48,$49,$42,$43
        EQUB    $44,$41,$40,$41
        EQUB    $44,$41,$40,$41
        EQUB    $44,$41,$40,$41

; $01	Top right rounded brick with yellow border right and top        
        EQUB    $42,$43,$4A,$4B
        EQUB    $40,$41,$40,$45
        EQUB    $40,$41,$40,$45
        EQUB    $40,$41,$40,$45

; $02	Bottom left rounded brick with yellow border left and bottom
        EQUB    $44,$41,$40,$41
        EQUB    $44,$41,$40,$41
        EQUB    $44,$41,$40,$41
        EQUB    $4C,$4D,$46,$47

; $03	Bottom right rounded brick with yellow border right and bottom
        EQUB    $40,$41,$40,$45
        EQUB    $40,$41,$40,$45
        EQUB    $40,$41,$40,$45
        EQUB    $46,$47,$4E,$4F

; $04	No curves brick with yellow border left
        EQUB    $44,$41,$40,$41
        EQUB    $44,$41,$40,$41
        EQUB    $44,$41,$40,$41
        EQUB    $44,$41,$40,$41

; $05	No curves brick with yellow border right
        EQUB    $40,$41,$40,$45
        EQUB    $40,$41,$40,$45
        EQUB    $40,$41,$40,$45
        EQUB    $40,$41,$40,$45

; $06	No curves brick with yellow border top
        EQUB    $42,$43,$42,$43
        EQUB    $40,$41,$40,$41
        EQUB    $40,$41,$40,$41
        EQUB    $40,$41,$40,$41

; $07	No curves brick with yellow border bottom
        EQUB    $40,$41,$40,$41
        EQUB    $40,$41,$40,$41
        EQUB    $40,$41,$40,$41
        EQUB    $46,$47,$46,$47

; $08	No curves brick with no yellow border
        EQUB    $40,$41,$40,$41
        EQUB    $40,$41,$40,$41
        EQUB    $40,$41,$40,$41
        EQUB    $40,$41,$40,$41
; $09	Top left rounded solid with yellow border left and top
        EQUB    $11,$10,$10,$10
        EQUB    $0D,$0C,$0C,$0C
        EQUB    $0D,$0C,$0C,$0C
        EQUB    $0D,$0C,$0C,$0C
; $0A	Top right rounded solid with yellow border right and top
        EQUB    $10,$10,$10,$12
        EQUB    $0C,$0C,$0C,$0F
        EQUB    $0C,$0C,$0C,$0F
        EQUB    $0C,$0C,$0C,$0F

; $0B	Bottom left rounded solid with yellow border left and bottom
        EQUB    $0D,$0C,$0C,$0C
        EQUB    $0D,$0C,$0C,$0C
        EQUB    $0D,$0C,$0C,$0C
        EQUB    $13,$0E,$0E,$0E

; $0C	Bottom right rounded solid with yellow border right and bottom
        EQUB    $0C,$0C,$0C,$0F
        EQUB    $0C,$0C,$0C,$0F
        EQUB    $0C,$0C,$0C,$0F
        EQUB    $0E,$0E,$0E,$14

; $0D	No curves solid with yellow border left
        EQUB    $0D,$0C,$0C,$0C
        EQUB    $0D,$0C,$0C,$0C
        EQUB    $0D,$0C,$0C,$0C
        EQUB    $0D,$0C,$0C,$0C

; $0E	No curves solid with yellow border right
        EQUB    $0C,$0C,$0C,$0F
        EQUB    $0C,$0C,$0C,$0F
        EQUB    $0C,$0C,$0C,$0F
        EQUB    $0C,$0C,$0C,$0F

; $0F	No curves solid with yellow border top
        EQUB    $10,$10,$10,$10
        EQUB    $0C,$0C,$0C,$0C
        EQUB    $0C,$0C,$0C,$0C
        EQUB    $0C,$0C,$0C,$0C

; $10	No curves solid with yellow border bottom
        EQUB    $0C,$0C,$0C,$0C
        EQUB    $0C,$0C,$0C,$0C
        EQUB    $0C,$0C,$0C,$0C
        EQUB    $0E,$0E,$0E,$0E

; $11	No curves solid with no yellow border
        EQUB    $0C,$0C,$0C,$0C
        EQUB    $0C,$0C,$0C,$0C
        EQUB    $0C,$0C,$0C,$0C
        EQUB    $0C,$0C,$0C,$0C

; $12	Yellow bricks on solid red with no border
        EQUB    $34,$35,$35,$36
        EQUB    $35,$36,$34,$35
        EQUB    $34,$35,$35,$36
        EQUB    $35,$36,$34,$35

; $13	Four circular bricks with yellow border
        EQUB    $1A,$1B,$1A,$1B
        EQUB    $18,$19,$18,$19
        EQUB    $1A,$1B,$1A,$1B
        EQUB    $18,$19,$18,$19

; $14	Two vertical oval bricks with yellow border
        EQUB    $1A,$1B,$1A,$1B
        EQUB    $16,$17,$16,$17
        EQUB    $16,$17,$16,$17
        EQUB    $18,$19,$18,$19

; $15	Two horizontal oval bricks with yellow border
        EQUB    $11,$10,$10,$12
        EQUB    $13,$0E,$0E,$14
        EQUB    $11,$10,$10,$12
        EQUB    $13,$0E,$0E,$14

; $16	Brick
        EQUB    $15,$15,$15,$15
        EQUB    $15,$15,$15,$15
        EQUB    $15,$15,$15,$15
        EQUB    $15,$15,$15,$15

; $17	Safe
        EQUB    $37,$38,$38,$39
        EQUB    $3A,$3B,$3B,$3C
        EQUB    $3A,$3B,$3B,$3C
        EQUB    $3D,$3E,$3E,$3F

; $18	Earth 1 
        EQUB    $22,$23,$24,$25
        EQUB    $26,$27,$23,$26
        EQUB    $22,$24,$23,$27
        EQUB    $25,$22,$24,$26

; $19	Earth 2
        EQUB    $27,$22,$24,$27
        EQUB    $23,$25,$23,$22
        EQUB    $27,$24,$22,$27
        EQUB    $22,$23,$26,$25

; $1A	Green Mesh Earth
        EQUB    $68,$68,$68,$68
        EQUB    $68,$68,$68,$68
        EQUB    $68,$68,$68,$68
        EQUB    $68,$68,$68,$68

; $1B	Key
        EQUB    $08,$09,$0A,$0B
        EQUB    $30,$31,$32,$33
        EQUB    $58,$59,$5A,$5B
        EQUB    $80,$81,$82,$83

; $1C	Egg
        EQUB    $04,$05,$06,$07
        EQUB    $2C,$2D,$2E,$2F
        EQUB    $54,$55,$56,$57
        EQUB    $7C,$7D,$7E,$7F

; $1D	Rock
        EQUB    $00,$01,$02,$03
        EQUB    $28,$29,$2A,$2B
        EQUB    $50,$51,$52,$53
        EQUB    $78,$79,$7A,$7B

; $1E	Diamond
        EQUB    $73,$1C,$1D,$73
        EQUB    $1C,$20,$21,$1D
        EQUB    $1E,$21,$20,$1F
        EQUB    $73,$1E,$1F,$73

; $1F	Empty
        EQUB    $73,$73,$73,$73
        EQUB    $73,$73,$73,$73
        EQUB    $73,$73,$73,$73
        EQUB    $73,$73,$73,$73