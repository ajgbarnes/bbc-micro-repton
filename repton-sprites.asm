;2FC0 
; Start of sprites
; 
; The start address of a tile can be calculated using:
;
;    address = (tile number * 8) + $2FC0
;
.data_tiles
; $00   Rock (0,0) top left rounded corner with yellow edge
        EQUB    $00,$00,$10,$21,$21,$53,$43,$41
; $01   Rock (0,1) top middle left curving with yellow edge
        EQUB    $30,$C1,$0E,$2B,$0E,$7F,$0A,$06
; $02   Rock (0,2) top middle right curving with yellow edge
        EQUB    $C0,$34,$3B,$17,$08,$02,$2A,$0D
; $03   Rock (0,3) top right rounded corner with yellow edge        
        EQUB    $00,$00,$80,$40,$48,$28,$20,$6C
; ---------------------------
; $04   Egg  (0,0) top left 
        EQUB    $00,$00,$00,$00,$10,$10,$10,$30
; $05   Egg  (0,1) top middle left curving         
        EQUB    $10,$70,$F0,$F0,$F0,$F0,$F0,$F0
; $06   Egg  (0,2) top middle right curving         
        EQUB    $80,$E0,$F0,$F0,$F0,$F0,$F0,$F0
; $07   Egg  (0,3) top right        
        EQUB    $00,$00,$00,$00,$80,$80,$80,$C0
; ---------------------------
; $08   Key  (0,0) top left         
        EQUB    $00,$00,$10,$10,$30,$21,$61,$41
; $09   Key  (0,1) top middle left curving         
        EQUB    $30,$F0,$C1,$05,$05,$05,$07,$0B
; $0A   Key  (0,2) top middle right curving        
        EQUB    $C0,$F0,$38,$0A,$0A,$0A,$0A,$0F
; $0B   Key  (0,3) top right       
; ---------------------------
        EQUB    $00,$00,$80,$80,$C0,$48,$68,$28
; $0C   Solid rectangle no coloured edges        
        EQUB    $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F
; $0D   Solid rectangle with yellow left edge      
        EQUB    $87,$87,$87,$87,$87,$87,$87,$87
; $0E   Solid rectangle with yellow bottom edge
        EQUB    $0F,$0F,$0F,$0F,$0F,$0F,$0F,$F0
; $0F   Solid rectangle with yellow right edge        
        EQUB    $1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E
; $10   Solid rectangle with yellow top edge        
        EQUB    $F0,$0F,$0F,$0F,$0F,$0F,$0F,$0F
; $11   Solid curving top left side with yellow left edge        
        EQUB    $00,$30,$43,$43,$87,$87,$87,$87
; $12   Solid curving top right side with yellow right edge        
        EQUB    $00,$C0,$2C,$2C,$1E,$1E,$1E,$1E
; $13   Solid curving bottom left side with yellow left edge        
        EQUB    $87,$87,$87,$87,$43,$43,$30,$00
; $14   Solid curving bottom right side with yellow right edge        
        EQUB    $1E,$1E,$1E,$1E,$2C,$2C,$C0,$00
; ---------------------------        
; $15   Small brick pattern no yellow edges        
        EQUB    $00,$0D,$0D,$0D,$00,$07,$07,$07
; $16   Small brick pattern with left yellow edge        
        EQUB    $80,$85,$85,$85,$80,$87,$87,$87
; $17   Small brick pattern with right yellow edge        
        EQUB    $10,$1C,$1C,$1C,$10,$16,$16,$16
; $18   Small circle bottom left brick pattern with left yellow edge        
        EQUB    $80,$85,$85,$C1,$40,$61,$30,$00
; $19   Small circle bottom right brick pattern with right yellow edge        
        EQUB    $10,$1C,$1C,$3C,$20,$68,$C0,$00
; $1A   Small circle top left brick pattern with left yellow edge and line on bottom        
        EQUB    $30,$61,$41,$C1,$80,$87,$87,$87
; $1B   Small circle top right brick pattern with right yellow edge and line on bottom        
        EQUB    $C0,$68,$2C,$3C,$10,$16,$16,$16
; ---------------------------
; $1C   Left hand top sloping side of diamond        
        EQUB    $10,$10,$20,$20,$50,$40,$B0,$D0
; $1D   Right hand top sloping side of diamond        
        EQUB    $80,$80,$40,$C0,$20,$E0,$B0,$50
; $1E   Left hand bottom sloping side of diamond        
        EQUB    $D0,$A0,$60,$50,$20,$20,$10,$10
; $1F   Right hand bottom sloping side of diamond        
        EQUB    $B0,$50,$E0,$20,$C0,$40,$80,$80
; $20   Middle of diamond 1        
        EQUB    $50,$E0,$B0,$40,$B0,$50,$20,$D0
; $21   Middle of diamond 2        
        EQUB    $80,$30,$A0,$F0,$20,$90,$60,$A0
; ---------------------------        
; $22   Earth segment 1
        EQUB    $02,$0A,$05,$0D,$02,$09,$0A,$01
; $23   Earth segment 2        
        EQUB    $04,$0D,$02,$06,$01,$0E,$0A,$0A
; $24   Earth segment 3        
        EQUB    $05,$0D,$02,$09,$06,$0B,$04,$02
; $25   Earth segment 4        
        EQUB    $02,$0A,$05,$0A,$02,$05,$09,$05
; $26   Earth segment 5        
        EQUB    $0B,$0C,$02,$03,$0D,$0A,$01,$06
; $27   Earth segment 6        
        EQUB    $04,$0B,$09,$04,$03,$0D,$02,$0E
; ---------------------------                
; $28   Rock (1,0) upper middle row with left yellow edge        
        EQUB    $41,$A6,$87,$E7,$97,$E6,$D7,$E7
; $29   Rock (1,1) upper middle row middle left        
        EQUB    $2A,$4F,$3F,$0B,$2F,$1B,$0F,$EF
; $2A   Rock (1,2) upper middle row middle right        
        EQUB    $6E,$33,$4D,$0A,$CC,$2F,$8A,$6F
; $2B   Rock (1,3) upper middle row with right yellow edge        
        EQUB    $20,$DC,$76,$18,$54,$54,$5C,$10
; ---------------------------           
; $2C   Egg  (1,0) upper middle row left edge
        EQUB    $30,$30,$70,$70,$70,$70,$70,$F0
; $2D   Egg  (1,1) upper middle row middle left        
        EQUB    $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0
; $2E   Egg  (1,2) upper middle row middle right        
        EQUB    $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0
; $2F   Egg  (1,3) upper middle row right edge        
        EQUB    $C0,$C0,$E0,$E0,$E0,$E0,$F0,$F0
; ---------------------------                   
; $30   Key  (1,0) upper middle row with left edge        
        EQUB    $41,$40,$C0,$87,$83,$80,$81,$97
; $31   Key  (1,1) upper middle row middle left        
        EQUB    $0B,$1F,$1F,$17,$1F,$1E,$3C,$EC
; $32   Key  (1,2) upper middle row middle right        
        EQUB    $0D,$8F,$8F,$8E,$8F,$86,$C3,$73
; $33   Key  (1,3) upper middle row with right edge        
        EQUB    $28,$20,$34,$1C,$18,$16,$1C,$9E
; ---------------------------
; $34   Yellow brick on solid red left hand edge        
        EQUB    $0F,$0F,$78,$78,$78,$78,$0F,$0F
; $35   Yellow brick on solid red middle        
        EQUB    $0F,$0F,$F0,$F0,$F0,$F0,$0F,$0F
; $36   Yellow brick on solid red right hand edge        
        EQUB    $0F,$0F,$E1,$E1,$E1,$E1,$0F,$0F
; ---------------------------
; $37   Safe top left        
        EQUB    $70,$F0,$F7,$F7,$E6,$C4,$D5,$D5
; $38   Safe top middle        
        EQUB    $F0,$F0,$FF,$FF,$00,$00,$FF,$FF
; $39   Safe top right corner        
        EQUB    $E0,$F0,$FE,$FE,$76,$32,$BA,$BA
; $3A   Safe middle left        
        EQUB    $D5,$D5,$D5,$D5,$D5,$D5,$D5,$D5
; $3B   Safe middle middle        
        EQUB    $5F,$AF,$5F,$AF,$5F,$AF,$5F,$AF
; $3C   Safe middle right        
        EQUB    $BA,$BA,$BA,$BA,$BA,$BA,$BA,$BA
; $3D   Safe bottom left        
        EQUB    $D5,$D5,$C4,$E6,$F7,$F7,$F0,$70
; $3E   Safe bottom middle        
        EQUB    $FF,$FF,$00,$00,$FF,$FF,$F0,$F0
; $3F   Safe bottom right        
        EQUB    $BA,$BA,$32,$76,$FE,$FE,$F0,$E0
; ---------------------------
; $40   Brick interior 1 
        EQUB    $00,$0F,$0F,$0F,$00,$07,$07,$07
; $41   Brick interior 2         
        EQUB    $00,$07,$07,$07,$00,$0F,$0F,$0F
; $42   Brick with yellow top edge 1        
        EQUB    $F0,$0F,$0F,$0F,$00,$07,$07,$07
; $43   Brick with yellow top edge 2        
        EQUB    $F0,$07,$07,$07,$00,$0F,$0F,$0F
; $44   Brick with yellow left edge        
        EQUB    $80,$87,$87,$87,$80,$87,$87,$87
; $45   Brick with yellow right edge        
        EQUB    $10,$16,$16,$16,$10,$1E,$1E,$1E
; $46   Brick with yellow bottom edge 1        
        EQUB    $00,$0F,$0F,$0F,$00,$07,$07,$F0
; $47   Brick with yellow bottom edge 2        
        EQUB    $00,$07,$07,$07,$00,$0F,$0F,$F0
; $48   Brick with rounded top left corner with yellow edge        
        EQUB    $00,$10,$21,$43,$40,$87,$87,$87
; $49   Brick with slightly rounded left and flat top with yellow edge        
        EQUB    $70,$87,$07,$07,$00,$0F,$0F,$0F
; $4A   Brick with slightly rounded right and flat top with yellow edge        
        EQUB    $E0,$1E,$0F,$0F,$00,$07,$07,$07
; $4B   Brick with rounded top right corner with yellow edge        
        EQUB    $00,$80,$40,$24,$20,$1E,$1E,$1E
; $4C   Brick with rounded bottom left corner with yellow edge        
        EQUB    $80,$87,$87,$43,$40,$21,$10,$00
; $4D   Brick with slightly rounded left and flat bottom with yellow edge        
        EQUB    $00,$07,$07,$07,$00,$0F,$87,$70
; $4E   Brick with slightly rounded right and flat bottom with yellow edge        
        EQUB    $00,$0F,$0F,$0F,$00,$07,$16,$E0
; $4F   Brick with rounded bottom right corner with yellow edge        
        EQUB    $10,$16,$16,$24,$20,$48,$80,$00
; ---------------------------
; $50   Rock (2,0) lower middle row with left yellow edge        
        EQUB    $97,$C5,$85,$96,$87,$87,$85,$43
; $51   Rock (2,1) lower middle row middle left        
        EQUB    $02,$CD,$8B,$1D,$A3,$1F,$86,$8F
; $52   Rock (2,2) lower middle row middle right        
        EQUB    $06,$2F,$8E,$9F,$05,$1B,$2F,$9F
; $53   Rock (2,3) lower middle row with right yellow edge        
        EQUB    $3A,$5E,$14,$18,$16,$1E,$1E,$24
; ---------------------------
; $54   Egg  (2,0) lower middle row left edge     
        EQUB    $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0
; $55   Egg  (2,1) lower middle row middle left        
        EQUB    $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0
; $56   Egg  (2,2) lower middle row middle right        
        EQUB    $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0
; $57   Egg  (2,3) lower middle row right edge        
        EQUB    $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0
; ---------------------------
; $58   Key  (2,0) lower middle row with left edge        
        EQUB    $97,$83,$86,$81,$83,$C2,$40,$41
; $59   Key  (2,1) lower middle row middle left        
        EQUB    $EC,$3C,$16,$1F,$17,$1F,$1F,$0B
; $5A   Key  (2,2) lower middle row middle right        
        EQUB    $73,$C3,$87,$8F,$8E,$8F,$8F,$0D
; $5B   Key  (2,3) lower middle row with right edge        
        EQUB    $9E,$18,$10,$1C,$1E,$30,$20,$28
; ---------------------------  
; $5C   Character - 0      
        EQUB    $44,$AA,$AA,$AA,$AA,$AA,$44,$00
; $5D   Character - 1        
        EQUB    $44,$CC,$44,$44,$44,$44,$EE,$00
; $5E   Character - 2        
        EQUB    $EE,$22,$22,$EE,$88,$88,$EE,$00
; $5F   Character - 3        
        EQUB    $EE,$22,$22,$66,$22,$22,$EE,$00
; $60   Character - 4        
        EQUB    $AA,$AA,$AA,$EE,$22,$22,$22,$00
; $61   Character - 5        
        EQUB    $EE,$88,$88,$EE,$22,$22,$EE,$00
; $62   Character - (        
        EQUB    $22,$44,$44,$44,$44,$44,$22,$00
; $63   Character - )        
        EQUB    $44,$22,$22,$22,$22,$22,$44,$00
; ---------------------------  
; $64   Character - top left hand side rounded brick        
        EQUB    $30,$41,$41,$85,$80,$87,$87,$87
; $65   Character - top right hand side rounded brick        
        EQUB    $C0,$2C,$2C,$1C,$10,$16,$16,$16
; $66   Character - bottom left hand side rounded brick        
        EQUB    $80,$85,$85,$85,$80,$43,$43,$30
; $67   Character - bottom right hand side rounded brick        
        EQUB    $10,$1C,$1C,$1C,$10,$24,$24,$C0
; $68   Character - earth 1        
        EQUB    $55,$AA,$55,$AA,$55,$AA,$55,$AA
; $69   Character - earth 2        
        EQUB    $AA,$55,$AA,$55,$AA,$55,$AA,$55
; $6A   Character - left hand brick edge        
        EQUB    $80,$85,$85,$85,$80,$87,$87,$87
; $6B   Character - right hand brick edge        
        EQUB    $10,$1C,$1C,$1C,$10,$16,$16,$16
; $6C   Character - -        
        EQUB    $00,$00,$00,$EE,$00,$00,$00,$00
; $6D   Character - top brick edge        
        EQUB    $F0,$0D,$0D,$0D,$00,$07,$07,$07
; $6E   Character - bottom brick edge        
        EQUB    $00,$0D,$0D,$0D,$00,$07,$07,$F0
; $6F   Character - interior brick        
        EQUB    $00,$0D,$0D,$0D,$00,$07,$07,$07
; $70   Character - yellow red brick        
        EQUB    $F0,$87,$87,$87,$F0,$1E,$1E,$1E
; $71   Character - /        
        EQUB    $00,$22,$22,$44,$44,$88,$88,$00
; $72   Character - four blocks        
        EQUB    $0A,$A0,$0A,$00,$0A,$A0,$0A,$00
; $73   Black tile        
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
; $74   Character - ?        
        EQUB    $EE,$AA,$22,$22,$44,$00,$44,$44
; $75   Character - two vertical oval blocks        
        EQUB    $0A,$0A,$A0,$0A,$A0,$0A,$0A,$00
; $76   Character - two horizontal oval blocks        
        EQUB    $0E,$E0,$0E,$00,$0E,$E0,$0E,$00
; $77   Character - inverted brick        
        EQUB    $0F,$05,$0F,$0A,$0F,$05,$0F,$0A
; ---------------------------          
; $78   Rock (3,0) bottom left rounded corner with yellow edge
        EQUB    $52,$43,$43,$21,$21,$10,$00,$00
; $79   Rock (3,1) bottom middle left curving with yellow edge        
        EQUB    $4B,$4B,$A5,$0B,$0F,$0D,$C3,$30
; $7A   Rock (3,2) bottom middle right curving with yellow edge        
        EQUB    $5F,$8F,$0B,$45,$0F,$07,$3C,$C0
; $7B   Rock (3,3) bottom right rounded corner with yellow edge        
        EQUB    $2C,$24,$2C,$48,$48,$80,$00,$00
; ---------------------------  
; $7C   Egg  (3,0) bottom left         
        EQUB    $70,$70,$70,$70,$30,$30,$10,$00
; $7D   Egg  (3,1) bottom middle left curving        
        EQUB    $F0,$F0,$F0,$F0,$F0,$F0,$F0,$70
; $7E   Egg  (3,2) bottom middle right curving         
        EQUB    $F0,$F0,$F0,$F0,$F0,$F0,$F0,$E0
; $7F   Egg  (3,3) bottom right        
        EQUB    $E0,$E0,$E0,$E0,$C0,$C0,$80,$00
; ---------------------------          
; $80   Key  (3,0) bottom left 
        EQUB    $41,$61,$21,$30,$10,$10,$00,$00
; $81   Key  (3,1) bottom middle left curving         
        EQUB    $0F,$05,$05,$05,$05,$C1,$F0,$30
; $82   Key  (3,2) bottom middle right curving         
        EQUB    $0D,$0E,$0A,$0A,$0A,$38,$F0,$C0
; $83   Key  (3,3) bottom right
        EQUB    $28,$68,$48,$C0,$80,$80,$00,$00
; ---------------------------
; $84   Character - 6        
        EQUB    $EE,$88,$88,$EE,$AA,$AA,$EE,$00
; $85   Character - 7        
        EQUB    $EE,$22,$22,$22,$22,$22,$22,$00
; $86   Character - 8        
        EQUB    $EE,$AA,$AA,$EE,$AA,$AA,$EE,$00
; $87   Character - 9        
        EQUB    $EE,$AA,$AA,$EE,$22,$22,$22,$00
; $88   Character - A        
        EQUB    $44,$AA,$AA,$EE,$AA,$AA,$AA,$00
; $89   Character - B        
        EQUB    $CC,$AA,$AA,$CC,$AA,$AA,$CC,$00
; $8A   Character - C        
        EQUB    $44,$AA,$88,$88,$88,$AA,$44,$00
; $8B   Character - D        
        EQUB    $CC,$AA,$AA,$AA,$AA,$AA,$CC,$00
; $8C   Character - E        
        EQUB    $EE,$88,$88,$CC,$88,$88,$EE,$00
; $8D   Character - F        
        EQUB    $EE,$88,$88,$CC,$88,$88,$88,$00
; $8E   Character - G        
        EQUB    $44,$AA,$88,$88,$AA,$AA,$66,$00
; $8F   Character - H        
        EQUB    $AA,$AA,$AA,$EE,$AA,$AA,$AA,$00
; $90   Character - I        
        EQUB    $EE,$44,$44,$44,$44,$44,$EE,$00
; $91   Character - J        
        EQUB    $EE,$44,$44,$44,$44,$44,$88,$00
; $92   Character - K        
        EQUB    $88,$AA,$AA,$CC,$AA,$AA,$AA,$00
; $93   Character - L        
        EQUB    $88,$88,$88,$88,$88,$88,$EE,$00
; $94   Character - M        
        EQUB    $AA,$EE,$EE,$AA,$AA,$AA,$AA,$00
; $95   Character - N        
        EQUB    $CC,$AA,$AA,$AA,$AA,$AA,$AA,$00
; $96   Character - O        
        EQUB    $EE,$AA,$AA,$AA,$AA,$AA,$EE,$00
; $97   Character - P        
        EQUB    $EE,$AA,$AA,$EE,$88,$88,$88,$00
; $98   Character - Q        
        EQUB    $EE,$AA,$AA,$AA,$AA,$CC,$AA,$00
; $99   Character - R        
        EQUB    $CC,$AA,$AA,$CC,$AA,$AA,$AA,$00
; $9A   Character - S        
        EQUB    $44,$AA,$88,$44,$22,$AA,$44,$00
; $9B   Character - T        
        EQUB    $EE,$44,$44,$44,$44,$44,$44,$00
; $9C   Character - U        
        EQUB    $AA,$AA,$AA,$AA,$AA,$AA,$CC,$00
; $9D   Character - V        
        EQUB    $AA,$AA,$AA,$AA,$AA,$44,$44,$00
; $9E   Character - W        
        EQUB    $AA,$AA,$AA,$AA,$AA,$EE,$AA,$00
; $9F   Character - X        
        EQUB    $AA,$AA,$44,$44,$44,$AA,$AA,$00
; $A0   Character - Y        
        EQUB    $AA,$AA,$AA,$EE,$44,$44,$44,$00
; $A1   Character - Z        
        EQUB    $EE,$22,$22,$44,$88,$88,$EE,$00
; $A2   Character - a        
        EQUB    $00,$00,$CC,$22,$EE,$AA,$EE,$00
; $A3   Character - b        
        EQUB    $88,$88,$CC,$AA,$AA,$AA,$CC,$00
; $A4   Character - c        
        EQUB    $00,$00,$66,$88,$88,$88,$66,$00
; $A5   Character - d        
        EQUB    $22,$22,$66,$AA,$AA,$AA,$66,$00
; $A6   Character - e        
        EQUB    $00,$00,$44,$AA,$EE,$88,$66,$00
; $A7   Character - f        
        EQUB    $22,$44,$44,$EE,$44,$44,$44,$00
; $A8   Character - g        
        EQUB    $00,$00,$66,$AA,$AA,$66,$22,$CC
; $A9   Character - h        
        EQUB    $88,$88,$CC,$AA,$AA,$AA,$AA,$00
; $AA   Character - i        
        EQUB    $00,$44,$00,$CC,$44,$44,$EE,$00
; $AB   Character - j        
        EQUB    $00,$44,$00,$44,$44,$44,$44,$88
; $AC   Character - k        
        EQUB    $88,$88,$AA,$AA,$CC,$AA,$AA,$00
; $AD   Character - l        
        EQUB    $44,$44,$44,$44,$44,$44,$66,$00
; $AE   Character - m        
        EQUB    $00,$00,$AA,$EE,$EE,$AA,$AA,$00
; $AF   Character - n        
        EQUB    $00,$00,$CC,$AA,$AA,$AA,$AA,$00
; $B0   Character - o        
        EQUB    $00,$00,$44,$AA,$AA,$AA,$44,$00
; $B1   Character - p        
        EQUB    $00,$00,$CC,$AA,$AA,$CC,$88,$88
; $B2   Character - q        
        EQUB    $00,$00,$66,$AA,$AA,$66,$22,$22
; $B3   Character - r        
        EQUB    $00,$00,$66,$88,$88,$88,$88,$00
; $B4   Character - s        
        EQUB    $00,$00,$66,$88,$44,$22,$CC,$00
; $B5   Character - t        
        EQUB    $00,$88,$88,$CC,$88,$88,$66,$00
; $B6   Character - u        
        EQUB    $00,$00,$AA,$AA,$AA,$AA,$CC,$00
; $B7   Character - v        
        EQUB    $00,$00,$AA,$AA,$AA,$44,$44,$00
; $B8   Character - w        
        EQUB    $00,$00,$AA,$AA,$EE,$EE,$AA,$00
; $B9   Character - x        
        EQUB    $00,$00,$AA,$AA,$44,$AA,$AA,$00
; $BA   Character - y        
        EQUB    $00,$00,$AA,$AA,$AA,$66,$22,$EE
; $BB   Character - z        
        EQUB    $00,$00,$EE,$22,$44,$88,$EE,$00
; $BC   Character - !        
        EQUB    $44,$44,$44,$44,$44,$00,$44,$00
; ---------------------------          
; $BD   Character - Safe        
        EQUB    $60,$F6,$F6,$F6,$F6,$F6,$F6,$60
; $BE   Character - Key        
        EQUB    $06,$0F,$0F,$69,$69,$0F,$0F,$06
; $BF   Character - Egg        
        EQUB    $60,$60,$60,$F0,$F0,$F0,$F0,$60
; $C0   Character - Rock        
        EQUB    $06,$4F,$0D,$2F,$5F,$87,$4B,$06
; ---------------------------        
; $C1   Character - :  
        EQUB    $00,$00,$44,$44,$00,$44,$44,$00
; $C2   Character - .        
        EQUB    $00,$00,$00,$00,$00,$44,$44,$00
; ---------------------------
; $C3   Character - Diamond
        EQUB    $10,$30,$50,$B0,$D0,$A0,$C0,$80
; ---------------------------       
; $C4   Character - [ 
        EQUB    $EE,$88,$88,$88,$88,$88,$EE,$00
; $C5   Character - ]
        EQUB    $EE,$22,$22,$22,$22,$22,$EE,$00
; $C6   Character - =        
        EQUB    $00,$00,$EE,$00,$EE,$00,$00,$00
; $C7   Character = *        
        EQUB    $00,$AA,$44,$EE,$44,$AA,$00,$00

; $3600 - Main character sprites
; $3600 - Repton Left hand up - head
.sprite_repton_left_hand_up
        EQUB    $00,$08,$0C,$0C,$60,$60,$30,$30
        EQUB    $77,$DD,$A8,$A8,$DD,$76,$33,$D0
        EQUB    $EE,$BB,$51,$51,$BB,$E6,$CC,$80
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00

; $3620 - Repton Right hand up - head
.sprite_repton_right_hand_up
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $77,$DD,$A8,$A8,$DD,$76,$33,$10
        EQUB    $EE,$BB,$51,$51,$BB,$E6,$CC,$B0
        EQUB    $00,$01,$03,$03,$60,$60,$C0,$C0
; $3640 - Repton Moving right, right hand forward - head
.sprite_repton_moving_r_r_hand_fwd
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $00,$11,$33,$33,$33,$11,$00,$00
        EQUB    $FF,$CC,$DC,$DC,$EE,$FF,$FF,$E0
        EQUB    $88,$CC,$44,$44,$44,$CC,$88,$00

; $3660 - Repton Moving right, right hand slightly forward - head
.sprite_repton_moving_r_r_hand_s_fwd
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $00,$11,$33,$33,$33,$11,$00,$00
        EQUB    $FF,$CC,$DC,$DC,$EE,$FF,$FF,$F0
        EQUB    $88,$CC,$44,$44,$44,$CC,$88,$00

; $3680 - Repton Moving right, right hand slightly back - head
.sprite_repton_moving_r_r_hand_s_back
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $00,$00,$11,$33,$33,$33,$11,$00
        EQUB    $00,$FF,$CC,$DC,$DC,$EE,$FF,$FF
        EQUB    $00,$88,$CC,$44,$44,$44,$CC,$88

; $36A0 - Repton Moving right, right hand back - head 
.sprite_repton_moving_r_r_hand_back
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $00,$11,$33,$33,$33,$11,$00,$00
        EQUB    $FF,$CC,$DC,$DC,$EE,$FF,$FF,$E0
        EQUB    $88,$CC,$44,$44,$44,$CC,$88,$00

; $36C0 - Repton Moving left,  left hand back - head 
.sprite_repton_moving_l_l_hand_back
        EQUB    $11,$33,$22,$22,$22,$33,$11,$00
        EQUB    $FF,$33,$B3,$B3,$77,$FF,$FF,$70
        EQUB    $00,$88,$CC,$CC,$CC,$88,$00,$00
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00

; $36E0 - Repton Moving left,  left hand slightly back - head  
.sprite_repton_moving_l_l_hand_s_back
        EQUB    $00,$11,$33,$22,$22,$22,$33,$11
        EQUB    $00,$FF,$33,$B3,$B3,$77,$FF,$FF
        EQUB    $00,$00,$88,$CC,$CC,$CC,$88,$00
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00

; $3700 - Repton Moving left,  left hand slightly forward - head   
.sprite_repton_moving_l_l_hand_s_forward
        EQUB    $11,$33,$22,$22,$22,$33,$11,$00
        EQUB    $FF,$33,$B3,$B3,$77,$FF,$FF,$F0
        EQUB    $00,$88,$CC,$CC,$CC,$88,$00,$00
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00

; $3720 - Repton Moving left,  left hand forward - head
.sprite_repton_moving_l_l_hand_forward
        EQUB    $11,$33,$22,$22,$22,$33,$11,$00
        EQUB    $FF,$33,$B3,$B3,$77,$FF,$FF,$70
        EQUB    $00,$88,$CC,$CC,$CC,$88,$00,$00
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00

; $3740 - Repton Left hand up - torso
        EQUB    $10,$00,$00,$00,$00,$00,$00,$00
        EQUB    $F0,$F0,$F0,$70,$70,$30,$30,$30
        EQUB    $E0,$F0,$F0,$F0,$E0,$E0,$C0,$C0
        EQUB    $00,$80,$80,$C0,$E0,$60,$61,$03

; $3760 - Repton Right hand up - torso
        EQUB    $00,$10,$10,$30,$70,$60,$68,$0C
        EQUB    $70,$F0,$F0,$F0,$70,$70,$30,$30
        EQUB    $F0,$F0,$F0,$E0,$E0,$C0,$C0,$C0
        EQUB    $80,$00,$00,$00,$00,$00,$00,$00

; $3780 - Repton Moving right, right hand forward - torso
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $10,$10,$30,$30,$30,$30,$34,$34
        EQUB    $D0,$D0,$60,$60,$B0,$B0,$D0,$E0
        EQUB    $00,$00,$03,$C3,$C3,$C0,$00,$00

; $37A0 - Repton Moving right, right hand slightly forward - torso
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $10,$10,$10,$30,$30,$30,$30,$30
        EQUB    $D0,$D0,$50,$60,$60,$60,$B0,$B0
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00


; $37C0 - Repton Moving right, right hand slightly back - torso
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $00,$10,$10,$20,$20,$20,$10,$10
        EQUB    $F0,$70,$70,$D0,$D0,$D0,$B0,$B0
        EQUB    $00,$80,$80,$80,$80,$00,$00,$00

; $37E0 - Repton Moving right, right hand back - torso
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $10,$10,$30,$30,$60,$60,$1C,$1C
        EQUB    $F0,$D0,$B0,$70,$E0,$E0,$E0,$E0
        EQUB    $00,$00,$03,$43,$C3,$C0,$00,$00

; $3800 -  Repton Moving left,  left hand back - torso
        EQUB    $00,$00,$0C,$2C,$3C,$30,$00,$00
        EQUB    $F0,$B0,$D0,$E0,$70,$70,$70,$70
        EQUB    $80,$80,$C0,$C0,$60,$60,$83,$83
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00

; $3820 - Repton Moving left,  left hand slightly back - torso        
        EQUB    $00,$10,$10,$10,$10,$00,$00,$00
        EQUB    $F0,$E0,$E0,$B0,$B0,$B0,$D0,$D0
        EQUB    $00,$80,$80,$40,$40,$40,$80,$80
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00

; $3840 - Repton Moving left,  left hand slightly forward - torso        
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $B0,$B0,$A0,$60,$60,$60,$D0,$D0
        EQUB    $80,$80,$80,$C0,$C0,$C0,$C0,$C0
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00

; $3860 - Repton Moving left,  left hand forward - torso
        EQUB    $00,$00,$0C,$3C,$3C,$30,$00,$00
        EQUB    $B0,$B0,$60,$60,$D0,$D0,$B0,$70
        EQUB    $80,$80,$C0,$C0,$C0,$C0,$C2,$C2
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00

; $3880 - Repton Left hand up - legs        
        EQUB    $00,$01,$01,$01,$01,$03,$07,$0F
        EQUB    $0F,$0F,$0F,$0F,$09,$08,$08,$00
        EQUB    $C0,$0C,$0C,$0E,$0E,$07,$07,$03
        EQUB    $03,$00,$00,$00,$00,$00,$00,$00

; $38A0 - Repton Right hand up - legs        
        EQUB    $0C,$00,$00,$00,$00,$00,$00,$00
        EQUB    $30,$03,$03,$07,$07,$0E,$0E,$0C
        EQUB    $0F,$0F,$0F,$0F,$09,$01,$01,$00
        EQUB    $00,$08,$08,$08,$08,$0C,$0E,$0F

; $38C0 - Repton Moving right, right hand forward - legs
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $34,$03,$03,$03,$07,$07,$07,$0E
        EQUB    $E0,$0C,$0C,$0A,$0A,$07,$07,$03
        EQUB    $00,$00,$00,$00,$00,$00,$00,$08

; $38E0 - Repton Moving right, right hand slightly forward - legs
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $30,$03,$03,$03,$01,$01,$03,$03
        EQUB    $B0,$0B,$0B,$0E,$0E,$0E,$0D,$0D
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00

; $3900   - Repton Moving right, right hand slightly back - legs
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $10,$01,$01,$02,$03,$01,$01,$05
        EQUB    $B0,$0B,$0B,$07,$0F,$0F,$0E,$0E
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00

; $3920 - Repton Moving right, right hand back - legs
        EQUB    $00,$00,$00,$00,$02,$07,$07,$07
        EQUB    $30,$03,$03,$01,$06,$07,$0F,$0E
        EQUB    $E0,$0E,$0F,$0F,$0F,$07,$03,$03
        EQUB    $00,$00,$00,$00,$08,$08,$0C,$0C

; 3940 - Repton Moving left,  left hand back - legs
        EQUB    $00,$00,$00,$00,$01,$01,$03,$03
        EQUB    $70,$07,$0F,$0F,$0F,$0E,$0C,$0C
        EQUB    $C0,$0C,$0C,$08,$06,$0E,$0F,$07
        EQUB    $00,$00,$00,$00,$04,$0E,$0E,$0E

; 3960 - Repton Moving left,  left hand slightly back - legs
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $D0,$0D,$0D,$0E,$0F,$0F,$07,$07
        EQUB    $80,$08,$08,$04,$0C,$08,$08,$0A
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00

; 3980 - Repton Moving left,  left hand slightly forward - legs
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $D0,$0D,$0D,$07,$07,$07,$0B,$0B
        EQUB    $C0,$0C,$0C,$0C,$08,$08,$0C,$0C
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00

; $39A0 - Repton Moving left,  left hand forward - legs
        EQUB    $00,$00,$00,$00,$00,$00,$00,$01
        EQUB    $70,$03,$03,$05,$05,$0E,$0E,$0C
        EQUB    $C2,$0C,$0C,$0C,$0E,$0E,$0E,$07
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00

; $39C0 - Repton Left hand up - feet
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $03,$01,$01,$01,$01,$01,$01,$00
        EQUB    $08,$08,$08,$08,$08,$0C,$0E,$0F

; $39E0 - Repton Right hand up - feet
        EQUB    $01,$01,$01,$01,$01,$03,$07,$0F
        EQUB    $0C,$08,$08,$08,$08,$08,$08,$00
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00

; $3A00 - Repton Moving right, right hand forward - feet
        EQUB    $03,$07,$07,$07,$03,$03,$01,$00
        EQUB    $0E,$0C,$00,$00,$00,$08,$08,$00
        EQUB    $03,$01,$01,$01,$01,$01,$01,$01
        EQUB    $08,$08,$08,$08,$08,$0E,$0F,$0F


; $3A20 - Repton Moving right, right hand slightly forward - feet  
        EQUB    $00,$00,$01,$01,$00,$00,$00,$00
        EQUB    $07,$0F,$0E,$0C,$0E,$0F,$07,$00
        EQUB    $0A,$06,$0E,$0C,$0C,$07,$07,$0F
        EQUB    $00,$00,$00,$00,$00,$00,$08,$08

; $3A40 - Repton Moving right, right hand slightly back - feet
        EQUB    $00,$00,$01,$01,$01,$00,$00,$00
        EQUB    $06,$0E,$0C,$0C,$0E,$0F,$07,$00
        EQUB    $0E,$0C,$0C,$0C,$0C,$0F,$0F,$0F
        EQUB    $00,$00,$00,$00,$00,$00,$08,$08

; $3A60 - Repton Moving right, right hand back - feet
        EQUB    $0F,$0C,$0C,$08,$00,$00,$00,$00
        EQUB    $0E,$0C,$00,$00,$00,$00,$00,$00
        EQUB    $01,$01,$01,$01,$03,$03,$03,$00
        EQUB    $0C,$08,$08,$08,$08,$0E,$0F,$0F

; $3A80 - Repton Moving left,  left hand back - feet  
        EQUB    $03,$01,$01,$01,$01,$07,$0F,$0F
        EQUB    $08,$08,$08,$08,$0C,$0C,$0C,$00
        EQUB    $07,$03,$00,$00,$00,$00,$00,$00
        EQUB    $0F,$03,$03,$01,$00,$00,$00,$00

; $3AA0 - Repton Moving left,  left hand slightly back - feet        
        EQUB    $00,$00,$00,$00,$00,$00,$01,$01
        EQUB    $07,$03,$03,$03,$03,$0F,$0F,$0F
        EQUB    $06,$07,$03,$03,$07,$0F,$0E,$00
        EQUB    $00,$00,$08,$08,$08,$00,$00,$00

; $3AC0 - Repton Moving left,  left hand slightly forward - feet
        EQUB    $00,$00,$00,$00,$00,$00,$01,$01
        EQUB    $05,$06,$07,$03,$03,$0E,$0E,$0F
        EQUB    $0E,$0F,$07,$03,$07,$0F,$0E,$00
        EQUB    $00,$00,$08,$08,$00,$00,$00,$00

; $3AE0 - Repton Moving left,  left hand forward - feet
        EQUB    $01,$01,$01,$01,$01,$07,$0F,$0F
        EQUB    $0C,$08,$08,$08,$08,$08,$08,$08
        EQUB    $07,$03,$00,$00,$00,$01,$01,$00
        EQUB    $0C,$0E,$0E,$0E,$0C,$0C,$08,$00

; $3B00 - Repton Standing - head
.sprite_repton_standing
        EQUB    $77,$DD,$A8,$A8,$DD,$76,$33,$10
        EQUB    $EE,$BB,$51,$51,$BB,$E6,$CC,$80
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00

; $3B20 - Repton Standing looking right - head
.sprite_repton_standing_looking_r
        EQUB    $00,$11,$33,$33,$33,$11,$00,$00
        EQUB    $FF,$CC,$DC,$DC,$EE,$FF,$FF,$C0
        EQUB    $88,$CC,$44,$44,$44,$CC,$88,$00
        EQUB    $11,$33,$22,$22,$22,$33,$11,$00

; $3B40 - Repton Standing looking left - head
.sprite_repton_standing_looking_l
        EQUB    $FF,$33,$B3,$B3,$77,$FF,$FF,$30
        EQUB    $00,$88,$CC,$CC,$CC,$88,$00,$00
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $00,$00,$00,$80,$88,$88,$CC,$CC

; $3B60 - Monster left hand up - head
.sprite_monster_left_hand_up
        EQUB    $77,$FC,$EC,$EC,$FF,$FD,$FE,$77
        EQUB    $FF,$F9,$D9,$D9,$F7,$FD,$F3,$FF
        EQUB    $00,$88,$88,$88,$88,$88,$88,$00
        EQUB    $00,$11,$11,$11,$11,$11,$11,$00

; $3B80 - Monster right hand up - head
.sprite_monster_right_hand_up
        EQUB    $FF,$F9,$B9,$B9,$FE,$FB,$FC,$FF
        EQUB    $EE,$F3,$73,$73,$FF,$FB,$F7,$EE
        EQUB    $00,$00,$00,$10,$11,$11,$33,$33
        EQUB    $00,$00,$00,$11,$22,$66,$00,$54

; $3BA0 - Big explosion - top
.sprite_explosion_big
        EQUB    $22,$AA,$01,$8A,$41,$1C,$83,$14
        EQUB    $88,$8D,$66,$44,$54,$46,$40,$22
        EQUB    $00,$00,$88,$04,$00,$AA,$11,$88
        EQUB    $00,$00,$00,$00,$00,$11,$00,$11

; $3BC0 - Medium explosion - top
.sprite_explosion_medium
        EQUB    $00,$00,$11,$02,$CD,$33,$8B,$14
        EQUB    $00,$00,$66,$44,$55,$66,$44,$22
        EQUB    $00,$00,$00,$00,$00,$88,$00,$CC
        EQUB    $00,$00,$00,$00,$00,$00,$00,$11

; $3BE0 - Small explosion - top
.sprite_explosion_small
        EQUB    $00,$00,$00,$00,$01,$77,$8B,$15
        EQUB    $00,$00,$00,$00,$44,$66,$44,$22
        EQUB    $00,$00,$00,$00,$00,$00,$00,$88
        EQUB    $00,$00,$00,$00,$10,$10,$10,$30

; $3C00 - Cracked Egg - top
        EQUB    $10,$50,$E0,$70,$B0,$D0,$E0,$D0
        EQUB    $80,$E0,$F0,$70,$B0,$50,$E0,$D0
        EQUB    $00,$00,$00,$00,$80,$00,$80,$C0
        EQUB    $00,$11,$11,$11,$11,$11,$11,$00

; 3C20 - Monster standing - head
        EQUB    $FF,$F9,$D9,$D9,$FE,$FB,$FC,$FF
        EQUB    $EE,$F3,$73,$73,$FF,$FB,$F7,$EE
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $00,$10,$10,$30,$30,$30,$70,$60

; $3C40 - Repton Standing - torso
        EQUB    $70,$F0,$F0,$F0,$70,$70,$30,$30
        EQUB    $E0,$F0,$F0,$F0,$E0,$E0,$C0,$C0
        EQUB    $00,$80,$80,$C0,$C0,$C0,$E0,$60
        EQUB    $00,$00,$00,$10,$10,$10,$30,$30

; $3C60 - Repton Standing looking right - torso
        EQUB    $30,$F0,$F0,$F0,$B0,$B0,$90,$10
        EQUB    $F0,$F0,$F0,$F0,$F0,$F0,$E0,$E0
        EQUB    $00,$C0,$C0,$E0,$60,$60,$70,$30
        EQUB    $00,$30,$30,$70,$60,$60,$E0,$C0

; $3C80 - Repton Standing looking left - torso
        EQUB    $F0,$F0,$F0,$F0,$F0,$F0,$70,$70
        EQUB    $C0,$F0,$F0,$F0,$D0,$D0,$90,$80
        EQUB    $00,$00,$00,$80,$80,$80,$C0,$C0
        EQUB    $66,$66,$33,$33,$33,$11,$11,$11

; $3CA0 - Monster left hand up - torso
        EQUB    $33,$FF,$FE,$FC,$F8,$F8,$F8,$F8
        EQUB    $EE,$EE,$FF,$F7,$F7,$FF,$EE,$EE
        EQUB    $00,$00,$00,$10,$99,$BB,$BB,$EE
        EQUB    $00,$00,$00,$80,$99,$DD,$DD,$77

; $3CC0 - Monster right hand up - torso
        EQUB    $77,$77,$FF,$FE,$FE,$FF,$77,$77
        EQUB    $CC,$FF,$F7,$F3,$F1,$F1,$F1,$F1
        EQUB    $66,$66,$CC,$CC,$CC,$88,$88,$88
        EQUB    $46,$03,$01,$88,$05,$88,$14,$E9

; $3CE0 - Big explosion - top middle
        EQUB    $4B,$1A,$24,$5A,$A5,$0B,$5A,$27
        EQUB    $10,$85,$40,$24,$94,$0E,$B4,$5A
        EQUB    $AA,$D1,$22,$A2,$00,$00,$51,$2A
        EQUB    $02,$01,$01,$00,$05,$00,$15,$65

; $3D00 - Medium explosion - top middle
        EQUB    $CB,$1A,$37,$9E,$E4,$8B,$1E,$AF
        EQUB    $11,$85,$EA,$2E,$B6,$0E,$3A,$5A
        EQUB    $88,$CC,$22,$A2,$44,$00,$44,$2A
        EQUB    $00,$01,$01,$00,$23,$22,$11,$23

; $3D20 - Small explosion - top middle
        EQUB    $CF,$1A,$37,$9E,$E4,$8B,$1E,$EB
        EQUB    $11,$85,$EA,$2E,$A7,$4A,$3B,$4B
        EQUB    $88,$CC,$00,$88,$44,$00,$44,$08
        EQUB    $30,$30,$70,$70,$20,$50,$60,$F0

; $3D40 - Cracked Egg - top middle
        EQUB    $B0,$D0,$B0,$70,$F0,$F0,$F0,$70
        EQUB    $B0,$D0,$E0,$D0,$B0,$D0,$B0,$70
        EQUB    $C0,$C0,$E0,$E0,$E0,$E0,$E0,$D0
        EQUB    $00,$00,$11,$91,$BB,$BB,$EE,$EE

; 3D60 - Monster standing - torso
        EQUB    $77,$FF,$FC,$F8,$F8,$F8,$F8,$F8
        EQUB    $CC,$EE,$F7,$F3,$F3,$F3,$E2,$E2
        EQUB    $00,$00,$00,$20,$AA,$AA,$AA,$EE
        EQUB    $42,$06,$04,$00,$00,$00,$00,$00

; $3D80 - Repton Standing - legs
        EQUB    $12,$03,$07,$07,$07,$0E,$0E,$0C
        EQUB    $84,$0C,$0E,$0E,$0E,$07,$07,$03
        EQUB    $24,$06,$02,$00,$00,$00,$00,$00
        EQUB    $21,$03,$02,$00,$00,$00,$00,$00

; $3DA0 - Repton Standing looking right - legs
        EQUB    $03,$03,$07,$07,$07,$06,$0E,$0E
        EQUB    $C0,$0C,$0E,$0E,$0E,$07,$03,$03
        EQUB    $12,$03,$01,$00,$00,$00,$00,$00
        EQUB    $84,$0C,$08,$00,$00,$00,$00,$00

; $3DC0 - Repton Standing looking left - legs
        EQUB    $30,$03,$07,$07,$07,$0E,$0C,$0C
        EQUB    $0C,$0C,$0E,$0E,$0E,$06,$07,$07
        EQUB    $48,$0C,$04,$00,$00,$00,$00,$00
        EQUB    $11,$11,$11,$00,$00,$00,$11,$11

; $3DE0 - Monster left hand up - legs
        EQUB    $FC,$FC,$FC,$FC,$FC,$FE,$FF,$FF
        EQUB    $E6,$E6,$E6,$E6,$E6,$FF,$FF,$FF
        EQUB    $EE,$44,$00,$00,$00,$88,$CC,$EE
        EQUB    $77,$22,$00,$00,$00,$11,$33,$77

; $3E00 - Monster right hand up - legs
        EQUB    $76,$76,$76,$76,$76,$FF,$FF,$FF
        EQUB    $F3,$F3,$F3,$F3,$F3,$F7,$FF,$FF
        EQUB    $88,$88,$88,$00,$00,$00,$88,$88
        EQUB    $88,$88,$0A,$D8,$01,$8E,$A8,$00

; $3E20 - Big explosion - middle bottom
        EQUB    $B6,$0B,$84,$5A,$0D,$B0,$09,$20
        EQUB    $1C,$C6,$2C,$0D,$78,$0C,$B0,$0C
        EQUB    $55,$11,$A2,$08,$37,$00,$40,$22
        EQUB    $33,$44,$46,$54,$01,$44,$00,$22

; $3E40 - Medium explosion - middle bottom
        EQUB    $B6,$0E,$84,$4A,$8D,$B0,$09,$AA
        EQUB    $3A,$C6,$2A,$0D,$78,$0C,$B1,$4C
        EQUB    $44,$00,$EE,$08,$26,$00,$44,$00
        EQUB    $33,$00,$02,$11,$01,$00,$00,$00

; $3E60 - Small explosion - middle bottom
        EQUB    $B4,$0E,$A4,$0A,$8D,$88,$09,$AA
        EQUB    $3B,$C7,$2A,$0D,$7B,$0C,$BB,$4C
        EQUB    $44,$00,$CC,$08,$00,$00,$00,$00
        EQUB    $F0,$F0,$F0,$F0,$E0,$D0,$B0,$70

; $3E80 - Cracked Egg - middle bottom
        EQUB    $A0,$D0,$B0,$70,$F0,$70,$B0,$70
        EQUB    $B0,$D0,$A0,$70,$B0,$D0,$B0,$70
        EQUB    $B0,$70,$F0,$70,$B0,$D0,$E0,$D0
        EQUB    $66,$44,$00,$00,$00,$00,$11,$11

; 3EA0 - Monster standing - legs
        EQUB    $FC,$FC,$FC,$FC,$FC,$FE,$FF,$FF
        EQUB    $E6,$E6,$E6,$E6,$E6,$EE,$FF,$FF
        EQUB    $CC,$44,$00,$00,$00,$00,$00,$00
        EQUB    $01,$01,$01,$01,$01,$03,$07,$0F

; $3EC0 - Repton Standing - feet
        EQUB    $0C,$08,$08,$08,$08,$08,$08,$00
        EQUB    $03,$01,$01,$01,$01,$01,$01,$00
        EQUB    $08,$08,$08,$08,$08,$0C,$0E,$0F
        EQUB    $00,$01,$01,$01,$01,$03,$07,$0F

; $3EE0 - Repton Standing looking right - feet
        EQUB    $0C,$0C,$0C,$08,$08,$08,$08,$00
        EQUB    $03,$01,$01,$01,$01,$01,$01,$00
        EQUB    $08,$08,$08,$08,$08,$0C,$0E,$0F
        EQUB    $01,$01,$01,$01,$01,$03,$07,$0F

; $3F00 - Repton Standing looking left - feet
        EQUB    $0C,$08,$08,$08,$08,$08,$08,$00
        EQUB    $03,$03,$03,$01,$01,$01,$01,$00
        EQUB    $00,$08,$08,$08,$08,$0C,$0E,$0F
        EQUB    $11,$33,$33,$33,$33,$33,$77,$99

; $3F20 - Monster left hand up - feet
        EQUB    $FC,$B8,$B8,$20,$20,$20,$88,$44
        EQUB    $A2,$00,$00,$00,$00,$00,$00,$00
        EQUB    $99,$00,$00,$00,$00,$00,$00,$00
        EQUB    $99,$00,$00,$00,$00,$00,$00,$00

; $3F40 - Monster right hand up - feet
        EQUB    $54,$00,$00,$00,$00,$00,$00,$00
        EQUB    $F3,$D1,$D1,$40,$40,$40,$11,$22
        EQUB    $88,$CC,$CC,$CC,$CC,$CC,$EE,$99
        EQUB    $54,$00,$44,$11,$22,$11,$00,$00

; $3F60 - Big explosion - bottom
        EQUB    $00,$29,$60,$01,$14,$77,$00,$22
        EQUB    $01,$A1,$12,$80,$06,$4C,$00,$99
        EQUB    $00,$44,$00,$00,$44,$88,$88,$00
        EQUB    $11,$00,$00,$11,$00,$00,$00,$00

; $3F80 - Medium explosion - bottom
        EQUB    $00,$2B,$66,$01,$55,$00,$00,$00
        EQUB    $89,$AA,$9B,$88,$66,$00,$00,$00
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00

; $3FA0 - Small explosion - bottom
        EQUB    $44,$23,$22,$00,$00,$00,$00,$00
        EQUB    $88,$AA,$88,$00,$00,$00,$00,$00
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $70,$70,$70,$70,$30,$30,$10,$00

; $3FC0 - Cracked Egg - bottom
        EQUB    $A0,$D0,$E0,$F0,$E0,$D0,$B0,$70
        EQUB    $F0,$D0,$A0,$70,$F0,$70,$B0,$C0
        EQUB    $A0,$60,$E0,$E0,$C0,$C0,$80,$00
        EQUB    $11,$33,$33,$33,$33,$33,$77,$99

; 3FE0 - Monster standing - feet
        EQUB    $FC,$B8,$B8,$10,$10,$10,$88,$44
        EQUB    $F7,$B3,$B3,$11,$11,$11,$33,$55
        EQUB    $00,$88,$88,$88,$88,$88,$CC,$22