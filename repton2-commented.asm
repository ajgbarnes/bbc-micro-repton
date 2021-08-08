org &0A00

; Zeropage
; 01-15 appear to be set to current SOUND to play

eventv_lsb_vector = $0220
eventv_msb_vector = $0221
; Sheila User Via Timer 2 Control low-order latch
SHEILA_USER_VIA_R8_T2C_L = $FE68
; Sheila User Via Timer 2 Control High-order latch
SHEILA_USER_VIA_R9_T2C_H = $FE69
; Sheila User VIA Interrupt Enable Register
SHEILA_USER_VIA_R14_IER = $FE6E
SHEILA_SYSTEM_VIA_R14_IER= $FE4E
SHEILA_SYSTEM_VIA_R14_IFR= $FE4D

; Interrupt-request vector 2 (IRQ2V)
IRQ2V_LSB = $0206
IRQ2V_MSB = $0207

; TODO RECLOCATE THIS IN MEMORY!!!!!

;0A00
INCLUDE "repton-first-chord-note.asm"
;0B00
INCLUDE "repton-second-chord-note.asm"
;0C00
INCLUDE "repton-third-chord-note.asm"
;0D00
; Junk byte?
        EQUB    $00
;L0D01
.end_event_handler_IRQ2V
        ; This is the end of the IRQV2 event handler
        ; Restore A, X and Y from the stack
        ; as this will return from the interrupt
        ; and continue
        PLA
        TAY
        PLA
        TAX

        ; Disable User VIA Timer 2
        ; Seems to act as a JSR as the fn ends 
        ; with an RTI
        JMP     fn_disable_timer_2
;0D08
.fn_event_handler_IRQ2V
        ; This is the IRQ2V event handler routine
        ; when Timer 2 fires

        ; This plays the music for the game and
        ; plays 3 notes in rapid succession on 
        ; Channel 1 to give a pseudo chord effect

        ; First  note is stored $0A00-$0AFF
        ; Second note is stored $0B00-$0BFF
        ; Third  note is stored $0C00-$0CFF

        ; All parameters are the same other than the
        ; pitch i.e. channel, amplitude, volume

        ; Preserve A, X and Y and on the stack
        ; as we're an interrupt (will get restored)
        ; before returning
        TXA
        PHA
        TYA
        PHA

        ; Limit the rate at which the notes are played
        ; only play every 8th time this is called - this is
        ; achieved by ANDing with 7 / 0000 0111
        INC     var_music_rate_cycle
        LDA     var_music_rate_cycle
        AND     #$07
        BNE     end_event_handler_IRQ2V        

        ; Get the next note sequence number to play
        INC     var_note_sequence_number
        ; Set to channel 1 and flush the sound channel
        ; if a note is already playing
        LDA     #$11
        STA     zp_sound_block_channel_lsb

        ; Get the next note sequence number to play
        LDX     var_note_sequence_number

        ; Load the note and play the note
        LDA     data_first_chord_note,X
        JSR     fn_set_sound_block_and_play_sound

        ; Reload the next note sequence number to play
        ; (X gets trashed in the sub-routine)
        LDX     var_note_sequence_number
        LDA     data_second_chord_note,X
        JSR     fn_set_sound_block_and_play_sound

        ; Reload the next note sequence number to play
        ; (X gets trashed in the sub-routine)
        LDX     var_note_sequence_number
        ; Load the current pitch to play
        LDA     data_third_chord_note,X
        JSR     fn_set_sound_block_and_play_sound

        ; End the processing here
        JMP     end_event_handler_IRQ2V

;0D3B
.fn_set_sound_block_and_play_sound
        ; Set the pitch to the value passed in A
        STA     zp_sound_block_pitch_lsb
        LDA     #$00

        ; Set all MSBs to zero
        STA     zp_sound_block_channel_msb
        STA     zp_sound_block_amplitude_msb
        STA     zp_sound_block_pitch_msb
        STA     zp_sound_block_duration_msb

        ; Set the amplitude and duration to 1
        LDA     #$01
        STA     zp_sound_block_amplitude_lsb
        STA     zp_sound_block_duration_lsb

        ; Sounds parameter block is stored at $0600
        ; Set XY and call fn to play the sound
        LDX     #$60
        LDY     #$00
        JMP     fn_play_game_sound

        ; Junk bytes
        NOP
        NOP
        
        ; Seems to be called when going back to the game
        ; before Repton is drawn on the screen
;0D56
.fn_draw_repton
        JSR     fn_lookup_repton_sprite_and_display


;0D59
        ; Set the EVENTV / EVNTV handling routine
        ; to $0D90
        LDA     #HI(fn_enable_timer_2)
        STA     eventv_msb_vector
;0d5e        
        LDA     #LO(fn_enable_timer_2)
        STA     eventv_lsb_vector
        ; OSBYTE &0D 
        ; Enable VSYNC event ($04) - event is generated
        ; 50 times per second at the start of vertical
        ; sync
        LDA     #$0E
        LDX     #$04
        JMP     OSBYTE

;0d6a
.fn_disable_vsync_event
        ; TODO Not sure what this does yet
        LDA     #$0E
        STA     zp_screen_password_lookup_index

        ; Stop maskable interrupts
        CLI
        ; OSBYTE &0D 
        ; Disable VSYNC event ($04)
        LDA     #$0D
        LDX     #$04
        JMP     OSBYTE

;L0D76
.fn_reset_palette_music_and_vsync
        ; Reset 
        JSR     fn_dissolve_screen

        LDA     #$FF
        STA     var_note_sequence_number
        RTS
;L0D7F
.fn_play_game_sound
        ; Check to see if both sound and music are on
        ; if not branch to the end
        LDA     var_both_sound_and_music_on_status
        BEQ     skip_play_sound

        ; If the sound pitch is zero skip playing
        ; the sound
        LDA     zp_sound_block_pitch_lsb
        BEQ     skip_play_sound

        ; OSWORD &07
        ; Perform a sound command
        ; XY contains the sound parameter address block
        LDA     #$07
        JSR     OSWORD

;L0D8D
.skip_play_sound
        INC     L0060
        RTS

;0D90
.fn_enable_timer_2
        ; TODO IS THIS A ONE SHOT TIMER?!?! Assuming it is
        ;
        ; Enable Timer 2 on the User VIA
        ; by called the User VIA Interrupt Enable
        ; Register 
        ; 1010 0000
        LDA     #$A0
        STA     SHEILA_USER_VIA_IER_R14

        ; Set to counter to $09D0 / 2512
        ; 
        ; Timer 2 is decremented at 1Mhz so timer will
        ; create an event 398 times a second OR 
        ; TODO
        ; if this is a one shot timer then called very 
        ; 2.512 milliseconds
        ; 1,000,000 / 2512 = 398
        ;
        ; $D0 is written to the latch first
        ; When $09 is written to the high order coutner
        ; the low order latch is transferred to the low
        ; order counter
        ;
        ; Also resets Timer 2 interrupt flag
        ; when T2C_H is written to below
        LDA     #$D0    
        STA     SHEILA_USER_VIA_R8_T2C_L
        LDA     #$09
        STA     SHEILA_USER_VIA_R9_T2C_H

        ; Set the interrupt request vector 2
        ; to point at the routine at $0D08
        LDA     #LO(fn_event_handler_IRQ2V)
        STA     IRQ2V_LSB
        LDA     #HI(fn_event_handler_IRQ2V)
        STA     IRQ2V_MSB
        RTS

;L0DAA
.fn_disable_timer_2
        ; Disable Timer 2 on the User VIA
        ; by called the User VIA Interrupt Enable
        ; Register (IER)
        ; 0010 0000
        LDA     #$20
        STA     SHEILA_USER_VIA_R14_IER
        LDA     L00FC
        RTI        

;spare bytes
        EQUB    $00,$00

;...

        ; Table of Repton poses - based on the value of $0905
        ; $3600 - Repton Left hand up
        ; $3620 - Repton Right hand up
        ; $3640 - Repton Moving right, right hand forward
        ; $3660 - Repton Moving right, right hand slightly forward
        ; $3680 - Repton Moving right, right hand slightly back
        ; $36A0 - Repton Moving right, right hand back
        ; $36C0 - Repton Moving left,  left hand back
        ; $36E0 - Repton Moving left,  left hand slightly back
        ; $3700 - Repton Moving left,  left hand slightly forward
        ; $3720 - Repton Moving left,  left hand forward
        ; $3B00 - Repton Standing
        ; $3B20 - Repton Standing looking right
        ; $3B40 - Repton Standing looking left
        ; ... (monster left hand up)
        ; ... (monster right hand up)
        ; $3BA0 - Big explosion
        ; $3BC0 - Medium explosion
        ; $3BE0 - Small explosion

;0E02        
.data_repton_pose_lookup_table_lsb
        EQUB    LO(sprite_repton_left_hand_up)
        EQUB    LO(sprite_repton_right_hand_up)
        EQUB    LO(sprite_repton_moving_r_r_hand_fwd)
        EQUB    LO(sprite_repton_moving_r_r_hand_s_fwd)
        EQUB    LO(sprite_repton_moving_r_r_hand_s_back)
        EQUB    LO(sprite_repton_moving_r_r_hand_back)
        EQUB    LO(sprite_repton_moving_l_l_hand_back)
        EQUB    LO(sprite_repton_moving_l_l_hand_s_back)
        EQUB    LO(sprite_repton_moving_l_l_hand_s_forward)
        EQUB    LO(sprite_repton_moving_l_l_hand_forward)
        EQUB    LO(sprite_repton_standing_head)
        EQUB    LO(sprite_repton_standing_looking_r)
        EQUB    LO(sprite_repton_standing_looking_l)
        EQUB    LO(sprite_explosion_big)
        EQUB    LO(sprite_explosion_medium)
        EQUB    LO(sprite_explosion_small)


.data_repton_pose_lookup_table_msb
        EQUB    HI(sprite_repton_left_hand_up)
        EQUB    HI(sprite_repton_right_hand_up)
        EQUB    HI(sprite_repton_moving_r_r_hand_fwd)
        EQUB    HI(sprite_repton_moving_r_r_hand_s_fwd)
        EQUB    HI(sprite_repton_moving_r_r_hand_s_back)
        EQUB    HI(sprite_repton_moving_r_r_hand_back)
        EQUB    HI(sprite_repton_moving_l_l_hand_back)  
        EQUB    HI(sprite_repton_moving_l_l_hand_s_back)
        EQUB    HI(sprite_repton_moving_l_l_hand_s_forward)
        EQUB    HI(sprite_repton_moving_l_l_hand_forward)
        EQUB    HI(sprite_repton_standing_head)      
        EQUB    HI(sprite_repton_standing_looking_r)  
        EQUB    HI(sprite_repton_standing_looking_l)  
        EQUB    HI(sprite_explosion_big)
        EQUB    HI(sprite_explosion_medium)
        EQUB    HI(sprite_explosion_small)
;0E22

;...
;0E36
; TODO 
; Lookup table of a moving bit 
; e.g. 1, 2, 4, 8, 16, 32, 64, 128
; 00000001, 00000010, 00000100 ..... 10000000
        EQUB    $01,$02,$04,$08,$10,$20,$40,$80      
;... 

; 0E46
.envelope_1
        ; OSWORD &08 / ENVELOPE Paramter block
        ; ENVELOPE 1,2,0,0,0,1,2,3,100,1,255,254,126,126
        ; https://central.kaserver5.org/Kasoft/Typeset/BBC/Ch30.html
        EQUB    $01,$02,$00,$00,$00,$01,$02,$03
        EQUB    $64,$01,$FF,$FE,$7E,$7E
;...
;0E54
.data_screen_physical_colour_lookup
        ; Lookup table of physical colour to 
        ; user per screen level for logical colour 1
        ; Logical colour 1 defaults to red
        ; 0 - Black
        ; 1 - Red
        ; 2 - Green
        ; 3 - Yellow
        ; 4 - Blue
        ; 5 - Magenta
        ; 6 - Cyan
        ; 7 - White
        ; Screen A - Red
        EQUB    $01
        ; Screen B - Blue        
        EQUB    $04
        ; Screen C - Magenta
        EQUB    $05
        ; Screen D - Red
        EQUB    $01
        ; Screen E - Red        
        EQUB    $01
        ; Screen F - Red        
        EQUB    $01
        ; Screen G - Magenta
        EQUB    $05
        ; Screen H - Magenta  
        EQUB    $05
        ; Screen I - Red 
        EQUB    $01
        ; Screen J - Blue
        EQUB    $04
        ; Screen K - Magenta
        EQUB    $05
        ; Screen L - Cyan
        EQUB    $06

;L0E60
.data_screen_character_lookup_table
        EQUB    $73,$BC,$BD,$69,$BF,$BE,$75,$73
        EQUB    $62,$63,$C7,$73,$C3,$6C,$C2,$71
        EQUB    $5C,$5D,$5E,$5F,$60,$61,$84,$85
        EQUB    $86,$87,$C1,$6B,$66,$C6,$67,$74
        EQUB    $73,$88,$89,$8A,$8B,$8C,$8D,$8E
        EQUB    $8F,$90,$91,$92,$93,$94,$95,$96
        EQUB    $97,$98,$99,$9A,$9B,$9C,$9D,$9E
        EQUB    $9F,$A0,$A1,$C4,$72,$C5,$70,$6C
;EA0        
        EQUB    $76,$A2,$A3,$A4,$A5,$A6,$A7,$A8
        EQUB    $A9,$AA,$AB,$AC,$AD,$AE,$AF,$B0
;EB0
        EQUB    $B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8
        EQUB    $B9,$BA,$BB,$64,$6E,$65,$6D,$64
        EQUB    $65,$66,$67,$6A,$6B,$6D,$6E
;EBF        
        EQUB    $6F,$11,$12,$13,$14,$0D,$0F,$10
        EQUB    $0E,$0C,$70,$72,$75,$76,$77,$BD
        EQUB    $24,$25,$69,$BE,$BF,$C0,$C3,$73
;..
;0EDF
.data_screen_colour_masks
        EQUB    $00,$0F,$F0,$FF

; TODO - don't know yet
;0EED
        EQUB    $42,$79
;...

; 0EE3
.text_by_superior_software
        EQUS    "By, Superior Software",$0D
;0EF9
.text_score
        EQUS    $83,"Score :",$0D
;0F02
.text_hi_score
        EQUS    "Hi-score :",$0D
;0F0D
.text_time
        EQUS    "Time :",$0D
;0F14
.text_lives
        EQUS    "Lives :",$0D
;0F1C
.text_diamonds
        EQUS    "Diamonds :",$0D
;0F27
.text_screen        
        EQUS    "Screen :       ",$83,"(M-Map)",$0D
;0F3F
.text_sound
        EQUS    "Sound :       ",$83,"(S/Q)",$0D
;0F54
.text_press_escape
        EQUS    $81,"Press",$82," ESCAPE",$81," to kill yourself",$0D
;0F75
.text_press_return
        EQUS    $81,"Press",$82," RETURN",$81," to get back here",$0D
;0F96
.text_press_space
        EQUS    $81,"Press",$82," SPACE ",$81," to play game",$0D,$0D

.L0FB4
.fn_wait_for_vertical_sync
        ; Waits for 20ms
        ;
        ; Preserve the processor flags
        PHP
        ; Clear maskable interrupts
        CLI
;L0FB6
.loop_wait_for_vsync
        ; This waits function waits up to 20 ms for an 
        ; interrupt from CA1 on the System VIA
        ; There's an interrupt every 20ms from the 6485
        ; for vertical sync

        ; Disable the CA1 interrupt on the System VIA
        ; 00000010
        ; Bit 7 - 0 - disable interrupt
        ; Bit 2 - 1 - CA1 interrupt
        LDA     #$02
        STA     SHEILA_SYSTEM_VIA_R14_IER
        ; Check SHEILA FE4D Interrupt Register
        ; on the System VIA.  Waits until the register
        ; is un set before continuing
        ; Get interrupt status and wait until CA1 
        ; is set        
        BIT     SHEILA_SYSTEM_VIA_R14_IFR
        BEQ     loop_wait_for_vsync

        ; Re-enable the CA1 interrupt on the System VIA
        ; 10000010
        ; Bit 7 - 1 - enable interrupt
        ; Bit 2 - 1 - CA1 interrupt
        LDA     #$82
        STA     SHEILA_SYSTEM_VIA_R14_IER

        ; Restore the processor flags
        PLP
        RTS

;...

;1044
.fn_generate_random_number
        ; Generate a random number
        ; On exit
        ;       $0902 contains random number
        ;           A contains random number
        ;
        ; T1H = T1 High Order Counter
        ; T1L = T1 Low  Order Counter
        ; S   = Starting value in $0902
        ; R   =  Random value result
        ;
        ; R = ((S + T1H) EOR T1C) + 2 * ((S + T1H) EOR T1C)
        ;
        ; In BASIC (Note S starting value can be anything)
        ;
        ; 10 S = 20
        ; 20 T1H = ?&FE65
        ; 30 T1C = ?&FE64
        ; 40 R = ((S + T1H) EOR T1C) + 2 * ((S + T1H) EOR T1C)
        ; 50 PRINT ~R
        ;
        LDA     var_random_value
        ADC     SHEILA_USER_VIA_R5_T1C_H
        EOR     SHEILA_USER_VIA_R5_T1C_L
        STA     var_random_value
        ROL     A
        ADC     var_random_value
        STA     var_random_value
        ; Note that $0902 is never read outside
        ; this sub-routine
        RTS
;...

; 107A
.fn_play_sound
        ; OSWORD &07
        ; Play sound from parameters at $0001
        STY     L0004
        LDX     #$01
        LDY     #$00
        LDA     #$07
        JMP     OSWORD

; 1085
.fn_read_key
        ; A contains the key to be read
        TAX
        ; OSBYTE &81
        ; Scan keyboard for keypress of key in X
        ; X - negative inkey value of key
        ; Y - always $FF
        ;
        ; On return X and Y will contain $FF if
        ; it was being pressed and A will be set
        ; to $FF otherwise $00
        LDY     #$FF
        LDA     #$81
        JSR     OSBYTE
        TYA
        RTS

; 108F
.fn_define_logical_colour
{
        ; Top four bits of A are the logical colour
        ; to change, bottom four bits are the physical
        ; colour to set
        ;
        ; If A = 00010011 
        ; Logical  colour 1 (0001) 
        ; would be changed to 
        ; pyhsical colour 3 (0011)
        STA     L0000

        ; VDU 19, <logical colour>, <physical colour>,0,0,0
        LDA     #$13
        JSR     OSWRCH

        ; <logical colour>
        ; Top four bits of zeropage location $00 
        ; contains the logical colour to change
        ; Rotate it into the bottom four bits
        LDA     L0000
        LSR     A
        LSR     A
        LSR     A
        LSR     A
        JSR     OSWRCH

        ; <physical colour>
        ; Bottom four bits of zeropage location $00 
        ; contains the physical colour to set
        ; AND out the rest of the bits

        ; Only keep the bottom four bits to work out the
        ; physical colour
        LDA     L0000
        AND     #$0F
        JSR     OSWRCH

        ; Always set to 0 on a BBC
        LDA     #$00
        JSR     OSWRCH
        JSR     OSWRCH
        JMP     OSWRCH
}

; 10B1
.fn_calc_screen_address_from_x_y_pos
{
        ; Screen is from $6000 - $7FFF
        ; Screen write address = screen start adress + (xpos * 8) + (y *256)
        ; On entry:
        ;    X contains the cursor x position 
        ;    Y contains the cursor y position 
        ;
        ; Screen can be 32 x 32 objects
        ;
        ; On exit:
        ;    X contains the LSB for the screen address
        ;    Y contains the MSB for the screen address

        ; Get the x position
        TXA
        ; Multiply by 8
        ASL     A
        ASL     A
        ASL     A
        CLC
        ; Add to the LSB 
        ADC     zp_screen_start_address_lsb
        TAX
        TYA
        ; Add Y to the MSB and any carry flag
        ADC     zp_screen_start_address_msb
        ; If the screen address is < $7FFF then we're doing
        BPL     end_calc__screen_address_from_x_y_pos

        ; Screen address is > $7FFF so wrap it to the
        ; start of the screen my subtracting $2000
        SEC
        SBC     #$20
;L10C1
.end_calc__screen_address_from_x_y_pos
        TAY
        RTS
}

;L10C3
.fn_check_sound_keys
        ; Check to see if the player has 
        ; asked for the sound to be switched off
        ; INKEY $EF is Q for Quiet
        LDA     #$EF
        JSR     fn_read_key

        ; Wasn't pressed so check S key
        BEQ     check_s_key

        ; Switch the sound status to off
        LDA     #$00
        STA     var_sound_status
;L10CF
.check_s_key
        ; Check to see if the player has 
        ; asked for the sound to be switched on
        ; INKEY $EF is S for Sound
        LDA     #$AE
        JSR     fn_read_key

        BEQ     end_check_sound_keys

        ; Switch the sound status to on
        LDA     #$01
        STA     var_sound_status
;L10DB
.end_check_sound_keys
        RTS

;L10DC
.fn_check_escape_key
        ; Check to see if escape has been pressed
        LDA     #$8F
        JSR     fn_read_key

        ; If it wasn't pressed branch ahead
        BEQ     end_check_for_map_key_press

        ; OSWRCH &0C / VDU 12 - clear text area
        ; and put cursor in home position
        LDA     #$0C
        JSR     OSWRCH

        ; Reset screen start address to $6000
        LDA     #$00
        STA     zp_screen_start_address_lsb
        LDA     #$60
        STA     zp_screen_start_address_msb
        JMP     L1708        
;...
;L10F3
.end_check_for_key_press
        RTS

;L10F4
.fn_check_for_map_key_press
        ; Check to see if the player has 
        ; asked for the map to be displayed
        ; INKEY $9A is M for Map
        LDA     #$9A
        JSR     fn_read_key

        ; Check if it was pressed 
        ; ($FF if it was)
        ; ($00 if it wasn't)
        BEQ     end_check_for_key_press

        ; Don't display the map if the user is on 
        ; Screen I or higher (mean!)
        LDA     var_screen_number
        CMP     #$08
        BCS     end_check_for_key_press

        ; Disable the vsync event
        ; Reset the palette to default
        ; Change logical colour 1 to the level specific colour
        ; Change logical colour 3 to cyan
        JSR     fn_disable_vsync_create_map_colours

        ; Set current tile position?
        ; X 76 
        ; Y 77>
        LDA     #$00
        STA     L0076
        STA     L0077
        LDA     zp_visible_screen_top_left_xpos
        STA     L007C
.L110F
        LDA     zp_visible_screen_top_left_ypos
.L1111
        STA     L007D
        LDA     #$00
        STA     zp_visible_screen_top_left_xpos
        STA     zp_visible_screen_top_left_ypos
.L1119
        LDX     L0076
        LDY     L0077
        JSR     fn_lookup_screen_object_for_x_y

        JSR     L1BEE

        INC     L0076
        LDA     L0076
        ; 
        CMP     #$20
        BNE     L1119

        LDA     #$00
        STA     L0076
        INC     L0077
        LDA     L0077
        CMP     #$20
        BNE     L1119

        JSR     loop_wait_for_space_bar_on_screen

        ; Spare bytes
        NOP
        NOP
        NOP
        NOP
        LDA     L007C
        STA     zp_visible_screen_top_left_xpos
        LDA     L007D
        STA     zp_visible_screen_top_left_ypos
        PLA
        PLA
        JMP     L17B5
;...
;L114B
.fn_write_3_byte_display_value_to_screen
        ; Each value to display is 3 bytes
        ; and handled in the order of MSB MLSB LSB 
        ; Each digit is 4 bits (a nibble) and 
        ; stored as Binary Coded Decimal (BCD)
        ; So will only ever be 0-9 (A-F are not used)
        ;
        ; On entry
        ;    A is undefined
        ;    X contains screen xpos
        ;    Y contains screen ypos
        ;    $0010 MSB  of the value to be displayed
        ;    $0011 MLSB of the value to be displayed
        ;    $0012 LSB  of the value to be displayed    

        ; Store the required screen x,y position
        STX     zp_password_cursor_xpos
        STY     zp_password_cursor_ypos

        ; Set the colour mask to use all available
        ; colours
        LDA     #$FF
        STA     zp_screen_colour_mask

        ; Reset 0F
        ; Determines whether a trailing zero should
        ; be printed - if set to $00 it'll be printed
        ; so it's hard coded for all digits to display
        LDA     #$00
        STA     zp_print_zero_or_not_flag

        ; Print the value of the MSB's highest 4 bits 
        ; Rotate the highest 4 bits into the
        ; lowest 4 bits
        LDA     zp_display_value_msb
        LSR     A
        LSR     A
        LSR     A
        LSR     A
        JSR     fn_print_digit_to_screen


        ; Print the value of the MSB's lowest 4 bits 
        ; Mask out the highest four bits of the MSB
        ; and print the digit to the screen
        LDA     zp_display_value_msb
        AND     #$0F
        JSR     fn_print_digit_to_screen

        ; Print the value of the LMSB's highest 4 bits 
        ; Rotate the highest 4 bits into the
        ; lowest 4 bits
        LDA     zp_display_value_lmsb
        LSR     A
        LSR     A
        LSR     A
        LSR     A
        JSR     fn_print_digit_to_screen

        ; Print the value of the MSB's lowest 4 bits 
        ; Mask out the highest four bits of the MSB
        ; and print the digit to the screen
        LDA     zp_display_value_lmsb
        AND     #$0F
        JSR     fn_print_digit_to_screen

        ; Print the value of the LSB's highest 4 bits 
        ; Rotate the highest 4 bits into the
        ; lowest 4 bits
        LDA     zp_display_value_lsb
        LSR     A
        LSR     A
        LSR     A
        LSR     A
        JSR     fn_print_digit_to_screen

        ; Print the value of the LSB's lowest 4 bits 
        ; Mask out the highest four bits of the LSB
        ; and print the digit to the screen
        LDA     zp_display_value_lsb
        AND     #$0F
        JSR     fn_print_digit_to_screen

        ; Check to see if a zero should be output - 
        ; if no digits has been printed e.g. if
        ; the score is $00 $00 $00
        ; fn_print_digit_to_screen will updated the value
        LDA     zp_print_zero_or_not_flag
        BNE     end_write_3_byte_display_value_to_screen

        LDA     #$30
        JSR     fn_print_character_to_screen

;L1190
.end_write_3_byte_display_value_to_screen
        RTS

.L1191
.fn_print_digit_to_screen
        ; Digit will always be 0-9 (Binary Coded Decimal)
        ; If it's non-zero then jump ahead and print it
        CMP     #$00
        BNE     L119B

        ; Flag is used so that leading zeros are not
        ; printed to screen but zeros after the first
        ; real digit can be printed. If flag is zero,
        ; then it's a leading zero so don't print it
        LDX     zp_print_zero_or_not_flag
        CPX     #$00
        BEQ     end_print_digit_to_screen

;L119B
.print_digit_to_screen
        ; Non-zero digit has or is already been
        ; written to the screen so update the flag 
        ; so zeros are not printed
        LDX     #$01
        STX     zp_print_zero_or_not_flag

        ; ASCII $30 is the first number (0) so 
        ; add the value onto this to get the write
        ; ASCII character number to print
        CLC
        ADC     #$30
        JMP     fn_print_character_to_screen

;L11A5
.end_print_digit_to_screen
        RTS        

;11A6
.fn_write_string_to_screen
        ; Store the xpos and ypos of where
        ; to start writing the string
        STX     zp_password_cursor_xpos
        STY     zp_password_cursor_ypos

        ; Reset the byte counter for looping through
        ; the string
        LDA     #$00
        STA     zp_string_to_display_current_byte
;L11AE
.loop_get_next_string_byte
        LDY     zp_string_to_display_current_byte
        LDA     (zp_object_or_string_address_lsb),Y

        ; Carriage return indicates end of string
        ; so end if we find one
        CMP     #$0D
        BEQ     end_write_string_to_screen

        ; Print the character to the screen
        JSR     fn_print_character_to_screen

        ; Get the next byte (up to 255)
        INC     zp_string_to_display_current_byte
        BNE     loop_get_next_string_byte

;L11BD
.end_write_string_to_screen
        RTS

;11BE
.fn_print_character_to_screen

        ; Next set of checks determine if the character
        ; is in the following ranges and only displays
        ; them if they are - doesn't seem right as 
        ; some of the characters in $20 to $3A show
        ; minimap character e.g. an egg or piece of earth
        ;
        ; Do something is Escape
        ; Do something if Return
        ; Delete character on screen if Delete
        ;
        ; Display if between $20 and $3A (SPACE....:)
        ; Display if between $41 and $5A (A...Z)
        ; Display if between $61 and $7A (a....z)
        ;
        ; Allowed characters - A-Z a-z 0-9
        ; <space>!"#$%&'()*+,-./
        ; $00 - $0C - not allowed
        ; $0D - return
        ; $0E - $1A - not allowed
        ; $1B - escape
        ; $1C - $1F - not allowed
        ; $20 - $2F - <space>!"#$%&'()*+,-./
        ; $30 - $39 - 0123456789
        ; $3A - :
        ; $3B - $40 - not allowed
        ; $41 - $5A - A-Z
        ; $61 - $7A - a-z
        ; $7B - $7E - not allowed
        ; $7F - delete


        ; Push the status register onto the stack
        ; so processing isn't interrupting on whatever
        ; called this
        PHP
        NOP
        ; Check to see if the current character to
        ; process is Return - if not branch ahead
        CMP     #$0D
        BNE     check_if_delete_character

        ; Process Return

        ; Reset the screen x cursor position to zero
        LDA     #$00
        STA     zp_password_cursor_xpos
        JMP     move_to_next_y_pos

;L11CB
.check_if_delete_character
        ; Check to see if the current character to process
        ; is Delete - if not branch ahead
        CMP     #$7F
        BNE     check_if_user_defined_character

        ; Process Delete

        ; Load the cursor x position
        ; if it's zero then don't decrement it!
        LDA     zp_password_cursor_xpos
        BEQ     end_print_character_to_screen

        ; Decrement the cursor position as we're
        ; performing a delete
        DEC     zp_password_cursor_xpos

        ; Set the current character to space and 
        ; overwrite whatever is on the screen at 
        ; that point (it's a delete)
        LDA     #$20
        JSR     fn_print_character_to_screen

        ; Decrement the cursor position 
        ; TODO - why again?
        DEC     zp_password_cursor_xpos
        JMP     end_print_character_to_screen

;L11DF
.check_if_user_defined_character
        ; Check if it's a normal ASCII character
        ; if so, branch ahead
        CMP     #$80
        BCC     check_if_normal_character

        ; Greater than $80 so need to look up the
        ; colour mask. The colour mask is used 
        ; to ask out the colour - values are either $00, $0F, $F0 or $FF
        ; In mode 5, the screen is 2 bits per pixel
        ; with the bits in the same position in the 
        ; top and bottom nibble
        ; e.g. 01[0]1 00[0]1 where the [] represents the same pixel
        ; Masking uses both bits ($FF), just the lower bits ($0F)
        ; or just the higher bits ($F0) to choose the colour        
        AND     #$03
        TAX
        LDA     data_screen_colour_masks,X
        STA     zp_screen_colour_mask
.L11EB
        JMP     end_print_character_to_screen

;L11EE
.check_if_normal_character
        ; Check to see if it's in the printable range
        ; for normal characters so above $20/32 - previous
        ; check for less than $80 - so 
        CMP     #$20
        BCC     end_print_character_to_screen

        ; A > $20
        ; Character is between ASCII $20/32 and $7F/127 
        ; inclusive so shift the code to be zero based for 
        ; lookup in the lookup table to find the tile
        SEC
        SBC     #$20
        TAX

        ; Lookup the tile in position 0 to 127
        LDA     data_screen_character_lookup_table,X
        JSR     fn_write_tile_to_screen

.L11FC
.move_to_next_x_pos
        ; Note that each row is 32 characters wide
        ; if we exceed we reset to zero and increnemt
        ; the ypos (next row)
        INC     zp_password_cursor_xpos
        LDA     zp_password_cursor_xpos
        CMP     #$20
        BNE     end_print_character_to_screen

        ; Reset the x position to the beginning of the line
        LDA     #$00
        STA     zp_password_cursor_xpos
;L1208
.move_to_next_y_pos
        INC     zp_password_cursor_ypos
        LDA     zp_password_cursor_ypos

        ; Screen only has $20/32 lines, if we reached the max
        ; reset the ypos  to zero
        CMP     #$20
        BNE     end_print_character_to_screen
        LDA     #$00
        STA     zp_password_cursor_ypos
;1214
.end_print_character_to_screen
        ; Pull the status register from the stack
        ; so processing on whatever called us 
        ; call resume without being compromised
        PLP
        RTS


;L1216
.fn_print_character_and_increment_xpos
        PHP
        NOP
        JSR     fn_write_tile_to_screen

        JMP     move_to_next_x_pos
;...

;L16E2
.fn_wait_120ms

        ; Wait 6 * 20 ms = 120 ms
        LDX     #$06
        
        ; Loop around 6 times waiting
        ; for vertical sync (up to 120ms)
;L16E4
.loop_wait_for_vsync_fn
        ; Wait up to 20ms
        JSR     fn_wait_for_vertical_sync

        ; If still need to wait then loop back
        DEX
        BNE     loop_wait_for_vsync_fn

        RTS
;...

.L1708
        ; Switch off Binary Coded Decimal mode
        CLD

        LDA     #$10
        STA     zp_screen_write_address_lsb

        LDA     #$F1
        LDX     #$06
        LDY     #$02
        JSR     L0DB4

        ; Display the explosion on the screen
        ; for 120 ms
        JSR     fn_wait_120ms

        ; Display a small explosion on the screen
        LDA     #$0F
        STA     var_repton_animation_state
        JSR     fn_lookup_repton_sprite_and_display

        ; Display the explosion on the screen
        ; for 120 ms
        JSR     fn_wait_120ms

        ; Display a medium explosion on the screen
        LDA     #$0E
        STA     var_repton_animation_state
        JSR     fn_lookup_repton_sprite_and_display

        ; Display the explosion on the screen
        ; for 120 ms
        JSR     fn_wait_120ms

        ; Display a big explosion on the screen
        LDA     #$0D
        STA     var_repton_animation_state
        JSR     fn_lookup_repton_sprite_and_display

        ; Display the explosion on the screen
        ; for 120 ms
        JSR     fn_wait_120ms

        ; Display a medium explosion on the screen
        LDA     #$0E
        STA     var_repton_animation_state
        JSR     fn_lookup_repton_sprite_and_display

        ; Display the explosion on the screen
        ; for 120 ms
        JSR     fn_wait_120ms

        ; Display a small explosion on the screen
        LDA     #$0F
        STA     var_repton_animation_state
        JSR     fn_lookup_repton_sprite_and_display

        ; Display the explosion on the screen
        ; for 120 ms
        JSR     fn_wait_120ms

        LDA     zp_visible_screen_top_left_xpos
        CLC
        ADC     #$0E
        TAX
        LDA     zp_visible_screen_top_left_ypos

        CLC
        ADC     #$0E
        TAY
        LDA     #$00
        JSR     L1A1C

        ; Display the blank screen for 4 * 120ms
        ; Just under half a second  (480ms)
        JSR     fn_wait_120ms
        JSR     fn_wait_120ms
        JSR     fn_wait_120ms
        JSR     fn_wait_120ms

        ; Reset the stack pointer
        LDX     #$FF
        TXS

        LDA     #$1F
        JSR     L121E

        LDY     #$02
        JSR     L105A

        NOP
        JSR     L16E2

        LDA     #$0F
        ; Reduce the number of lives the player
        ; has by one
        DEC     var_lives_left

        ; If the player has run out of lives
        ; (value is negative) then reset the
        ; game
        BMI     L1788

        ; Reset the game
        JMP     fn_reset_and_show_start_screen

;L1788
.player_out_of_lives
        ; Player has exhausted all my lives
        ; Did they achieve a high score?
        JSR     fn_check_and_update_high_score

        JMP     L0FC7

;...
        LDX     #$1E
.L1790
        JSR     fn_wait_for_vertical_sync

        DEX
        BNE     L1790

        JMP     L1FF0

;L1799
.fn_write_r_to_restart
        ; Set the cursor position to (2,31)
        LDY     #$1F
        LDX     #$02

        ;-----------------------------------
        ; Press R to restart
        ;-----------------------------------
        ; Next string to write to the screen is 
        ; stored at $2CD4                
        LDA     #LO(text_r_to_restart)
        STA     zp_object_or_string_address_lsb
        LDA     #HI(text_r_to_restart)
        STA     zp_object_or_string_address_msb

        ; Write the string
        JSR     fn_write_string_to_screen

;L17A8
.fn_set_press_escape_lsb
        ; Set the LSB for the "Press escape to
        ; kill yourself" string
        LDA     #LO(text_press_escape)
        STA     zp_object_or_string_address_lsb
        RTS

        ; Spare bytes
        NOP
        NOP

        ; Check to see if the high score needs
        ; to be updated with the player's score
        JSR     fn_check_and_update_high_score

        ; Reset the palette, music sequence and vsync
        JMP     fn_reset_palette_music_and_vsync

        ; Junk Bytes - 2 
        NOP 
        NOP

;L17AF
.fn_update_high_score_reset_music
        JSR     fn_check_and_update_high_score

        JMP     fn_reset_palette_music_and_vsync

;17B5
.fn_display_repton_start_screen
        JSR     fn_update_high_score_reset_music

        ; Set the colour mask to show black and
        ; red only 
        LDA     #$0F
        STA     zp_screen_colour_mask

        ; Set the ypos to 1
        LDA     #$01
        STA     zp_password_cursor_ypos

        ; Set the byte counter for the loading 
        ; and displaying the repton logo to zero 
        LDA     #$00
        STA     zp_screen_write_total_byte_counter
;17C4
.loop_get_next_repton_logo_byte
        ; Get the current byte / tile and 
        ; write it to the screen
        LDY     zp_screen_write_total_byte_counter
        LDA     data_repton_logo,Y
        JSR     fn_print_character_and_increment_xpos

        ; Increment the total byte counter and check
        ; to see if all of the logo has been copied
        ; to the screen
        INC     zp_screen_write_total_byte_counter
        LDA     zp_screen_write_total_byte_counter
        ; 192 bytes
        CMP     #$C0
        BNE     loop_get_next_repton_logo_byte

        ;-----------------------------------
        ; By, Superior Software
        ;-----------------------------------
        ; First string to write to the screen is
        ; stored at $0EE3 and is
        ; "By, Superior Software"
        ; Set the LSB to the string
        LDA     #LO(text_by_superior_software)
        STA     zp_object_or_string_address_lsb

        ; Set the cursor poxition to (5,8)
        ; to position it below the repton logo
        LDX     #$05
        LDY     #$08

        ; Set the MSB to the string
        LDA     #HI(text_by_superior_software)
        STA     zp_object_or_string_address_msb

        ; Write the string
        JSR     fn_write_string_to_screen

        ;-----------------------------------
        ; Score :
        ;-----------------------------------
        ; Next string to write to the screen is 
        ; stored at $0EF9
        ; Set the LSB to the string
        LDA     #LO(text_score)
        STA     zp_object_or_string_address_lsb

        ; Set the cursor poxition to (11,10)
        LDX     #$0B
        LDY     #$0A
        ; Set the MSB to the string
        LDA     #HI(text_score)
        STA     zp_object_or_string_address_msb

        ; Write the string
        JSR     fn_write_string_to_screen

        ; Next string to write to the screen is 
        ; stored at $0F02 and is "Hi-Score :"
        ; Set the LSB to the string
        LDA     #LO(text_hi_score)
        STA     zp_object_or_string_address_lsb

        ; Set the cursor position to (8,12)
        LDX     #$08
        LDY     #$0C

        ; Set the MSB to the string
        LDA     #HI(text_hi_score)
        STA     zp_object_or_string_address_msb
        JSR     fn_write_string_to_screen

        ;-----------------------------------
        ; Time :
        ;-----------------------------------
        ; Next string to write to the screen is 
        ; stored at $0F0D and is "Time :"
        ; Set the LSB to the string
        LDA     #LO(text_time)
        STA     zp_object_or_string_address_lsb

        ; Set the cursor position to (12,14)
        LDX     #$0C
        LDY     #$0E
        
        ; Set the MSB to the string
        LDA     #HI(text_time)
        STA     zp_object_or_string_address_msb

        ; Write the string
        JSR     fn_write_string_to_screen

        ;-----------------------------------
        ; Lives :
        ;-----------------------------------
        ; Next string to write to the screen is 
        ; stored at $0F14
        ; Set the LSB to the string
        LDA     #LO(text_lives)
        STA     zp_object_or_string_address_lsb

        ; Set the cursor position to (11,16)
        LDX     #$0B
        LDY     #$10

        ; Set the MSB to the string
        LDA     #HI(text_lives)
        STA     zp_object_or_string_address_msb

        ; Write the string
        JSR     fn_write_string_to_screen

        ; Next string to write to the screen is 
        ; stored at $0F1C and is "Diamonds :"
        ; Set the LSB to the string
        LDA     #LO(text_diamonds)
        STA     zp_object_or_string_address_lsb

        ; Set the cursor position to (8,18)
        LDX     #$08
        LDY     #$12

        ; Set the MSB to the string
        LDA     #HI(text_diamonds)
        STA     zp_object_or_string_address_msb

        ; Write the string
        JSR     fn_write_string_to_screen

        ;-----------------------------------
        ; Screen :
        ;-----------------------------------        
        ; Next string to write to the screen is 
        ; stored at $0F27 
        ; Set the LSB to the string
        LDA     #LO(text_screen)
        STA     zp_object_or_string_address_lsb

        ; Set the cursor position to (10,20)
        LDX     #$0A
        LDY     #$14
        
        ; Set the MSB to the string
        LDA     #HI(text_screen)
        STA     zp_object_or_string_address_msb

        ; Write the string
        JSR     fn_write_string_to_screen

        ;-----------------------------------
        ; Sound :
        ;-----------------------------------        
        ; Next string to write to the screen is 
        ; stored at $0F3F 
        ; Set the LSB to the string
        LDA     #LO(text_sound)
        STA     zp_object_or_string_address_lsb

        ; Set the cursor position to (11,22)
        LDX     #$0B
        LDY     #$16

        ; Set the MSB of the string
        LDA     #HI(text_sound)
        STA     zp_object_or_string_address_msb

        ; Write the "Sound :", "Music :" and 
        ; "Password :" strings to the screen
        ; Guessing Music and Password were a late
        ; addition and it couldn't be shoehorned in 
        ; here!
        JSR     fn_write_sound_music_password_to_screen

        JSR     fn_display_p_or_r_option

        ;-----------------------------------
        ; Press ESCAPE to kill yourself
        ;-----------------------------------
        ; Next string to write to the screen is 
        ; stored at $0F54
        ; zp_string_to_display is set to 54 in the above?         
        NOP
        ; Set the cursor position to (2,28)
        LDX     #$02
        LDY     #$1C

        ; Set the MSB of the string
        ; No TODO LSB set?!!? SET BREAKPOINT
        LDA     #HI(text_press_return)
        STA     zp_object_or_string_address_msb
        JSR     fn_write_string_to_screen

        ;-----------------------------------
        ; Press RETURN to get back here
        ;-----------------------------------
        ; Next string to write to the screen is 
        ; stored at $0F75
        ; Set the LSB to the string
        LDA     #LO(text_press_return)
        STA     zp_object_or_string_address_lsb

        ; Set the cursor position to (2,20)
        LDX     #$02
        LDY     #$1D
.L1863
        ; Set the MSB of the string
        LDA     #HI(text_press_return)
        STA     zp_object_or_string_address_msb

        ; Write the string
        JSR     fn_write_string_to_screen

        ;-----------------------------------
        ; Press SPACE to play game
        ;-----------------------------------
        ; Next string to write to the screen is 
        ; stored at $0F96
        ; Set the LSB to the string
        LDA     #LO(text_press_space)
        STA     zp_object_or_string_address_lsb
        
        ; Set the cursor position to (2,21)
        LDX     #$02
        LDY     #$1E

        ; Set the MSB to the string
        LDA     #HI(text_press_space)
        STA     zp_object_or_string_address_msb

        ; Write the string
        JSR     fn_write_string_to_screen

        ;-----------------------------------
        ; <player score>
        ;-----------------------------------
        LDA     var_score_msb 
        STA     zp_display_value_msb
        LDA     var_score_mlsb 
        STA     zp_display_value_mlsb
        LDA     var_score_lsb 
        STA     zp_display_value_lsb

        ; Set the cursor position to (19,10)
        ; to position it at after "Score : "
        LDX     #$13
        LDY     #$0A
        JSR     fn_write_3_byte_display_value_to_screen

        ;-----------------------------------
        ; <high score>
        ;-----------------------------------
        LDA     var_high_score_msb
        STA     zp_display_value_msb
        LDA     var_high_score_mlsb
        STA     zp_display_value_lmsb
        LDA     var_high_score_lsb
        STA     zp_display_value_lsb

        ; Set the cursor position to (19,12)
        ; to position it at after "Hi-score : "
        LDX     #$13
        LDY     #$0C
        
        ; Write the high score to the screen
        JSR     fn_write_3_byte_display_value_to_screen

        ;-----------------------------------
        ; <remaining time>
        ;-----------------------------------
        LDA     #$00
        STA     zp_display_value_msb
        LDA     var_remaining_time_msb
        STA     zp_display_value_mlsb
        LDA     var_remaining_time_lsb
        STA     zp_display_value_lsb

        ; Set the cursor position to (19,14)
        ; to position it at after "Time : "
        LDX     #$13
        LDY     #$0E
        ; Write the remaining time to the screen
        JSR     fn_write_3_byte_display_value_to_screen


        ;-----------------------------------
        ; <lives>
        ;-----------------------------------
        LDA     #$00
        STA     zp_display_value_msb
        LDA     #$00
        STA     zp_display_value_lmsb

        ; Get the number of lives left and add one
        ; as in memory it's zero based (0 is one life left)
        JSR     fn_add_one_to_lives_left_for_display
        STA     zp_display_value_lsb

        ; Set the cursor position to (19,16)
        ; to position it at after "Lives : "
        LDX     #$13
        LDY     #$10
        JSR     fn_write_3_byte_display_value_to_screenfn_write_3_byte_display_value_to_screen

        ; Set the cursor poxition to (19,18)
        ; to position it at after "Diamonds : "
        LDA     #$13
        STA     zp_password_cursor_xpos
        LDA     #$12
        STA     zp_password_cursor_ypos

        ; If there are 10 or more diamonds left
        ; then write "Plenty!" to the screen,
        ; otherwise write the single digit number
        LDA     var_number_diamonds_left
        CMP     #$0A
        BCS     fn_write_plenty_to_screen

        ORA     #$30
        JSR     fn_print_character_to_screen

        JMP     write_screen_letter_to_screen

;L18E5
.fn_write_plenty_to_screen
        ; Write "Plenty!" as the numbe of diamonds
        ; "P"
        LDA     #$50
        JSR     fn_print_character_to_screen
        ; "l"
        LDA     #$6C
        JSR     fn_print_character_to_screen
        ; "e"
        LDA     #$65
        JSR     fn_print_character_to_screen
        ; "n"
        LDA     #$6E
        JSR     fn_print_character_to_screen
        ; "t"
        LDA     #$74
        JSR     fn_print_character_to_screen
        ; "y"
        LDA     #$79
        JSR     fn_print_character_to_screen
        ; "!"
        LDA     #$21
        JSR     fn_print_character_to_screen
;1908
.write_screen_letter_to_screen
        ; Set the cursor poxition to (19,20)
        ; to position it at after "Screen : "
        LDA     #$13
        STA     zp_password_cursor_xpos
        LDA     #$14
        STA     zp_password_cursor_ypos

        ; Get the screen number (0 to 11)
        ; And translate to A-L but adding
        ; to ASCII A ($41)
        LDA     var_screen_number
        CLC
        ADC     #$41
        JSR     fn_print_character_to_screen

;L1919
.write_sound_status_to_screen
        ; Set the cursor poxition to (19,22)
        ; to position it at after "Sound : "
        LDA     #$13
        STA     zp_password_cursor_xpos
        LDA     #$16
        STA     zp_password_cursor_ypos
        ; Check to see if the sound is on or off
        ; If off branch ahead
        LDA     var_sound_status
        BEQ     write_sound_off_to_screen

        ; Sound is on so write "On " to the screen
        "O"
        LDA     #$4F
        JSR     fn_print_character_to_screen
        "n"
        LDA     #$6E
        JSR     fn_print_character_to_screen
        " "
        LDA     #$20
        JSR     fn_print_character_to_screen

        JMP     L1947   

;1938
.write_sound_off_to_screen
        ; Sound is off so write "Off" to the screen
        "O"
        LDA     #$4F
        JSR     fn_print_character_to_screen
        "f"
        LDA     #$66
        JSR     fn_print_character_to_screen
        "f"
        LDA     #$66
        JSR     fn_print_character_to_screen

;L1947
.after_sound_status
        JSR     fn_write_music_status_and_pwd_to_screen

        JSR     L25F9

        ; Check to see if the player has 
        ; pressed the space bar to start or return
        ; to a game
        ; INKEY $9D is SPACE
        LDA     #$9D
        JSR     fn_read_key

        ; If pressed go to the end if space was pressed
        BNE     L195A

        ; Check to see if the escape key was pressed
        ; and 
        JSR     fn_check_escape_key

        JMP     write_sound_status_to_screen

.L195A
        JMP     L2625

;L195D
.fn_add_to_score 
        ; Add whatever is in A to the score
        ; 
        ; Put the processor into Binary Coded Decimal (BCD)
        ; mode - this means each nibble in a byte counts 0-9 
        ; by the 6502 processor so each score byte looks 
        ; like a decimal number (because it is)
        SED

        ; Clear the carry flag
        CLC

        ; Add the value in A to the score and add the carry
        ; to the more significant bytes
        ADC     var_score_lsb
        STA     var_score_lsb
        LDA     var_score_mlsb
        ADC     #$00
        STA     var_score_mlsb
        LDA     var_score_msb
        ADC     #$00
        STA     var_score_msb

        ; Clear BCD mode - back to Hex
        CLD
        RTS

.L1977
        ; Set the location to the middle of the screen
        ; As it's Repton's position (14,14)
        LDX     #$0E
        LDY     #$0E
        JSR     fn_calc_screen_address_from_x_y_pos

        ; Store the screen address where Repton should
        ; be drawn
        ; TODO resolvename of load vs screen in this fn
        STX     zp_tile_load_address_lsb
        STY     zp_tile_load_address_msb

        ; Repton is made of four body parts (see above)
        LDA     #$04
        STA     zp_sprite_parts_to_copy_or_blank
;L1986
.loop_blank_next_tile_byte
        ; Y is used to copy all the horizontal
        ; columns for the sprite in particular part
        LDY     #$00

        ; X is used to copy all four sprite parts
        ; Head, torso, legs, feet        
        LDX     #$00

;L198A
.loop_blank_next_tile_byte
        ; Blank a byte of data on the screen
        LDA     #$00
        STA     (zp_tile_load_address_lsb),Y

        ; Each tile is 8 bytes high so blank them all
        INY
        TYA
        AND     #$07
        BNE     loop_blank_next_tile_byte

        ; Incrememt the screen write address
        ; by 8 bytes
        TYA
        CLC
        ADC     zp_tile_load_address_lsb

        ; Add the carry to the MSB (if any)
        LDA     #$00
        ADC     zp_tile_load_address_msb

        ; Check still less than $8000
        ; if it is then branch
        BPL     skip_memory_subtraction_for_blank

        ; Subtract $2000 from the screen address
        ; to wrap around to the start of screen memory
        LDA     zp_tile_load_address_msb
        SEC
        SBC     #$20
        STA     zp_tile_load_address_msb
;L19A5
.skip_memory_subtraction_for_blank
        ; Check if 4 columns of 8 bytes have been blanked
        ; this represents a complete body part or sprite part
        ;  e.g. head or feet or part of a diamond
        ; if not, loop back
        INX
        CPX     #$04
        BNE     loop_blank_next_tile_byte

        ; Increment to the next screen write address byte
        INC     zp_tile_load_address_msb
        LDA     zp_tile_load_address_msb
        BPL     skip_memory_subtraction_for_blank_2

        ; Subtract $2000 from the screen address
        ; to wrap around to the start of screen memory
        SEC
        SBC     #$20
        STA     zp_tile_load_address_msb
.L19B5
.skip_memory_subtraction_for_blank_2
        DEC     zp_sprite_parts_to_copy_or_blank
        BNE     loop_blank_next_tile_byte

        RTS

;...
;L19BA
.fn_lookup_repton_sprite_and_display
        ; Get the start address of the current Repton
        ; animation sprite
        ; $00 - Repton Left hand up
        ; $01 - Repton Right hand up
        ; $02 - Repton Moving right, right hand forward
        ; $03 - Repton Moving right, right hand slightly forward
        ; $04 - Repton Moving right, right hand slightly back
        ; $05 - Repton Moving right, right hand back
        ; $06 - Repton Moving left,  left hand back
        ; $07 - Repton Moving left,  left hand slightly back
        ; $08 - Repton Moving left,  left hand slightly forward
        ; $09 - Repton Moving left,  left hand forward
        ; $0A - Repton Standing
        ; $0B - Repton Standing looking right
        ; $0C - Repton Standing looking left
        ; $0D - Big explosion 
        ; $0E - Medium explosion
        ; $0F - Small explosion
        LDX     var_repton_animation_state
        LDA     data_repton_pose_lookup_table_lsb,X
        STA     zp_screen_write_address_lsb
        LDA     data_repton_pose_lookup_table_msb,X
        STA     zp_screen_write_address_msb
        JMP     fn_display_sprite

;L19CA
.fn_display_sprite
        ; Each sprite is 4 bytes wide and 32 bytes high
        ; 4 * 32 = 128 bytes
        ; 
        ; (lookup address) is stored in zp_screen_write_address_lsb/msb
        ;
        ; Each sprite is split into four vertical parts:
        ; - Head
        ; - Torso
        ; - Legs
        ; - Feet
        ;
        ; Each part is 4 columns of 8 bytes = 32 bytes
        ;
        ; - Head   bytes are at (lookup address)
        ; - Torso  bytes are at (lookup address) + (1 x &140)
        ; - Legs   bytes are at (lookup address) + (2 x &140)
        ; - Feet   bytes are at (lookup address) + (3 x &140)
        ;
        ; Normally in Mode 5 each row is &140 bytes long and the 
        ; sprites were saved in that format

        ; Set the location to the middle of the screen
        ; As it's Repton's position (14,14)
        LDX     #$0E
        LDY     #$0E
        JSR     fn_calc_screen_address_from_x_y_pos

        ; Store the screen address where Repton should
        ; be drawn
        ; TODO resolvename of load vs screen in this fn
        STX     zp_tile_load_address_lsb
        STY     zp_tile_load_address_msb

        ; Repton is made of four body parts (see above)
        LDA     #$04
        STA     zp_sprite_parts_to_copy_or_blank
;L19D9
.copy_4_same_row_tiles_to_screen
        ; Y is used to copy all the horizontal
        ; columns for the sprite in particular part
        LDY     #$00

        ; X is used to copy all four sprite parts
        ; Head, torso, legs, feet
        LDX     #$00
;L19DD
        ; Copy 8 bytes
.loop_copy_next_tile_byte
        ; Copy a byte of data to the screen
        LDA     (zp_screen_write_address_lsb),Y
        STA     (zp_tile_load_address_lsb),Y

        ; Each tile is 8 bytes high so copy them all
        INY
        TYA
        AND     #$07
        BNE     loop_copy_next_tile_byte

        ; Incrememt the screen write address
        ; by 8 bytes
        TYA
        CLC
        ADC     zp_tile_load_address_lsb

        ; Add the carry to the MSB (if any)
        LDA     #$00
        ADC     zp_tile_load_address_msb

        ; Check still less than $8000
        ; if it is then branch
        BPL     skip_memory_subtraction

        ; Subtract $2000 from the screen address
        ; to wrap around to the start of screen memory
        LDA     zp_tile_load_address_msb
        SEC
        SBC     #$20
        STA     zp_tile_load_address_msb
;L19F8
.skip_memory_subtraction
        ; Check if 4 columns of 8 bytes have been copied
        ; this represents a complete body part or sprite part
        ;  e.g. head or feet or part of a diamond
        ; if not, loop back
        INX
        CPX     #$04
        BNE     loop_copy_next_tile_byte

        ; Next body part is $140 higher in memory
        ; so add this t the current read memory location
        ; this represents a complete body part or sprite part
        ;  e.g. head or feet or part of a diamond
        ; + $0140 bytes
        LDA     zp_screen_write_address_lsb
        CLC
        ADC     #$40
        STA     zp_screen_write_address_lsb
        LDA     zp_screen_write_address_msb
        ADC     #$01
        STA     zp_screen_write_address_msb

        ; Increment to the next screen write address byte
        INC     zp_tile_load_address_msb
        LDA     zp_tile_load_address_msb
        BPL     skip_memory_subtraction_2

        ; Subtract $2000 from the screen address
        ; to wrap around to the start of screen memory
        SEC
        SBC     #$20
        STA     zp_tile_load_address_msb
;L1A15
.skip_memory_subtraction_2
        ; Any remaining sprite parts? If so loop back
        DEC     zp_sprite_parts_to_copy_or_blank
        BNE     copy_4_same_row_tiles_to_screen

        RTS        


.L1A1A
        PLA
        RTS

.L1A1C
        ; A= $00, X=$14 Y=$04
        ; Called just after you die
        ; 8C / 8D seem to be set to either $00 or $02
        ; 8C / 8D set to $06 and $F6
        ; Called with either A=$00 or A=$FF
        ; Cache A
        PHA
        TXA
        SEC
        ; $14 - $06
        ; A=$0E
        SBC     zp_visible_screen_top_left_xpos

        CLC
        ADC     #$04
        ; X = $12
        TAX

        ; Y=$04 - $F6 + $04 = $0E
        TYA
        SEC
        SBC     zp_visible_screen_top_left_ypos
        CLC
        ADC     #$04
        TAY

        ; Check not greater than $24 / 36
        CPX     #$24
        BCS     L1A1A

        ; Check not greater than $24 / 36
        CPY     #$24
        BCS     L1A1A

        ; Check not zero
        CPX     #$00
        BEQ     L1A1A

        ; Check not zero
        CPY     #$00
        BEQ     L1A1A

        LDA     #$04
        STA     zp_sprite_parts_to_copy_or_blank
        STA     L0005

        Check X < $21 / 33 branch if less than
        CPX     #$21
        BCC     L1A50

        ; If X >= $21 and X < $24
        STX     zp_tile_load_address_lsb
        LDA     #$24
        SEC
        SBC     zp_tile_load_address_lsb
        STA     zp_sprite_parts_to_copy_or_blank
.L1A50

        ; If Y >= $21 and Y < $24
        CPY     #$21
        BCC     L1A5D

        STY     zp_tile_load_address_msb
        LDA     #$24
        SEC
        SBC     zp_tile_load_address_msb
        STA     L0005
.L1A5D
        ; If X > $04
        CPX     #$04
        BCS     L1A79

        TXA
        STA     zp_sprite_parts_to_copy_or_blank
        EOR     #$03
        CLC
        ADC     #$01
        ASL     A
        ASL     A
        ASL     A
        CLC
        ADC     zp_screen_write_address_lsb
        STA     zp_screen_write_address_lsb
        LDA     zp_screen_write_address_msb
        ADC     #$00
        STA     zp_screen_write_address_msb
        LDX     #$04
.L1A79
        ; If Y > $04
        CPY     #$04
        BCS     L1A90

        STY     L0005
        LDA     L0E3E,Y
        CLC
        ADC     zp_screen_write_address_lsb
        STA     zp_screen_write_address_lsb
        LDA     L0E42,Y
        ADC     zp_screen_write_address_msb
        STA     zp_screen_write_address_msb
        LDY     #$04
.L1A90
        DEX
        DEX
        DEX
        DEX
        DEY
        DEY
        DEY
        DEY

        ; Blanks a 4x4 tile
        ; X and Y are the (x,y) pos?
        JSR     fn_calc_screen_address_from_x_y_pos

        STX     zp_tile_load_address_lsb
        STY     zp_tile_load_address_msb
        PLA
        BEQ     L1AE9

        LDA     L0005
        STA     L0007
.L1AA6
        LDA     zp_sprite_parts_to_copy_or_blank
        STA     zp_tile_x_pos_cache
        LDY     #$00
.L1AAC
        LDA     (zp_screen_write_address_lsb),Y
        STA     (zp_tile_load_address_lsb),Y
        INY
        TYA
        AND     #$07
        BNE     L1AAC

        CLC
        TYA
        ADC     zp_tile_load_address_lsb
        LDA     #$00
        ADC     zp_tile_load_address_msb
        BPL     L1AC7

        LDA     zp_tile_load_address_msb
        SEC
        SBC     #$20
        STA     zp_tile_load_address_msb
.L1AC7
        DEC     zp_tile_x_pos_cache
        BNE     L1AAC

        LDA     zp_screen_write_address_lsb
        CLC
        ADC     #$40
        STA     zp_screen_write_address_lsb
        LDA     zp_screen_write_address_msb
        ADC     #$01
        STA     zp_screen_write_address_msb
        CLC
        INC     zp_tile_load_address_msb
        LDA     zp_tile_load_address_msb
        BPL     L1AE4

        SEC
        SBC     #$20
        STA     zp_tile_load_address_msb
.L1AE4
        DEC     L0007
        BNE     L1AA6

        RTS        
;...

;L1B4B
.use_default_off_screen_tile
        ; Default tile to use for off 
        ; game screen areas ($15/20)
        LDA     #$15
        RTS

;1B4E
.fn_lookup_screen_tile_for_xpos_ypos
        ; This is called with an xpos and a ypos that
        ; can be between 0 and 255
        ;
        ; Anything greater than 127 is considered off map
        ; and the default brick tile is used 
        ;
        ; If it's a between 0 and 127 it needs to be 
        ; mapped to a map object on the 32 x 32 map
        ;
        ; This is achieved by dividing xpos and ypos by 4
        ; to move from 128 x 128 co-ordinats to 32x32
        ;
        ; This allows the map object to be looked up
        ;
        ; Current screen map is decompressed and cached 
        ; between $0400 - $07FF
        ;
        ; Each map can contain 32 x 32 objects
        ; 
        ; Map is serialised in memory e.g.
        ; (0,0) (0,1) (0,2) ... (0,31) (1,0) (1,1) ... (1,31)... (31,31)
        ;
        ; An object is e.g. a Diamond or Rock or Egg or Earth
        ;
        ; Each map object is 4 tiles wide 
        ; and 4 tiles high though when displayed 
        ;
        ; Note that Repton is also 4 tiles wide and 
        ; 4 tiles high (same as a map object)        
        ; 
        ; There is another lookup table that maps the object to 
        ; each of the tiles that should be shown on screen for it
        ;
        ; So tile map on screen  is 32 * 4 = 128 tiles wide
        ;                       and 32 * 4 = 128 tiles high
        ;
        ; Anything wider is "off" game screen
        ; so use a default tile (X or Y > 127)
        ; 
        ; This routine is called with
        ;
        ; On entry:
        ;       X - contains xpos (0-$FF)
        ;       Y - contains ypos (0-$FF)
        ; On exit:
        ;       A - contains tile code
        ;       X - contains xpos (0-$FF)
        ;       Y - contains ypos (0-$FF)       

        ; Cache the xpos and ypos as X and Y
        ; get used for during processing
        STX     zp_tile_x_pos_cache
        STY     zp_tile_y_pos_cache

        ; If X is > 126 ($7F) use the 
        ; default off-screen tile
        TXA
        BMI     use_default_off_screen_tile

        ; If Y is > 126 ($7F) use the 
        ; default off-screen tile
        TYA
        BMI     use_default_off_screen_tile

        ; ------------------------------------
        ; Calculation of map object lookup address
        ; based on (xpos, ypos)
        ; 
        ; Current map is stored as 32 x 32 = 1024 bytes
        ; From $0400 to $07FF
        ;
        ; xpos and ypos are 0-$FF though so need dividing by
        ; four as the "type" will be the same e.g. diamond
        ; or rock or earch
        ;
        ; Position in table (pos) = ((ypos / 4) * 32) + (xpos / 4)
        ; 
        ; Lookup address = pos + 1024 (or pos + $0400)

        ; Divide ypos by 4 because each tile/sprite 
        ; is 4 tiles wide so it'll be the same for
        ; each of those four e.g. diamond or rock
        ; or earth
        LSR     A
        LSR     A
        STA     zp_general_ypos_lookup_calcs

        ; Divide xpos by 4 because each tile/sprite 
        ; is 4 tiles high so it'll be the same for
        ; each of those four e.g. diamond or rock
        ; or earth
        TXA
        LSR     A
        LSR     A
        STA     zp_general_xpos_lookup_calcs


        LDA     #$00
        STA     zp_object_or_string_address_msb


        ; Each row is 32 characters wide so ypos
        ; must be multipled by 32 to get to the right
        ; row starting position
        LDA     zp_general_ypos_lookup_calcs
        ASL     A
        ASL     A
        ASL     A
        ASL     A
        ; Put any carry in to the MSB
        ROL     zp_object_or_string_address_msb
        ASL     A
        ROL     zp_object_or_string_address_msb

        ; Add on the (xpos / 4) calculated earlier
        ; so it's at the right offset in the table
        CLC
        ADC     zp_general_xpos_lookup_calcs

        ; Store the table position         
        STA     zp_object_or_string_address_lsb
        LDA     zp_object_or_string_address_msb
        
        ; Add $0400 as the table is stored at $0400-$04FF
        ; Tile can be retrieved from this address held in 
        ; LSB / MSB
        CLC
        ADC     #$04
        STA     zp_object_or_string_address_msb
        ; End map object lookup table calculation
        ; (object not looked up yet)
        ; ------------------------------------

        ; ------------------------------------
        ; Second calculation and lookup - for the
        ; current sprite, at the (xpos,ypos) what is 
        ; the tile part that should be shown
        ; 
        ; At this point, we can look up (sprite code) if it's a
        ; rock or diamond but also need to know which
        ; part as each sprite is 4x4 - this is done
        ; by ANDing with $03 to derrive a 0-3 value
        ; for the current sprite in both the x axis 
        ; and y axis. 
        ;
        ; Each sprite is stored at $4000 and is 
        ; a 4x4 of tiles as below:
        ;     0   1   2   3
        ;    --------------
        ; 0 | A   B   C   D
        ; 1 | E   F   G   H
        ; 2 | I   J   K   L
        ; 3 | M   N   O   P

        ; This is stored sequentially as the following
        ; in memory 
        ; A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,A1,B1....P1,A2...
        ;        
        ; Keep the bottom two bits only
        ; of the ypos - shows which part
        ; of the sprite needs to be displayed 
        ; vertically - (y part)
        TYA
        AND     #$03
        STA     zp_general_ypos_lookup_calcs

        ; Keep the bottom two bits only
        ; of the xpos - shows which part
        ; of the sprite needs to be displayed 
        ; horizontally (x part)
        TXA
        AND     #$03
        STA     zp_general_xpos_lookup_calcs

        ; Lookup the object at this (xpos,ypos) using
        ; the address calculated in the first calculation
        ; in this subroutine
        LDY     #$00
        LDA     (zp_object_or_string_address_lsb),Y

        ; Move the object to Y
        TAY

        ; Reset the MSB as another address calculation 
        ; is about to performed to be performed
        LDX     #$00
        STX     zp_object_or_string_address_msb

        ; Retrieve again the object at this (xpos, ypos)
        ; which was cached just earlier in Y
        TYA

        ; Location of tile = (object * 16) + (y part * 4) + (x part) + $4000

        ; Multiply the object by 16 
        ; (as each object is defined by 16 bytes
        ; to map it to the 4 tiles on each of its 
        ; four rows)
        ASL     A
        ASL     A
        ASL     A
        ASL     A
        ROL     zp_object_or_string_address_msb
        STA     zp_object_or_string_address_lsb

        ; Multiply the y part by 4 to get to the nth row of the sprite
        LDA     zp_general_ypos_lookup_calcs
        ASL     A
        ASL     A

        ; Add on the xpart to get to the right column
        CLC
        ADC     zp_object_or_string_address_lsb
        ADC     L0008
        STA     zp_object_or_string_address_lsb
        LDA     zp_object_or_string_address_msb

        ; Add $4000 which is the starting point for the sprites
        ORA     #$40
        STA     zp_object_or_string_address_msb
        ; ------------------------------------

        ; Reloaad the xpos
        LDX     zp_tile_x_pos_cache

        ; Reset Y and load the sprite part tile
        LDY     #$00
        LDA     (zp_object_or_string_address_lsb),Y

        ; PHA/PLA seem redundant?
        PHA
        ; Reload the ypos
        LDY     zp_tile_y_pos_cache
        PLA

        ; A contains the sprite tile part for the
        ; current (xpos,ypos)
        RTS
;...
;L1BB4
.set_default_off_screen_object
        ; Set the string to display to $E0E0 (garbage)
        ; if beyond the end of a row or beyond
        ; the last row on the screen
        LDA     #$E0
        STA     zp_object_or_string_address_lsb
        STA     zp_object_or_string_address_msb
        LDA     #$16
        RTS


;L1BBD
.fn_lookup_screen_object_for_x_y
        ; Looks up object using (x,y) not (xpos,ypos)
        ; i.e. 32 x 32 co-ordinates
        ; Cache the x and y as the code
        ; uses the X and Y registers
        STX     zp_tile_x_pos_cache
        STY     zp_tile_y_pos_cache

        ; Check the end ofthe row hasn't been reach
        ; it's 32 characters wide then abort
        CPX     #$20
        BCS     set_default_off_screen_object

        ; Check the bottom of the screen hasn't been reached
        ; it's 32 characters wide then abort
        CPY     #$20
        BCS     set_default_off_screen_object

        LDA     #$00
        STA     zp_object_or_string_address_msb
        ; Calculate the tile cache for (xpos,ypos)
        ; Screen map tiles cached at $0400
        ;
        ; Address of tile = X + (Y*32) + 1024
        ; or in hex
        ; Address of tile = X + (Y*$20) + $0400
        ; 
        ; Note that the code ORs $04 with the MSB
        ; to add it on but same effect

        ; Multiply Y by 32s and roll any carry
        ; into the MSB
        TYA
        ASL     A
        ASL     A
        ASL     A
        ASL     A
        ROL     zp_object_or_string_address_msb
        ASL     A
        ROL     zp_object_or_string_address_msb

        ; Add X to the LSB (will never carry)
        ORA     zp_tile_x_pos_cache
        STA     zp_object_or_string_address_lsb

        ; Add $0400 to the address by adding
        ; $04 to the MSB
        LDA     zp_object_or_string_address_msb
        ORA     #$04
        STA     zp_object_or_string_address_msb

        ; Load the object for this (x,y) from
        ; the current screen cache that starts at $0400
        LDY     #$00
        LDA     (zp_object_or_string_address_msb),Y

        ; Reset the X and Y registers 
        ; NOTE pushing then pulling A onto the
        ; stack is redundant as LDX/LDY doesn't
        ; change A
        PHA
        LDX     zp_tile_x_pos_cache
        LDY     zp_tile_y_pos_cache
        PLA
        RTS

;L1BEC
.end_display_tile
        ; Reload the current tile from the stack
        ; Actually just clears the value from the stack
        PLA
        RTS

.L1BEE
        STX     zp_screen_write_address_lsb
        AND     #$1F
        TAX
        LDA     L0EBF,X
        LDX     zp_screen_write_address_lsb
        JMP     fn_display_tile

;L1BFB
.fn_display_tile
        ; Preserve A - on entry it contains the 
        ; tile to write to the screen
        PHA
        TXA

        ; 
        SEC
        SBC     zp_visible_screen_top_left_xpos
        TAX
        
        ; If the xpos is beyond the end of the row
        ; then don't do anything
        CPX     #$20
        BCS     end_display_tile

        TYA
        SEC
        SBC     zp_visible_screen_top_left_ypos
        TAY
        ; If the ypos is beyond the end of the row
        ; then don't do anything        
        CPY     #$20
        BCS     end_display_tile

        ; Calculate the screen address from the x position
        ; and y position (which are up to 32 x 32 in value)
        JSR     fn_calc_screen_address_from_x_y_pos

        ; Store the calculated screen address
        STX     zp_screen_write_address_lsb
        STY     zp_screen_write_address_msb

        ; Redundant?
        PLA
        PHA

        ; Rest the MSB of tile load address
        LDA     #$00
        STA     zp_tile_load_address_msb

        ; Retrieve the tile to write to the screen
        PLA

        ; Calculate tile load address
        ; Tile load address = (tile number * 8) + $2FC0        
        ASL     A
        ROL     zp_tile_load_address_msb
        ASL     A
        ROL     zp_tile_load_address_msb
        ASL     A
        ROL     zp_tile_load_address_msb
        CLC
        ADC     #LO(data_tiles)
        STA     zp_tile_load_address_lsb
        LDA     zp_tile_load_address_msb
        ADC     #HI(data_tiles)
        STA     zp_tile_load_address_msb

        ; Copy the tile to the screen (each tile is 8 bytes)
        LDY     #$07
;L1C32
.loop_copy_tile
        ; Copy the tile to the screen
        ; Each tile is 8 bytes so loop to copy 
        ; them all
        LDA     (zp_tile_load_address_lsb),Y
        STA     (zp_screen_write_address_lsb),Y
        DEY
        ; If still more to copy then loop
        BPL     loop_copy_mini_map_tile

        RTS        

;L1C3A
.fn_write_tile_to_screen
{
        ; Preserve A - on entry it contains the 
        ; tile to write to the screen
        PHA
        ; Calculate the screen address from the x position
        ; and y position (which are up to 32 x 32 in value)
        LDX     zp_password_cursor_xpos
        LDY     zp_password_cursor_ypos
        JSR     fn_calc_screen_address_from_x_y_pos

        ; Store the calculated screen address
        STX     zp_screen_write_address_lsb
        STY     zp_screen_write_address_msb

        ; Rest the MSB of tile load address
        LDA     #$00
        STA     zp_tile_load_address_msb

        ; Retrieve the tile to write to the screen
        PLA

        ; Calculate tile load address
        ; Tile load address = (tile number * 8) + $2FC0
        ASL     A
        ROL     zp_tile_load_address_msb
        ASL     A
        ROL     zp_tile_load_address_msb
        ASL     A
        ROL     zp_tile_load_address_msb
        CLC
        ADC     #LO(data_tiles)
        STA     zp_tile_load_address_lsb
        LDA     zp_tile_load_address_msb
        ADC     #HI(data_tiles)
        STA     zp_tile_load_address_msb

        ; Copy the tile to the screen (each tile is 8 bytes)
        LDY     #$07
;L1C61
.loop_get_next_tile_byte
        ; Get the yth byte of the tile
        LDA     (zp_tile_load_address_lsb),Y
        ; Mask out the colour - values are either $00, $0F, $F0 or $FF
        ; In mode 5, the screen is 2 bits per pixel
        ; with the bits in the same position in the 
        ; top and bottom nibble
        ; e.g. 01[0]1 00[0]1 where the [] represents the same pixel
        ; Masking uses both bits ($FF), just the lower bits ($0F)
        ; or just the higher bits ($F0) to choose the colour
        AND     zp_screen_colour_mask
        ; Write it to the screen
        STA     (zp_screen_write_address_lsb),Y
        DEY
        ; If less than 8 bytes copied, then loop again
        BPL     loop_get_next_tile_byte

        RTS
}
;...

.L1E4C
        STX     zp_screen_password_lookup_lsb
        STY     zp_screen_password_lookup_msb
        LSR     zp_screen_password_lookup_msb
        ROR     zp_screen_password_lookup_lsb
        LSR     zp_screen_password_lookup_msb
        ROR     zp_screen_password_lookup_lsb
        LSR     zp_screen_password_lookup_msb
        ROR     zp_screen_password_lookup_lsb
        LDA     zp_screen_password_lookup_msb
        CLC
        ADC     #$42
        STA     zp_screen_password_lookup_msb
        LDY     #$00
        TXA
        AND     #$07
        TAX
        LDA     L0E36,X
        AND     (zp_screen_password_lookup_lsb),Y

        ; If the value is zero then return zero
        CMP     #$00
        BEQ     L1E74

        ; Otherwise return $FF
        LDA     #$FF
.L1E74
        RTS

.L1E75
        ; Reset the password lookup index now we 
        ; have the password matched to a screen
        ; 72
        STX     zp_screen_password_lookup_index
        STY     L0073
        STX     L0074
        STY     L0075

        LDA     #$00
        STA     L0076
        ; 72
        ASL     zp_screen_password_lookup_index
        ROL     L0073
        ; 72
        ASL     zp_screen_password_lookup_index
        ROL     L0073
        CLC
        ; 72
        LDA     zp_screen_password_lookup_index
        ADC     L0074
        ; 72
        STA     zp_screen_password_lookup_index
        LDA     L0073
        ADC     L0075
        STA     L0073
.L1E96
        JSR     L1EAE

        JSR     L1EAE

        JSR     L1EAE

        JSR     L1EAE

        JSR     L1EAE

        LSR     L0076
        LSR     L0076
        LSR     L0076
        LDA     L0076
        RTS

.L1EAE
        LDX     zp_screen_password_lookup_index
        LDY     L0073
        JSR     L1E4C

        ASL     A
        ROR     L0076
        INC     zp_screen_password_lookup_index
        BNE     L1EBE

        INC     L0073
.L1EBE
        RTS
;...
;1EBF
.fn_reset_game
        ; Reset the screen number if negative
        ; otherwise load the current screen into A
        JSR     fn_reset_start_and_started_on_screen

        ; A at this point will contain the current screen
        ; Multiply by the level by 4
        ASL     A
        ASL     A

        ; Store in 78   
        STA     L0078

        ; Reset 77 80 and the number of 
        ; diamonds left
        LDA     #$00
        STA     L0077
        STA     ; Clear the current map cache location
        STA     var_number_diamonds_left

        ; Dunno, some counter... that goes from 4 to 8
        LDA     #$04
        STA     zp_current_map_cache_msb
.L1ED3
        ; Decode the compressed map at this (xpos,ypos)
        LDX     L0077
        LDY     L0078
        JSR     L1E75

        ; Set the current screen map cache (0400-07FF)
        ; to tbe the looked up object
        LDY     #$00
        STA     (zp_current_map_cache_lsb),Y

        ; If the current object is a Diamond ($1E)
        ; increment the number of diamonds to collect
        CMP     #$1E
        BNE     check_if_object_is_a_safe

        ; It's a diamond so increment
        INC     var_number_diamonds_left
;L1EE5
.check_if_object_is_a_safe
        ; If the current object is a Safe ($17)
        ; increment the number of diamonds to collect
        CMP     #$17
        BNE     L1EEC

        ; It's a safe so increment
        INC     var_number_diamonds_left        
;...
.L1F09
        LDA     #$00
        STA     L0903
        STA     L0904
        LDA     zp_visible_screen_top_left_xpos
        CLC
        ADC     #$0E
        LSR     A
        LSR     A
        TAX
        LDA     zp_visible_screen_top_left_ypos
        CLC
        ADC     #$0D
        LSR     A
        LSR     A
        TAY
        JSR     fn_lookup_screen_object_for_x_y

        ; Is it Earth type 2
        CMP     #$18
        BCC     L1F3A

        ; Is it an Egg?
        CMP     #$1C
        BEQ     L1F3A

        ; Is it a rock?
        CMP     #$1D
        BEQ     L1F3A

        ; Check to see if the : key is being pressed
        ; (Move Repton Up)
        LDA     #$B7
        JSR     fn_read_key

        ; If it wasn't being pressed then branch away
        BEQ     L1F3A

        INC     L0903
.L1F3A
        LDA     zp_visible_screen_top_left_xpos
        CLC
        ADC     #$0E
        LSR     A
        LSR     A
        TAX
        LDA     zp_visible_screen_top_left_ypos
        CLC
        ADC     #$12
        LSR     A
        LSR     A
        TAY
        JSR     fn_lookup_screen_object_for_x_y

        ; Is it Earth type 2
        CMP     #$18
        BCC     L1F63

        ; Is it an egg?
        CMP     #$1C
.L1F53
        BEQ     L1F63

        ; Is it an rock?
        CMP     #$1D
        BEQ     L1F63

        ; Check to see if the / key is being pressed
        ; (Move Repton Down)
        LDA     #$97
        JSR     fn_read_key

        BEQ     L1F63

        DEC     L0903
.L1F63
        ; Check to see if the Z key is being pressed
        ; (Move Repton Left)
        LDA     #$9E
        JSR     fn_read_key

        BEQ     L1F6D

        DEC     L0904
.L1F6D
        ; Check to see if the X key is being pressed
        ; (Move Repton Right)
        LDA     #$BD
        JSR     fn_read_key

        BEQ     L1F77

        INC     L0904
.L1F77
        LDA     L0903
        BEQ     L1F81

        LDA     #$00
        STA     L0904
.L1F81
        RTS

;L1F82
.fn_dissolve_screen
        ; Disable Vsync event and change the palette
        NOP
        JSR     fn_disable_vsync_event_and_change_palette

        ; This loop is used to iterate over the entire screen
        ; N times as defined by the value in 
;L1F86
.loop_dissolve_entire_screen
        ; Generates a random value using the User VIA
        ; Timer 1
        ; Reset the screen lookup password
        ; Set the screen start address to 
        LDA     #$00
        STA     zp_screen_write_address_lsb
        LDA     #$60
        STA     zp_screen_write_address_msb
.L1F8E
        ; Get a random number
        JSR     fn_generate_random_number

        ; Use the random number to generate an MSB
        ; address of either $E0 and $F0
        ; Keep the top 4 bits (masking with 1111 0000)
        AND     #$F0

        ; Set the top 3 bits always (so randomness is)
        ; is just with the 5th bit and result will be 
        ; 1111 0000 or 1110 0000
        ORA     #$E0

        ; Store the MSB which will be used as the source
        ; of some random byte
        STA     var_random_byte_source_msb

        ; Generate another random number for the LSB
        ; address which will be either $E0xx or 
        JSR     fn_generate_random_number

        STA     var_random_byte_source_lsb
        LDY     #$00
;L1F9E
.loop_dissolve_screen_byte
        ; Load the current byte on the screen
        LDA     (zp_screen_write_address_lsb),Y

        ; AND the current screen byte with a random byte
        ; between $E000 and $F0FF
        AND     (var_random_byte_source_lsb),Y

        ; Write it back to the screen
        STA     (zp_screen_write_address_lsb),Y

        ; Move to the next screen byte
        INY
        
        ; Keep going until this page of memory is processed
        BNE     loop_dissolve_screen_byte

        ; Move to the next page of memory
        INC     zp_screen_write_address_msb
        BPL     loop_dissolve_screen_byte

        ; Loop over the whole screen N times
        DEC     zp_screen_dissolve_iterations
        BNE     loop_dissolve_entire_screen

        ; OSWRCH &11 / VDU 17
        ; Set the background colour to black (128/$80)
        ; VDU 17, 128
        LDA     #$11
        JSR     OSWRCH

        ; Black background
        LDA     #$80
        JSR     OSWRCH

        ; OSWRCH &0C
        ; Clear the screen
        LDA     #$0C
        JSR     OSWRCH

        ; Reset the screen start address to $6000
        ; Reset cursor xpos and ypos to (0,0)
        ; Set the LSB for the screen start address
        LDA     #$00
        STA     zp_screen_start_address_lsb
        STA     zp_password_cursor_xpos
        STA     zp_password_cursor_ypos

        ; Set the colour mask to all colours
        LDA     #$FF
        STA     zp_screen_colour_mask

        ; Set the MSB for the screen start address
        LDA     #$60
        STA     zp_screen_start_address_msb
        RTS


;1FCF
.fn_initialise_game
        ; OSWORD &08 - ENVELOPE 1
        LDA     #$08
        LDX     #LO(envelope_1)
        LDY     #HI(envelope_1)
        JSR     fn_call_osword_and_reset_score

        ; OSWORD $1A / VDU 26
        ; Return cursor to top left of screen
        ; and graphics origin to bottom left
        ; https://central.kaserver5.org/Kasoft/Typeset/BBC/Ch34.html
        LDA     #$1A
        JSR     fn_call_oswrch_and_reset_score

        ; Set the high score msb and lsb to zero
        LDA     #$00
        STA     var_high_score_lsb
        STA     var_high_score_msb

        JSR     L264D

        ; Set sound, music and combined sound/music
        ; to on
        LDA     #$01
        JSR     fn_set_sound_and_music_status
        
        ; continues below
        
;1FED
.fn_initiliase_game_after_restart
        ; This is called on load of the game and
        ; also if a player loses ALL of their lives

        ; Clear the screen and if the player
        ; just lost all their lives then show the
        ; high score table
        JSR     fn_clear_screen_show_high_score_table

        ; Reset the stack pointer 
        LDX     #$FF
        TXS

        ; Junk bytes
        NOP
        NOP

        ; Reset to the default number of lives (4)
        LDA     #$03
        STA     var_lives_left

        ; Reset the player score to zero
        LDA     #$00
        STA     var_score_lsb
        STA     var_score_mlsb
        STA     var_score_msb
        JSR     fn_reset_game

;L2008
.fn_reset_and_show_start_screen
        ; This is called when a player loses
        ; a life but still has some left AND
        ; it is called onve a level has been
        ; completed
        ;
        ; It is NOT called when a player
        ; this return to return to status
        ; screen (lives, diamonds left etc)


        ; Set repton's animation state to 'Repton Standing'
        LDA     #$0A
        STA     var_repton_animation_state

        ; TODO
        LDA     #$00
        STA     L0907
        STA     L0906

        ; Reset the remaining time to $6000
        LDA     #$60
        STA     var_remaining_time_msb
        LDA     #$00
        STA     var_remaining_time_lsb

        ; For a new game (restart) Repton's start 
        ; position is (2,2) on the map
        LDA     #$02
        STA     zp_visible_screen_top_left_xpos
        LDA     #$02
        STA     zp_visible_screen_top_left_ypos

        ; Start screen address is $6000 before scrolling
        LDA     #$00
        STA     zp_screen_start_address_lsb
        LDA     #$60
        STA     zp_screen_start_address_msb 

        
        ; Top four bits are the logical colour to assign
        ; Bottom four bits are the physical colour to set
        ; $11 = 0001 0001
        ;
        ; Set logical colour 1 to physical colour 1 (Red)s
        LDA     #$11
        JSR     fn_define_logical_colour

; 2034
        ; Display the repton start/pause screen
        JSR     fn_display_repton_start_screen

        ; Set logical colour 1 to physical colour 
        ; 0 OR'd with the screen number's colour lookup
        ; (so use the what we lookup as we're ORing with 0)
        LDA     #$10
        LDX     var_screen_number
        ORA     data_screen_physical_colour_lookup,X
        JSR     fn_define_logical_colour

        ; (xpos,ypos) represents the 
        ; top left of the visible map so draw
        ; tiles to the right and below that point:
        ; (xpos,ypos) -------->
        ; | ------------------>
        ; | ------------------>
        ; | ------------------>
        ; v ------------------>

        ; 1. Map is made of 32 x 32 objects
        ; 2. Each object is 4 tiles wide and 4 tiles high
        ; 3. Repton is 4 tiles wide and 4 tiles high 
        ; 4. Map is therefore map of 128 x 128 tiles 
        ; 5. Visible screen area is 32 x 32 tiles 
        ; 
        ; (xpos,ypos) contains the *tile* co-ordinate
        ; of the top left corner of the screen so
        ; 0 <= xpos < 128 and 0 <= ypos < 128
        ; 
        ; Number of rows to draw objects for - game
        ; screen is 32 x 32 so set this to 32
        LDA     #$20
        STA     zp_game_screen_row_to_draw

        ; Get and cache the ypos of the visible
        ; top left corner of the screen
        LDA     zp_visible_screen_top_left_ypos
        STA     zp_visible_screen_top_left_ypos_cache
;L204A
.loop_move_to_next_row
        ; Number of columns to draw objects for - game
        ; screen is 32 x 32 so set this to 32
        LDA     #$20
        STA     zp_game_screen_column_to_draw
        
        ; Get and cache the xpos of the visible
        ; top left corner of the screen   
        LDA     zp_visible_screen_top_left_xpos
        STA     zp_visible_screen_top_left_xpos_cache
;L2052
.loop_draw_row_tiles
        ; Load top left corner visible screen 
        ; (xpos,ypos) into X and Y
        ; as these are used as the co-ordinates when 
        ; looking up which tile to show
        LDX     zp_visible_screen_top_left_xpos_cache
        LDY     zp_visible_screen_top_left_ypos_cache

        ; Lookup tile to show at this (xpos, ypos)
        ; Looks up object first then which tile for that
        ; object to show at this (xpos,ypos)
        JSR     fn_lookup_screen_tile_for_xpos_ypos

        ; Display the tile at this (xpos, ypos)
        JSR     fn_display_tile

        ; Move to the next column xpos (xpos+1, ypos)
        INC     zp_visible_screen_top_left_xpos_cache
        ; Decrement the remaining to draw counter for
        ; this row
        DEC     zp_game_screen_column_to_draw
        ; If still some to draw on this row then
        ; loop back around (screen only shows
        ; 32 tiles out of full 128 on the map)
        BNE     loop_draw_row_tiles

        ; Wait for vertical sync before drawing next
        ; row
        JSR     fn_wait_for_vertical_sync

        ; Move to the next row ypos (xpos, ypos+1)
        INC     zp_visible_screen_top_left_ypos_cache
        ; Are all the rows drawn? If not then
        ; loop back around (screen only shows
        ; 32 tiles out of full 128 on the map)
        DEC     zp_game_screen_row_to_draw 
        BNE     loop_move_to_next_row

        ; Reset the music and draw repton
        ; on the screen in the default standing
        ; pose
        JSR     fn_reset_music_and_draw_repton

.L206E
        ; Check to see if the x position is in 
        ; at the start of a 32x32 grid position
        ; (remember ypos is 0 to 127) so mask
        ; it with 3 to see when it is zero
        ; 
        ; AND #$07 (0000 0011)
        LDA     zp_visible_screen_top_left_xpos
        CLC

        ; Add 2 because the starting top left is 
        ; (2,2) to show half a sprite on the top,
        ; left, right and bottom margins - so to 
        ; "align" and make the maths work add 2
        ADC     #$02
        AND     #$03

        ; If it's not aligned to a 32x32 grid position
        ; branch
        BNE     L2086

        ; Check to see if the y position is in 
        ; at the start of a 32x32 grid position
        ; (remember ypos is 0 to 127) so mask
        ; it with 3 to see when it is zero
        ; 
        ; AND #$07 (0000 0011)
        LDA     zp_visible_screen_top_left_ypos
        CLC
        ; Add 2 because the starting top left is 
        ; (2,2) to show half a sprite on the top,
        ; left, right and bottom margins - so to 
        ; "align" and make the maths work add 2        
        ADC     #$02
        AND     #$03

        ; If it's not alinged to a 32x32 grid position
        ; branch        
        BNE     L2086

        ; Junk bytes - 3
        NOP
        NOP
        NOP
        JSR     L1F09

.L2086
        ; Clear Binary Coded Decimal mode
        CLD
        LDA     L0903
        BEQ     L2097

        BPL     L2094

        JSR     L1C6B

        JMP     L2097        

.L2094
        JSR     L1CA1

.L2097
        LDA     L0904
        BEQ     L20A7

        BPL     L20A4

        JSR     L1CD6

        JMP     L20A7

.L20A4
        JSR     L1D91

.L20A7
        CLI
        LDA     L0903
        BEQ     L20B6

        LDA     zp_visible_screen_top_left_ypos
        LSR     A
        LSR     A
        AND     #$01
        STA     var_repton_animation_state
.L20B6
        LDA     zp_visible_screen_top_left_xpos
        LSR     A
        AND     #$07
        TAX
        LDA     L0904
        BEQ     L20D2

        BPL     L20CC

        LDA     L0E22,X
.L20C6
        STA     var_repton_animation_state
L20C8 = L20C6+2
        JMP     L20D2

.L20CC
        LDA     L0E2A,X
        STA     var_repton_animation_state
.L20D2
        LDA     L0903
        ORA     L0904
        BNE     L20E5

        LDA     L0906
        BMI     L20ED

        INC     L0906
        JMP     L2100        

;...
;L2158
.fn_check_r_d_w_keys
        ; Check to see if the player has 
        ; asked for the music to be switched off
        ; INKEY $DE is W for no music
        LDA     #$DE
        JSR     fn_read_key

        ; Branch ahead if key not pressed
        BEQ     check_d_key

        ; Set music to off
        LDA     #$00
        STA     var_music_status
;L2164
.check_d_key

        ; Check to see if the player has 
        ; asked for the music to be switched on
        ; INKEY $DE is W for music on
        LDA     #$CD
        JSR     fn_read_key

        ; Branch ahead if key not pressed
        BEQ     check_r_key

        ; Set music to on
        LDA     #$01
        STA     var_music_status
;L2170
.check_r_key
        ; Check to see if the player has 
        ; asked for the music to be switched on
        ; INKEY $CC is R for restart
        LDA     #$CC
        JSR     fn_read_key

        ; Branch ahead if key not pressed
        BEQ     set_combined_sound_music

        ; Restart the game
        JMP     L26A7

;L217A
.set_combined_sound_music
        ; Set the combined sound and music status
        LDA     var_sound_status
        AND     var_music_status
        STA     var_both_sound_and_music_on_status
        JMP     L2567
;...

;2186
.fn_set_sound_and_music_status
        STA     var_sound_status
        STA     var_music_status
        STA     var_both_sound_and_music_on_status
        RTS

;2190
.fn_clear_screen_show_high_score_table
        ; OSWRCH &0C / VDU 12 - clear text area
        ; and put cursor in home position
        LDA     #$0C
        JSR     OSWRCH

        ; Display the high score table 
        ; (or skip if it's a restart)
        JMP     fn_show_high_score_table

        ; Junk bytes - 7
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
;L219F
.fn_show_high_score_repton_logo
        ; Reset the screen start address to $6000
        LDA     #$00
        STA     zp_screen_start_address_lsb
        LDA     #$60
        STA     zp_screen_start_address_msb

        ; Disable the vsync event subscription
        JSR     fn_disable_vsync_event

        ; Set the cursor position to (0,tbd)
        LDA     #$00
        STA     zp_password_cursor_xpos

        ; Set colour mask
        LDA     #$0F
        STA     zp_screen_colour_mask

        ; Set the cursor position to (0,1)
        LDA     #$01
        STA     zp_password_cursor_ypos

        ; NOTE same as the code at 17C4
        ; Set the byte counter for the loading 
        ; and displaying the repton logo to zero 
        LDA     #$00
        STA     zp_screen_write_total_byte_counter
;L21BA
.loop_get_next_repton_logo_byte_hs
        LDY     zp_screen_write_total_byte_counter
        LDA     data_repton_logo,Y
        JSR     fn_print_character_and_increment_xpos

        ; Increment the total byte counter and check
        ; to see if all of the logo has been copied
        ; to the screen
        INC     zp_screen_write_total_byte_counter
        LDA     zp_screen_write_total_byte_counter
        ; 192 bytes
        CMP     #$C0
        BNE     loop_get_next_repton_logo_byte_hs

        RTS
;...

.L21D0
        LDA     #$00
        STA     zp_screen_write_total_byte_counter
.L21D4
        LDY     zp_screen_write_total_byte_counter
        LDX     L2240,Y
        BEQ     L21E6

        LDA     #$11
        STA     zp_screen_write_address_lsb
        LDY     #$01
        LDA     #$01` 
        JSR     L105A
;...


;L2231
.fn_write_string_and_set_escape_lsb
        ; Display the string
        JSR     fn_write_string_to_screen

        ; Set the LSB for the "press escape to kill yourself"
        ; string so that when the main routine writes it'll 
        ; choose this string for that line
        JMP     fn_set_press_escape_lsb
;...


;L2300
.fn_sort_and_display_scores
        ; Set the screen number to the high value
        LDA     #$FF
        STA     var_screen_number

        ; Set cursor position to (5,8)
        LDY     #$08
        LDX     #$05

        ; Set the string to write to "By, Superior Software"
        LDA     #LO(text_by_superior_software)
        STA     zp_object_or_string_address_lsb
        LDA     #HI(text_by_superior_software)
        STA     zp_object_or_string_address_msb

        ; Display the string
        JSR     fn_write_string_to_screen

        ; Set cursor position to (4,29)
        LDX     #$04
        LDY     #$1D
        LDA     #LO(text_press_space_bar_to_play)
        STA     zp_object_or_string_address_lsb
        LDA     #HI(text_press_space_bar_to_play)
        STA     zp_object_or_string_address_msb

        ; Display the string
        JSR     fn_write_string_to_screen

        ; Reset to default colours
        JSR     fn_reset_palette_to_default_game_colours

        ; Junk bytes - 27
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP

        ; Set the high score nth 
        ; position index to 0
        LDA     #$00
        STA     var_score_index

;L2346
.display_next_high_score_pos
        
        LDA     #$00
        STA     zp_password_cursor_xpos

        ; Set the colour mask (to yellow and black)
        LDA     #$F0
        STA     zp_screen_colour_mask

        ; ypos = (zero based high score position * 2) + 10
        LDA     L0920
        ASL     A
        ADC     #$0A
        STA     zp_password_cursor_ypos

        
        LDA     var_score_index
        CLC

        ; Write the high score position start at 1 
        ; to the screen for each high score
        ADC     #$31
        JSR     fn_print_character_to_screen  

        ; Write a "." to the screen after the number
        LDA     #$2E
        JSR     fn_print_character_to_screen

        ; Increment the high score position index
        ; and check whether all 8 have been display
        ; if not look back        
        INC     var_score_index
        LDA     var_score_index
        CMP     #$08
        BNE     display_next_high_score_pos

        ; Write the "Last Score : " string to the screen
        LDA     #LO(text_last_score)
        STA     zp_object_or_string_address_lsb
        LDA     #HI(text_last_score)
        STA     zp_object_or_string_address_msb

        ;  Set cursor position to (8,26)
        LDY     #$1A
        LDX     #$08

        ; Display the string
        JSR     fn_write_string_to_screen

        ;  Set cursor position to (21,26)
        LDY     #$1A
        LDX     #$15

        ; Display the player's score
        LDA     var_score_lsb
        STA     zp_display_value_lsb
        LDA     var_score_msb
        STA     zp_display_value_msb
        LDA     var_score_mlsb
        STA     zp_display_value_mlsb
        JSR     fn_write_3_byte_display_value_to_screen

        ; Scores are stored in the correct order between
        ; $2B00 - $2B17 (3 bytes per score)
        ;
        ; High score names table is stored between 
        ; $2B18 - $2BD7
        ; 
        ; Player names are added from the bottom up in memory
        ; not in the correct order (regardless of score)
        ; so first player name at the bottom even if highest score
        ;
        ; Player high scores are added from the bottom up in memory
        ; not in the correct order (regardless of score)
        ; so first player score at the bottom even if highest score
        ; 
        ; $2BD8 is the index into the score table and name table
        ; and is sorted in sequence
        ;
        ; Example byte sequence on start for the scores at $2B00
        ; (highest to lowest)
        ; 00 03 06 09 0C 0F 12 15
        ; 
        ; Player high score offset shown as <15>
        ;
        ; Example byte sequence on start for the scores at $2B00
        ; when player scored 2500 say so would be 7th on the table
        ; and not other player high scores
        ; (highest to lowest)
        ; 00 03 06 09 0C 0F <15> 12
        ;
        ; Example byte sequence on start for the scores at $2B00
        ; when player scored 3500 say so would be 6th on the table
        ; (highest to lowest)
        ; 00 03 06 09 0C <15> 0F 12
        ; 
        ; Example byte sequence on start for the scores at $2B00
        ; when player scored 8500 say so would be 1st on the table
        ; (highest to lowest)
        ; <15> 00 03 06 09 0C 0F 12

        ; Generate the sequence as it's a new high score
        ; Generates at $2BD8
        ;    EQUB $00,$03,$06,$09,$0C,$0F,$12,$15
        ; 
        ; These are used as score comparison offsets
        ; from the current score to another score
        ; because each score is 3 bytes
        LDX     #$00
        LDA     #$00
;L2397
.loop_generate_score_offsets
        STA     data_sorted_score_offsets,X
        CLC
        ADC     #$03
        ; Check all 8 offsets have been generated
        ; in the default order
        INX
        CPX     #$08
        BNE     loop_generate_score_offsets

        ; Reset the bubble sort pass number
        LDA     #$00
        STA     var_bubble_sort_pass     

;L23A7
.bubble_sort_next_pass

        ; BUBBLE SORT ALGORITHM
        ;
        ; This is the main sort algorithm for the scores
        ;
        ; Neither the scores or the names are sorted in 
        ; memory. A table of bytes at $2BD8 is used to show 
        ; the sorted sequence of the scores.  The table
        ; uses byte values that represent an offset from
        ; $2B00 (each score is 3 bytes in BCD format
        ; and LSB, MLSB, MSB format)
        ;
        ; Each score position is sorted all the way through 
        ; so this runs 8 * 8 times (n^2) and there's no
        ; check to see if any pass stops moving elements
        ; so it'll always be n^2
        LDA     #$00
        STA     var_score_index
;L23AC
.sort_score_lookup_table

        ; 2BD9 = offsets
        ; 2B02 = scores mlsbs

        ; Get two adjacent values as we're going to
        ; compare the scores they reference to sort them
        ; in the data_sorted_score_offsets table
        ; X - (n)  th entry in high score table
        ; Y - (n+1)th  entry in high score table
        ;
        ; where var_score_index is n
        ;
        ; NOTE - the lower n the higher the score
        ; so on game load:
        ;    n   = 0 the score is 008000
        ;    n   = 1 the score is 007000
        ;    ...
        ;    n   = 7 the score is 001000
        LDX     var_score_index
        NOP
        LDA     data_sorted_score_offsets + 1,X 
        TAY
        LDA     data_sorted_score_offsets,X 
        TAX

        ; Compare if the MSB for (n) < (n+1)th
        ; then flip their positions in the lookup
        ; table
        ; X - (n)  th entry in high score table
        ; Y - (n+1)th  entry in high score table
        LDA     data_high_scores+2,X
        CMP     data_high_scores+2,Y

        ; If first score < second score MSB
        ; flip the scores
        BCC     flip_score_lookup_positions

        ;----------------------------------------
        ; NOTE - Weird - middle byte not checked?
        ; TODO - bug?
        ;----------------------------------------

        ; If the LSBs are not the same
        BNE     no_flip_score_lookup_positions

         ; Compare if the LSB for (n) < (n+1)th
        ; then flip their positions in the lookup
        ; table
        ; X - (n)  th entry in high score table
        ; Y - (n+1)th  entry in high score table
        LDA     data_high_scores,X
        CMP     data_high_scores,Y

        ; If first score < second score LSB
        ; flip the scores
        BCC     flip_score_lookup_positions

        ; If LSBs are not the same branch
        BNE     .no_flip_score_lookup_positions

;L23D6
.flip_score_lookup_positions
        ; Flip the positions of the scores
        LDX     var_score_index
        LDA     data_sorted_score_offsets,X
        TAY
        LDA     data_sorted_score_offsets+1,X
        STA     data_sorted_score_offsets,X
        TYA
        STA     data_sorted_score_offsets+1,X

;L23E7
.no_flip_score_lookup_positions
        ; Is the nth score sorted?
        ; If not lookup back
        INC     var_score_index
        LDA     var_score_index
        CMP     #$07
        BNE     sort_score_lookup_table

        ; Are all sorting passes complete?
        ; If not look back
        INC     var_bubble_sort_pass
        LDA     var_bubble_sort_pass
        CMP     #$09
        BNE     bubble_sort_next_pass

        ; Reset the nth score index
        LDA     #$00
        STA     var_score_index
;L2400
.display_next_high_score_name
        LDX     var_score_index
        LDA     data_sorted_score_offsets,X
        STA     var_score_to_display_offset
        TAX

        ; Get the current score and cache
        LDA     data_high_scores+2,X
        STA     zp_display_value_msb
        LDA     data_high_scores+1,X
        STA     zp_display_value_mlsb
        LDA     data_high_scores,X
        STA     zp_display_value_lsb

        ; Set cursor position to (3, ypos)
        LDX     #$03

        ; Work out the screen row number
        ; ypos = (zero based high score position * 2) + 10
        LDA     var_score_index
        ASL     A
        ADC     #$0A
        TAY

        ; Set the colour mask so yellow and black displayed
        LDA     #$F0
        STA     zp_screen_colour_mask

        ; Display the current score
        JSR     fn_write_3_byte_display_value_to_screen

        ; Set the MSB of the player name to display
        ; All strings are at $2B18 onwards
        ; 
        ; Assume all names are in the same page
        LDA     #HI(data_high_score_names)
        STA     zp_object_or_string_address_msb

        ; Set the LSB of the player name to display
        ; LSB = (offset * 8) + $18
        ;
        ; Each offset increment is by 3 and each high score
        ; name is 24 characters long hence the * 8
        ;
        ; 0  is $2B18
        LDA     var_score_to_display_offset
        ASL     A
        ASL     A
        ASL     A
        ADC     #$18
        STA     zp_object_or_string_address_lsb

        ; Set cursor position to (10, ypos)
        ; Work out the screen row number
        ; ypos = (zero based high score position * 2) + 10        
        LDA     var_score_index
        ASL     A
        CLC
        ADC     #$0A
        ; Set the ypos
        TAY

        ; Set the xpos
        LDX     #$0A

        ; Display the high score name
        JSR     fn_write_string_to_screen

        ; Are all high score names displayed, 
        ; if not loop back
        INC     var_score_index
        LDA     var_score_index
        CMP     #$08
        BNE     display_next_high_score_name

        RTS          

;2450
.text_screen_complete_press_space
        EQUS    $81,"Press ",$82,"SPACE",$0D
.text_screen_complete_well_done
        EQUS    $81,"Well done.  Now do that from thevery start of screen one.",$0D
.text_screen_complete_amazing        
        EQUS    $81,"Amazing!  Now try again.",$0D
        ; CODE!
        EQUS    $A9,$FF,$8D,$FE,$09,$A9,$FF,$8D,$FF,$09," ",$B4,$0F,"LV",$0D
        EQUS    "(C) Timothy Tyler 1985",$0D
;...
;L24B3
.fn_reset_music_and_draw_repton
        ; Reset the music tune to start at the beginning
        LDA     #$FF
        STA     var_note_sequence_number

        ; Reset the current cycle through the interrupt
        ; handle (used to rate limit the music)
        LDA     #$FF
        STA     var_music_rate_cycle

        ; Wait for vertical sync
        JSR     fn_wait_for_vertical_sync

        ; Put repton on the screen in the default
        ; Repton Standing pose
        JMP     fn_draw_repton
;...
;2500
.fn_reset_palette_to_default_game_colours
        ; OSWRCH &14
        ; Restore default logical colours
        ; Logical 0 = Physical 0 (Black)
        ; Logical 1 = Physical 1 (Red)
        ; Logical 2 = Physical 3 (Yellow)
        ; Logical 3 = Physical 7 (White)
        LDA     #$14
        JSR     OSWRCH

        ; Default game colours:
        ; Logical 0 = Physical 0 (Black)
        ; Logical 1 = Physical 1 (Red)
        ; Logical 2 = Physical 3 (Yellow)
        ; Logical 3 = Physical 2 (Green) <= Change now
        LDA     #$32
        JMP     fn_define_logical_colour
;250A
.fn_set_palette_to_default_with_screen_lookup_colour
        JSR     fn_reset_palette_to_default_game_colours

        ; Lookup the physical colour to set 
        ; Logical colour 1 to (defaults to red)
        ; Changes per level based on lookup table
        LDA     #$10
        LDX     var_screen_number
        ; Top four bits are the logical colour, bottom physical
        ; So OR in the physical value 
        ORA     data_screen_physical_colour_lookup,X

        ; Game colours now:
        ; Logical 0 = Physical 0 (Black)
        ; Logical 1 = Physical <looked up>
        ; Logical 2 = Physical 3 (Yellow)
        ; Logical 3 = Physical 6 (Green)
        JMP     fn_define_logical_colour
;...
;2518
.fn_default_palette_with_cyan
        ; Reset to default game colours
        JSR     fn_reset_palette_and_3_to_green

        ; Game colours now:
        ; Logical 0 = Physical 0 (Black)
        ; Logical 1 = Physical 1 (Red)
        ; Logical 2 = Physical 3 (Yellow)
        ; Logical 3 = Physical 6 (Cyan) <= Change now        
        LDA     #$36
        JMP     fn_define_logical_colour

;2520
.fn_disable_vsync_event_and_change_palette
        ; Disable the VSYNC event
        JSR     fn_disable_vsync_event
        ; Reset the colour paletete and change
        ; logical colour 1 depending on the level
        JMP     fn_set_palette_to_default_with_screen_lookup_colour
        
;2526
.fn_check_if_password_match
        ; Check to see if a screen matched, if not
        ; display "Password not matched"
        ;
        ; Get the screen number and see if it's positive
        ; i.e. > 0
        LDA     var_screen_number
        ; Branch ahead if valid screen number
        BPL     $253F

        ; Otherwise, password is invalid
        ; Set the string to "Password not recognised"
        LDA     #HI(text_passwd_not_recognised)
        STA     zp_object_or_string_address_msb
        LDA     #LO(text_passwd_not_recognised)
        STA     zp_object_or_string_address_lsb

        ; Set cursor position to (4,12)
        LDX     #$04
        LDY     #$0C
        JSR     fn_write_string_to_screen

        LDA     #$00
        JMP     $178E        

;...
.253F
        ; Password matched so set the text
        ; to be the matched screen text (well
        ; only the MSB) here, LSB is set after
        ; return
        LDA     #HI(text_screen_matched)
        STA     zp_object_or_string_address_msb
        RTS

;2544
.text_passwd_not_recognised
        EQUS    "Password not recognised",$0D
;...
;255c
.fn_reset_start_and_started_on_screen
        ; If the screen number is already positive
        ; then do nothing otherwise reset to zero
        LDA     var_screen_number
        BPL     end_reset_start_and_started_on_screen

        ; Set the start and started on screens to 0
        LDA     #$00
        JSR     fn_set_start_and_started_on_screen
.end_reset_start_and_started_on_screen
        RTS        
;...
;L2591
.fn_add_one_to_lives_left_for_display
        ; Lives are stored as zero based (0 is one life left)
        ; but to display the value then one has to be added
        LDA     var_lives_left
        CLC
        ADC     #$01
        RTS

;2598
.fn_disable_vsync_create_map_colours
        ; Disable Vsync event and change the palette
        JSR     fn_dissolve_screen

        ; Change the colour of the palette to default
        ; with cyan for white
        JMP     fn_default_palette_with_cyan

        LDY     #$08
        LDX     #$05
        RTS        
;...

;L25D0
.fn_display_p_or_r_option
        ; Check to see if there are still four lives left
        LDA     var_lives_left
        CMP     #$03

        ; Less than four lives left then branch
        ; as the game will have started
        BNE     game_started

        ;-----------------------------------
        ; Press P to enter Password
        ;-----------------------------------
        ; Four lives left
        ; Check to see if a new game has started
        ; yet - if not branch ahead
        ; When a new game has started, the score
        ; will be 1 or greater. Also check the
        ; the time LSB isn't zero (there's a chance)
        ; a player could come back to the screen before
        ; the score has been updated on a new game
        LDA     var_score_lsb 
        ORA     var_score_mlsb 
        ORA     var_score_msb 
        ORA     var_remaining_time_lsb
        ; Branch if game started
        BNE     game_started

        ; Set the cursor position to (2,31)
        LDY     #$1F
        LDX     #$02

        ; Set the MSB of the string
        LDA     #HI(text_p_to_enter_password)
        STA     zp_object_or_string_address_msb

        ; Set the LSB of the string
        LDA     #LO(text_p_to_enter_password)
        STA     zp_object_or_string_address_lsb

        ; Display the spring and set the LSB for the
        ; next string to write to be the Press escape to kill yourself
        JMP     fn_write_string_and_set_escape_lsb
;L25F4
.game_started
        JMP     fn_write_r_to_restart

        ; Spare bytes
        NOP
        NOP

.L25F9
        JSR     L2158

        ; If less than four lives are 
        ; left then return - player can't enter 
        ; a password when in a game
        LDA     var_lives_left
        CMP     #$03
        BNE     L262B

        ; Check to see if score is positive
        ; or if there is any remaining time
        ; if not, return - player can't enter 
        ; a password when in a game
        LDA     var_score_lsb
        ORA     var_score_mlsb
        ORA     var_score_msb
        ORA     var_remaining_time_lsb
        BNE     L262B

        ; Wait for a key press of P
        LDA     #$C8
        JSR     fn_read_key

        BEQ     L262B

        ; Set current screen and started on screen to
        ; unknown
        LDA     #$FF
        JSR     fn_set_start_and_started_on_screen

        ; Display the password entry screen
        JSR     fn_display_password_screen

        JSR     L1EBF

        PLA
        PLA
.L2625
        JSR     L2653

        JMP     fn_dissolve_screen

.L262B
.end_something
        RTS
;...

; 2640
.fn_game_start
        ; Reset the time remaining to $60xx
        LDA     #$60
        STA     var_remaining_time_msb

        ; Set the restart pressed flag so the high
        ; scores aren't shown
        LDA     #$FF
        STA     var_restart_pressed

        ; Initialised the game
        JMP     fn_initialise_game

.L264D
        LDA     #$80
        JSR     L266B

        ; NEXT HERE....

.L2652
        RTS        
.L2653
        ; Check to see if there are still four lives left
        LDA     var_lives_left
        CMP     #$03
        BNE     L2652

        ; Four lives left
        ; Check to see if a new game has started
        ; yet - if not branch ahead
        ; When a new game has started, the score
        ; will be 1 or greater. Also check the
        ; the time LSB isn't zero (there's a chance)
        ; a player could come back to the screen before
        ; the score has been updated on a new game
        LDA     var_score_lsb
        ORA     var_score_mlsb
        ORA     var_score_msb
        ORA     var_remaining_time_lsb
        BNE     L2652

        JMP     L21D0        
;...
;2677
.fn_show_high_score_table
        ; Reset the screen start address to $6000
        LDA     #$00
        STA     zp_screen_start_address_lsb
        LDA     #$60
        STA     zp_screen_start_address_msb

        ; Reset the music to start at the first
        ; chord when the game starts again
        LDA     #$FF
        STA     var_note_sequence_number

        ; Disable the vsync event subscription
        JSR     fn_disable_vsync_event

        ; Check if this is a restart or the player
        ; died - if restart, don't show the 
        ; high score screen
        LDA     var_restart_pressed
        BNE     end_show_high_score_table

        JSR     fn_sort_and_display_scores

        JSR     fn_show_high_score_repton_logo

        JSR     fn_loop_wait_for_space_bar_on_screen

;2695
.end_show_high_score_table
        ; Rest the "hide high score screen" flag
        LDA     #$00
        STA     var_restart_pressed
        RTS        
;...
;2684
        ; calls 0d6a
        JSR     .fn_disable_vsync_event
;...

;L266b
.dunno_yet
        ; Set the middle high score digits to zero
        STA     var_high_score_mlsb
        LDA     #$00

        ; Set the start screen and started on screen to 0
        JSR     .fn_set_start_and_started_on_screen

        JSR     L1EBF

        RTS

;....

;26A0
.fn_set_start_and_started_on_screen
        ; Set the start and started on screens
        ; to the value passed in A 
        STA     var_screen_number
        STA     var_player_started_on_screen_x
        RTS

;L26A7
.fn_restart_game
        ; Restart was pressed so set the flag
        ; so that the high score screen is not 
        ; shown
        LDA     #$FF
        STA     var_restart_pressed

        ; Set the start level and started on level to 0
        LDA     #$00
        JSR     fn_set_start_and_started_on_screen

        ; Reinitialise and restart the game
        JMP     fn_initiliase_game_after_restart
;...
;2800

;...

;2A3F
.fn_call_osword_and_reset_score
        JSR     OSWORD

        LDA     #$00
        ; Set the score to zero
        STA     var_score_lsb
        STA     var_score_mlsb
        STA     var_score_msb
        RTS

; TODO FUNCTION NAME
.L2A4E
        ; Set the screen number to whatever was passed
        ; in A
        STA     var_screen_number

        ; Clear the text area and reset screen
        ; start to $6000
        LDA     #$0C
        JSR     fn_oswrch_and_reset_screen_start_addr

        ; Set the remaining time MSB to $60xx
        LDA     #$60
        STA     var_remaining_time_msb

        ; Reset the colour palette
        JSR     fn_reset_palette_to_default_game_colours

        ; Junk bytes
        NOP
        NOP
        NOP
        NOP             

        ; Copy the REPTON has been FINISHED
        ; graphics onto the screen - it's 
        ; 3 pages long        
        LDY     #$00
;L2A64
.loop_repton_finished_logo
        LDA     L2700,Y
        STA     L6500,Y
        LDA     L2800,Y
        STA     L6600,Y
        LDA     L2900,Y
        STA     L6700,Y
        INY
        ; If not all 255 bytes copied in each page 
        ; loop again
        BNE     loop_repton_finished_logo

        ; Write "Press SPACE" at (10,30)
        LDX     #$0A
        LDY     #$1E
        LDA     #HI(text_screen_complete_press_space)
        STA     zp_object_or_string_address_msb
        LDA     #LO(text_screen_complete_press_space)
        STA     zp_object_or_string_address_lsb
        JSR     fn_write_string_to_screen

        ; Write "Amazing!  Now try again." at (0,16)
        LDX     #$00
        LDY     #$10
        LDA     #HI(text_screen_complete_amazing)
        STA     zp_object_or_string_address_msb
        LDA     #LO(text_screen_complete_amazing)
        STA     zp_object_or_string_address_lsb

        ; Check to see if this was a play through
        ; from screen 0 if it wasn't then change
        ; the message
        LDA     var_player_started_on_screen_x
        BEQ     display_complete_string

        ; Player didn't start on screen 0 so tell them
        ; to do it again from screen 0
        LDA     #LO(text_screen_complete_well_done)
        STA     zp_object_or_string_address_lsb
;2A9D
.display_complete_string
        JSR     fn_write_string_to_screen

;2AA0
.loop_wait_for_space_bar
        ; TODO
        JSR     L2158

        ; Wait for the space bar to be pressed
        LDA     #$9D
        JSR     fn_read_key

        ; If it wasn't space, loop and wait for space
        BEQ     loop_wait_for_space_bar

        RTS

;L2AAB
.fn_oswrch_and_reset_screen_start_addr
        ; OSWRCH &0C / VDU 12 - clear text area
        ; and put cursor in home position
        ; 
        ; Perform an OSWRCH command - only
        ; ever seems to be &0C when called
        JSR     OSWRCH

        ; Set the screen start address to $6000
        LDA     #$00
        STA     zp_screen_start_address_lsb
        LDA     #$60
        STA     zp_screen_start_address_msb
        RTS

;2AB7
.fn_flush_all_buffers_cache_xpos_and_ypos
        ; Something to do with enter password
        ; X = 04, y=06
        STX     zp_password_cursor_xpos
        STY     zp_password_cursor_ypos
        
        ; OSBYTE &0F (X=0)
        ;
        ; Flush ALL buffers (keyboard, RS423, printer
        ; sound channels, speech) - effectively clear
        ; they keyboard buffer
        LDA     #$0F
        LDX     #$00
        JMP     OSBYTE

;L2AC2
.fn_check_and_update_high_score
        ; If the score MSB isn't greater than the 
        ; high score MSB do nothing
        LDA     var_score_msb
        CMP     var_high_score_msb
        BCC     end_check_and_update_high_score

        ; If it's greater (not the same) then update
        ; the score otherise check the lower bytes
        ; if they are the same
        BNE     update_high_score

        ; Check to see if the player's middle byte
        ; of score isn't greater than the high score
        ; middle byte, end if it's less
        LDA     var_score_mlsb
        CMP     var_high_score_mlsb
        BCC     end_check_and_update_high_score

        ; If it's greater (not the same) then update
        ; the score otherise check the lowest bytes
        ; if they are the same
        BNE     update_high_score

        ; Check the lowest byte to make see if it's higher
        ; than the current high score
        LDA     var_score_lsb
        CMP     var_high_score_lsb
        BCC     end_check_and_update_high_score

        ; Junk bytes - 2
        NOP
        NOP
;2AE0
.update_high_score
        ; Update the high score with the
        ; player's score
        LDA     var_score_msb 
        STA     var_high_score_msb
        LDA     var_score_mlsb
        STA     var_high_score_mlsb
        LDA     var_score_lsb
        STA     var_high_score_lsb
;L2AF2
.end_check_and_update_high_score
        RTS

;L2AF3
.fn_compare_user_password_character
        ; Compare current (Y) password character
        ; against user input
        ; 
        ; Clever way to perform a case insensitive
        ; check by ANDing with 0010 1111
        ; A ($41) goes to ($41)
        ; a ($61) goes to ($41)
        ; B ($42) goes to ($42)
        ; b ($62) goes to ($42)
        ; ... 
        ; Numbers/characters comparisons work too
        AND     #$5F
        STA     zp_masked_password_character
        LDA     L2EE8,Y
        AND     #$5F
        CMP     zp_masked_password_character
        RTS        

;2AFF - junk byte?
        EQUB    $00        

;2B00
; High scores
.data_high_scores
        EQUB    $00,$80,$00
        EQUB    $00,$70,$00
        EQUB    $00,$60,$00
        EQUB    $00,$50,$00
        EQUB    $00,$40,$00
        EQUB    $00,$30,$00
        EQUB    $00,$20,$00
        EQUB    $00,$10,$00

;2B18
.data_high_score_names
        EQUS    "* Superior Software *",$0D,$0D,$0D
        EQUS    "* Superior Software *",$0D,$0D,$0D
        EQUS    "* Superior Software *",$0D,$0D,$0D
        EQUS    "* Superior Software *",$0D,$0D,$0D
        EQUS    "* Superior Software *",$0D,$0D,$0D
        EQUS    "* Superior Software *",$0D,$0D,$0D
        EQUS    "* Superior Software *",$0D,$0D,$0D
        EQUS    "* Superior Software *",$0D,$0D,$0D

;2BD8
.data_sorted_score_offsets
        ; These are the offsets into 2B00 that show
        ; the score order - resorted everytime there
        ; is a new player high score
        EQUB    $00,$03,$06,$09,$0C,$0F,$12,$15

;2BE3
        ; Junk Bytes? Maybe 9 or 10 high score   places 
        ; originally
        EQUB    $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D
        EQUB    $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D
        EQUB    $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D
        EQUB    $0D,$0D,$0D,$0D,$0D

;2C00
.fn_loop_wait_for_space_bar_on_screen
        ; Check to see if the Restart, Music Off
        ; Or Music On passwords have been pressed
        ;
        ; D / W do not work other than flip the on/off state
        ; R works
        ;
        ; NOTE Music never on start,high score 
        ; or status screen though
        JSR     fn_check_r_d_w_keys

        ; Wait for the space bar to be pressed    
        ; INKEY $9D is SPACE        
        LDA     #$9D
        JSR     fn_read_key
        BEQ     loop_wait_for_space_bar_on_screen

        RTS

;L2C0B
        ; Junk bytes - 10
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP

;2C15
.fn_display_password_screen
        ; OSWRCH &0C / VDU 12 - clear text area
        ; and put cursor in home position
        LDA     #$0C
        JSR     OSWRCH

        ; Set the cursor position to (7,4)
        LDX     #$07
        LDY     #$04

        ; Set the string to "Enter Password"
        LDA     #LO(text_enter_password)
        STA     zp_object_or_string_address_lsb
        LDA     #HI(text_enter_password)
        STA     zp_object_or_string_address_msb

        ; Write the string to the screen
        JSR     fn_write_string_to_screen

        ; Set the cursor position to (3 ,6)
        LDA     #$03
        STA     zp_password_cursor_xpos
        LDA     #$06
        STA     zp_password_cursor_ypos

        ; Allow all colours on screen
        LDA     #$FF
        STA     zp_screen_colour_mask

        ; Write an & to the screen (gets translated into
        ; two vertical lines with dots tile)
        LDA     #$26
        JSR     fn_print_character_to_screen

        ; Set the cursor position to (26,6)
        LDA     #$1A
        STA     zp_password_cursor_xpos

        ; Write an & to the screen (gets translated into
        ; two vertical lines with dots tile)
        LDA     #$26
        JSR     fn_print_character_to_screen

        ; OSBYTE &0F (X=0)
        ;
        ; Flush ALL buffers (keyboard, RS423, printer
        ; sound channels, speech) - effectively clear
        ; the keyboard buffer
        LDA     #$0F
        LDX     #$00
        JSR     OSBYTE

        ; Position the cursor to (4,6) which 
        ; is the start of where the player entered
        ; password will appear
        LDX     #$04
        LDY     #$06

        ; Let the player enter the password
        JSR     fn_get_player_password

        ; Reset the screen password index to zero
        ; before trying to match passwords
        LDA     #$00
        STA     zp_screen_password_lookup_index
;L2C55
.loop_get_next_screen_password_and_compare
        LDX     zp_screen_password_lookup_index
        LDA     data_password_lsb_lookup_table,X
        STA     zp_screen_password_lookup_lsb
        LDA     #HI(data_password_lsb_lookup_table)
        STA     zp_screen_password_lookup_msb

        ; Even though the entered password can be up to 
        ; 22 characters long, screen passwords are max
        ; 11 including trailing CR
        LDY     #$0B
;L2C62
.loop_compare_next_password_character
        ; Get the actual screen password current
        ; character to compare against player input
        LDA     (zp_screen_password_lookup_lsb),Y
        ; Compare the user password character
        JSR     fn_compare_user_password_character

        ; If it wasn't the same branch ahead
        BNE     password_check_complete

        ; Otherwise compare the next character
        DEY
        BPL     fn_compare_user_password_character

        ; Matched a password for a screen so set the
        ; start and started on variables to that screen
        LDA     zp_screen_password_lookup_index
        JSR     fn_set_start_and_started_on_screen

;L2C71
.password_check_complete
        ; Move to the next screen's password
        ; for comparison
        INC     zp_screen_password_lookup_index
        LDA     zp_screen_password_lookup_index

        ; Check if beyond the last screen password
        ; Seems to check ALL passwords for all screens
        ; regardless of a match
        CMP     #$0C
        BNE     loop_get_next_screen_password_and_compare

        ; Check if matched or not to a screen password
        ; if not, routine below will display
        ; "password not recognised"
        ; If it did match, routine will set MSB
        ; of zp_object_or_string_address_msb to $2
        JSR     fn_check_if_password_match

        ; Spare byte
        NOP

        ; Only gets here if a password matched
        ; Set the string to display to $2D40
        ; MSB was set in previous routine
        LDA     #$40
        STA     zp_object_or_string_address_lsb

        ; Set the cursor to (11,16)
        LDX     #$0B
        LDY     #$10

        ; Write "Screen " to display
        JSR     fn_write_string_to_screen

        ; Get the ASCII letter for the screen
        LDA     var_screen_number
        CLC
        ADC     #$41
        ; Write the screen letter afer "Screen "
        JSR     fn_write_string_to_screen

        ; Set the player started on screen to this screen
        LDA     var_screen_number
        STA     var_player_started_on_screen_x 
        RTS        

;2C98
        ; Junk bytes
        EQUB    $00, $00, $20

;2C9B
.text_press_space_bar_to_play
        EQUS    $81,"Press ",$82,"SPACE BAR ",$81,"to play",$0D
;2CB6
.text_p_to_enter_password
        EQUS    $81,"Press",$82,"P ",$81,"to enter password",$0D
;2CD3
.text_r_to_restart 
        EQUS    $81,"Press ",$82,"R ",$81,"to restart    ",$0D,$0D,$0D,$0D
;2cf0
.text_enter_password
        EQUS    $81,"Enter password:",$0D
;2d00
.text_congrats_enter_name
        EQUS    "Congratulations. ",$83,"Enter your name",$0D
;2d22
.text_last_score
        EQUS    "Last Score : ",$0D,
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
;2D40
.text_screen_matched
        EQUB    "Screen ",$0D

;2D48
.fn_call_oswrch_and_reset_high_score
        ; Write the character to the screen 
        ; (or perform a VDU command if less than $20 / 32)
        JSR     OSWRCH

        ; Set the high score to 0
        LDA     #$00
        STA     var_high_score_lsb
        STA     var_high_score_mlsb
        STA     var_high_score_msb
        RTS

;2D57 - Junk Byte        
        $00
;2D58        
.text_password_screen_a
        EQUS    "Screen one",$0D,$0D
;2D64
.text_password_screen_b
        EQUS    "Chameleon",$0D,$0D,$0D
;2D70
.text_password_screen_c
        EQUS    "Terrapin",$0D,$0D,$0D,$0D
;2D7C        
.text_password_screen_d
        EQUS    "Sidewinder",$0D,$0D
;2D88
.text_password_screen_e
        EQUS    "Gecko",$0D,$0D,$0D,$0D,$0D,$0D,$0D
;2D94        
.text_password_screen_f
        EQUS    "Python",$0D,$0D,$0D,$0D,$0D,$0D
;2DA0
.text_password_screen_g
        EQUS    "Salamander",$0D,$0D
;2DAC        
.text_password_screen_h
        EQUS    "Iguana",$0D,$0D,$0D,$0D,$0D,$0D
;2DB8        
.text_password_screen_i
        EQUS    "Cuttlefish",$0D,$0D
;2DC4
.text_password_screen_j
        EQUS    "Octopus",$0D,$0D,$0D,$0D,$0D
;2DD0        
.text_password_screen_k
        EQUS    "Giant clam",$0D,$0D
;2DDC        
.text_password_screen_l
        EQUS    "The kraken",$0D,$0D
;2DE8
.data_password_lsb_lookup_table
        ; Screen to password lookup table
        ; Provides the LSB for the memory address
        ; of the password which is used with $2Dxx
        ; to print the string on the screen and
        ; also to compare input
        ; Screen A
        EQUB    #LO(text_password_screen_a)
        EQUB    #LO(text_password_screen_b)
        EQUB    #LO(text_password_screen_c)
        EQUB    #LO(text_password_screen_d)
        EQUB    #LO(text_password_screen_e)
        EQUB    #LO(text_password_screen_f)
        EQUB    #LO(text_password_screen_g)
        EQUB    #LO(text_password_screen_h)
        EQUB    #LO(text_password_screen_i)
        EQUB    #LO(text_password_screen_j)
        EQUB    #LO(text_password_screen_k)
        EQUB    #LO(text_password_screen_l)

;L2DF4
.fn_write_password_to_screen
        JSR     fn_write_string_to_screen
        JMP     L10F4


;2E00
.fn_get_player_password
        ; Set the entered password length to zero
        ; as the player hasn't entered anything yet
        LDA     #$00
        STA     zp_password_character_count
        
        ; Flush keyboard buffer and all other buffers
        JSR     fn_flush_all_buffers_cache_xpos_and_ypos

        ; Spare byte
        NOP

        ; Set the colour mask to only use
        ; the high nibble colours
        LDA     #$F0
        STA     zp_screen_colour_mask
;L2E0C
.read_next_password_character
        ; Wait and read character input
        JSR     OSRDCH

        ; Was Escape presssed (ASCII $1B/27)
        ; if not branch ahead
        CMP     #$1B
        BNE     password_check_for_delete

        ; Never executed as escape has been disabled
        ; vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

        ; OSBYTE &7E - Clear escape condition + effects
        ; Escape was pressed so clear the escape
        ; condition.
        LDA     #$7E
        JSR     OSBYTE

        ; Read the next character
        JMP     read_next_password_character
        ; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

;L2E1B
.password_check_for_delete
        ; Check to see if delete key (&7F / 127) was pressed
        ; if not, branch ahead
        CMP     #$7F
        BNE     password_check_for_return

        ; If no characters have been entered then
        ; wait for the next keypress
        LDA     zp_password_character_count
        BEQ     read_next_password_character

        ; Move the cursor back a position
        DEC     zp_password_cursor_xpos
        LDA     #$20

        JSR     fn_print_character_to_screen

        ; Move the cursor back a position
        ; as the sub-routine just called ends
        ; up incrementing it to remove the character
        DEC     zp_password_cursor_xpos

        ; Decrement the length of the user entered 
        ; password length
        DEC     zp_password_character_count

        ; Go read the next input
        JMP     read_next_password_character



;L2E31
.password_check_for_return
        ; Check to see if Return was pressed
        ; if so, branch ahead and set remaining
        ; passsword chars to $0D
        CMP     #$0D
        BEQ     fn_set_rest_of_password_to_crs

        ; Next set of checks determine if the character
        ; is in the following ranges and only displays
        ; them if they are - doesn't seem right as 
        ; some of the characters in $20 to $3A show
        ; minimap character e.g. an egg or piece of earth
        ;
        ; Display if between $20 and $3A (SPACE....:)
        ; Display if between $41 and $5A (A...Z)
        ; Display if between $61 and $7A (a....z)

        ; Check to see if it wasn't an non-display 
        ; character (less than ASCII $32 / 20), if
        ; so ignore and read next character
        ;
        ; Seems redundant as fn_print_character_to_screen
        ; does the same thing
        CMP     #$20
        BCC     read_next_password_character

        ; Don't display if >= $7B
        ; Read next character
        CMP     #$7B
        BCS     read_next_password_character

        ; Display if between $20 and $3A inclusive
        ; (SPACE...:)
        CMP     #$3B
        BCC     check_password_length_and_display

        ; Display if between $61 and $7A inclusive
        ; (A...Z)
        CMP     #$61
        BCS     check_password_length_and_display

        ; Don't display if between $3B and $40 inclusive
        ; Read next character        
        CMP     #$41
        BCC     read_next_password_character

        ; Don't display if between $5B and $60 inclusive
        ; Read next character        
        CMP     #$5B
        BCS     read_next_password_character

;L2E4D
.check_password_length_and_display
        STA     zp_password_current_character_cache
        ; Check the player hasn't entered more than 22
        ; characters, if they have ignore and wait 
        ; for them to hit return
        LDX     zp_password_character_count
        CPX     #$16
        BEQ     read_next_password_character

        ; Display the character
        JSR     fn_print_character_to_screen

        ; Cache the next character of the player
        ; entered password in memory and read
        ; next character
        LDX     zp_password_character_count
        LDA     zp_password_current_character_cache
        STA     data_player_entered_password,X
        INC     zp_password_character_count
        JMP     read_next_password_character

;...
;L2E64
.fn_set_rest_of_password_to_crs
        ; Entered passwords in memory can be up to 24 
        ; characters long - set all characters to carriage
        ; returns after the password to the end of the 
        ; memory buffer
        LDX     zp_password_character_count
        LDA     #$0D
;L2E68
.loop_set_carriage_return
        ; Set the current position to a CR
        STA     data_player_entered_password,X
        INX
        ; Have we reached the end of the memory buffer
        ; if not loop back
        CPX     #$18
        BCC     loop_set_carriage_return

        ; Set A to the length of the entered password
        LDA     zp_password_character_count
        RTS
;...

;L2E73
.fn_write_sound_music_password_to_screen
        ; Write the "Sound : " string to the screen
        JSR     fn_write_string_to_screen


        ; Set the cursor position to (11,24)
        LDX     #$0B
        LDY     #$18

        ;-----------------------------------
        ; Music :
        ;-----------------------------------
        ; Next string to write to the screen is 
        ; stored at $2E94
        ; Set the LSB to the string        
        LDA     #LO(text_music)
        STA     zp_object_or_string_address_lsb

        ; Set the MSB to the string   
        LDA     #HI(text_music)
        STA     zp_object_or_string_address_msb
        ; Write the string
        JSR     fn_write_string_to_screen

        ;-----------------------------------
        ; Password :
        ;-----------------------------------
        ; Next string to write to the screen is 
        ; stored at $2EA8
        ; Set the LSB to the string        

        ; Set the cursor position to (11,24)
        LDX     #$08
        LDY     #$1A

        ; Set the LSB to the string   
        LDA     #LO(text_password)
        STA     zp_object_or_string_address_lsb

        ; Set the MSB to the string   
        LDA     #HI(text_password)
        STA     zp_object_or_string_address_msb

        ; Write the string and return
        JMP     fn_write_string_to_screen


;2E94
.text_music
        EQUS    "Music :       (D/W)",$0D
;2EA8
.text_password
        EQUS    "Password :",$0D

;L2EB3
.fn_write_music_status_and_pwd_to_screen
        ; Set the cursor position to (19,24)
        ; to position it at after "Music : "
        LDY     #$18
        LDX     #$13

        ; NOTE code assumes "On " and "Off" are in the
        ; same page in memory as all prefixed with the 
        ; same MSB

        ; Set the string to display to be 
        ; "Off" for the music status
        LDA     #HI(text_off)
        STA     zp_object_or_string_address_msb
        LDA     #LO(text_off)
        STA     zp_object_or_string_address_lsb

        ; Check the music status - if it's
        ; on then change the string to "On "
        LDA     var_music_status
        BEQ     write_music_status

        ; Change the LSB to point at the "On "
        ; string
        LDA     #LO(text_on)
        STA     zp_object_or_string_address_lsb
;L2EC8
.write_music_status
        JSR     fn_write_string_to_screen

        ; Get the memory location of the password for the
        ; current screen and display it
        ;
        ; NOTE code assumes all passwords are in the
        ; same page in memory as all prefixed with the 
        ; same MSB
        LDX     var_screen_number
        LDA     data_password_lsb_lookup_table,X
        STA     zp_object_or_string_address_lsb
        LDA     #LO(text_password_screen_a)
        STA     zp_object_or_string_address_msb

        ; Set the cursor position to (19,26)
        ; to position it at after "Password : "        
        LDX     #$13
        LDY     #$1A

        ; Display the password
        JMP     fn_write_password_to_screen       
;...
;2EE0
.text_on
        EQUS    "On ",$0D
;2EE4
.text_off
        EQUS    "Off",$0D
;2EE8
.data_player_entered_password
        ; Used to store the characters of the 
        ; screen password as the player
        ; enters them - then campared
        ; against the ones in memory
        EQUS    "THE KRAKEN",$0D,$0D,$0D,$0D,$0D,$0D
        EQUS    $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D
;2F00
; Tiles that make up the repton logo on the start screen
INCLUDE "repton-logo.asm"
;2FC0
INCLUDE "repton-sprites.asm"
;4000 - 41FF
; Map sprite tile offsets
INCLUDE "repton-map-object-to-tile-defs.asm"
;4200
; Maps
; ...m 