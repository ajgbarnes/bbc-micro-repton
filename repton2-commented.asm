org &0A00

eventv_lsb_vector = $0220
eventv_msb_vector = $0221


; Interrupt-request vector 2 (IRQ2V)
IRQ2V_LSB = $0206
IRQ2V_MSB = $0207

OSWRCH = $FFEE
; Perfrom miscellaneous OS operation using control block to pass parameters
OSWORD = $FFF1
; Perfrom miscellaneous OS operation using registers to pass parameters
OSBYTE = $FFF4

SHEILA_6845_ADDRESS=$FE00
SHEILA_6845_DATA=$FE01

; Sheila User Via Timer 2 Control low-order counter
SHEILA_USER_VIA_R5_T1C_L = $FE64
; Sheila User Via Timer 2 Control high-order counter
SHEILA_USER_VIA_R5_T1C_H = $FE65
; Sheila User Via Timer 2 Control low-order latch
SHEILA_USER_VIA_R8_T2C_L = $FE68
; Sheila User Via Timer 2 Control High-order latch
SHEILA_USER_VIA_R9_T2C_H = $FE69
; Sheila User VIA Interrupt Enable Register
SHEILA_USER_VIA_R14_IER = $FE6E
; OS Workspace 
OS_WS_SCREEN_SIZE_PAGES=$0354
OS_WS_MSB_OF_HIMEM=$034E
OS_WS_NO_BYTES_PER_ROW_LSB=$0352
OS_WS_NO_BYTES_PER_ROW_MSB=$0353
OS_WS_SIZE_OF_SCREEN_MEMORY=$0353
OS_WS_CURRENT_MODE=$0355
WRCHV_LSB = $020E
WRCHV_MSB = $020F
IND1V_LSB =$0230
IND1V_MSB =$0231
FSCV_LSB = $021E


zp_screen_write_address_lsb = $0000
zp_screen_write_address_msb = $0001
zp_tile_load_address_lsb = $0002
zp_tile_load_address_msb = $0003
zp_sprite_parts_to_copy_or_blank = $0004
zp_tile_x_pos_cache=$0006
zp_tile_y_pos_cache=$0007
zp_general_xpos_lookup_calcs=$0008
zp_general_ypos_lookup_calcs=$0009
zp_object_or_string_address_lsb = $000A
zp_object_or_string_address_msb = $000B

; Overloaded
zp_required_sound_channel=$0000
zp_sound_block_channel_lsb=$0001
zp_sound_block_channel_msb=$0002
zp_sound_block_amplitude_lsb=$0003
zp_sound_block_amplitude_msb=$0004
zp_sound_block_pitch_lsb=$0005
zp_sound_block_pitch_msb=$0006
zp_sound_block_duration_lsb=$0007
zp_sound_block_duration_msb=$0008

zp_game_screen_column_to_draw = $000E
; Overloaded
zp_print_zero_or_not_flag =$000F
zp_game_screen_row_to_draw = $000F
zp_display_value_msb = $0010
zp_display_value_mlsb = $0011
; Overloaded
zp_display_value_lsb = $0012
zp_visible_screen_top_left_xpos_cache = $0012
zp_visible_screen_top_left_ypos_cache = $0013

zp_masked_password_character=$003F

zp_music_block_channel_lsb=$0060
zp_music_block_channel_msb=$0061
zp_music_block_amplitude_lsb=$0062
zp_music_block_amplitude_msb=$0063
zp_music_block_pitch_lsb=$0064
zp_music_block_pitch_msb=$0065
zp_music_block_duration_lsb=$0066
zp_music_block_duration_msb=$0067

zp_password_character_count = $006A
zp_password_current_character_cache = $006B
; Dual function zp address
zp_screen_write_address_lsb=$0070
zp_screen_password_lookup_lsb=$0070
zp_starting_bit_offset_lsb_cache=$0070
; Dual function zp address
zp_screen_write_address_msb=$0071
zp_screen_password_lookup_msb=$0071
zp_starting_bit_offset_msb_cache=$0071
; Dual function zp address
zp_screen_dissolve_iterations=$0072
zp_screen_password_lookup_index=$0072
zp_object_index_lsb=$0072
zp_random_byte_source_lsb=$0073
zp_object_index_msb=$0073
zp_random_byte_source_msb=$0074
zp_object_index_lsb_cache=$0074
zp_object_index_msb_cache=$0075

zp_object_id=$0076

zp_nth_object_index_lsb=$0077
zp_nth_object_index_msb=$0078

zp_current_map_cache_lsb=$0079
zp_decode_map_counter_lsb=$0079
zp_current_map_cache_msb=$007A
zp_decode_map_counter_msb=$007A
zp_string_to_display_current_byte = $007E
zp_screen_write_total_byte_counter = $007F
zp_sound_note_index=$007F
zp_password_cursor_xpos = $0080
zp_password_cursor_ypos = $0081
zp_screen_colour_mask= $0082
; Actually screen start xpos
zp_visible_screen_top_left_xpos=$008C
zp_visible_screen_top_left_ypos=$008D
zp_screen_start_address_lsb = $008E
zp_screen_start_address_msb = $008F


eventv_lsb_vector = $0220
eventv_msb_vector = $0221

var_screen_number = $0900
var_lives_left = $0901
var_random_value = $0902
var_repton_vertical_direction=$0903
var_repton_horizontal_direction=$0904
var_repton_animation_state=$0905
var_repton_idle_counter=$0906
var_main_loop_counter=$0907
var_number_diamonds_left = $0908
var_score_lsb  = $909
var_score_mlsb = $90A
var_score_msb  = $90B
var_remaining_time_lsb  = $90C
var_remaining_time_msb  = $90D
var_high_score_lsb=$090E
var_high_score_mlsb=$090F
var_high_score_msb=$0910
var_sound_status = $0911
var_music_status = $0912
; Indicates the both sound and music are on
var_both_sound_and_music_on_status = $0913
var_player_started_on_screen_x = $0914

var_score_index = $0920
var_bubble_sort_pass=$0921
var_score_to_display_offset=$0921

var_restart_pressed=$09FC
var_note_sequence_number=$09FE
var_music_rate_cycle=$09FF

; TODO RECLOCATE THIS IN MEMORY!!!!!

;0A00
INCLUDE "repton-first-chord-note.asm"
;0B00
INCLUDE "repton-second-chord-note.asm"
;0C00
INCLUDE "repton-third-chord-note.asm"
;0D00
; Spare byte?
        EQUB    $00
;0D01
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
        STA     zp_music_block_channel_lsb

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
        STA     zp_music_block_pitch_lsb
        LDA     #$00

        ; Set all MSBs to zero
        STA     zp_music_block_channel_msb
        STA     zp_music_block_amplitude_msb
        STA     zp_music_block_pitch_msb
        STA     zp_music_block_duration_msb

        ; Set the amplitude and duration to 1
        LDA     #$01
        STA     zp_music_block_amplitude_lsb
        STA     zp_music_block_duration_lsb

        ; Sounds parameter block is stored at $0600
        ; Set XY and call fn to play the sound
        LDX     #$60
        LDY     #$00
        JMP     fn_play_game_sound

        ; Spare bytes
        NOP
        NOP
        
;0D56
.fn_draw_repton
        ; Called when going back to the game
        ; before Repton is drawn on the screen

        ; Draw repton
        JSR     fn_lookup_repton_sprite_and_display

        ; Set the EVENTV / EVNTV handling routine
        ; to $0D90
        ; Set the MSB
        LDA     #HI(fn_enable_timer_2)
        STA     eventv_msb_vector

        ; Set the LSB
        LDA     #LO(fn_enable_timer_2)
        STA     eventv_lsb_vector

        ; OSBYTE &0D 
        ; Enable VSYNC event ($04) - event is generated
        ; 50 times per second at the start of vertical
        ; sync
        LDA     #$0E
        LDX     #$04
        JMP     OSBYTE

;0D6A
.fn_disable_vsync_event
        ; TODO Not sure what this does yet
        LDA     #$0E
        ; 72
        STA     zp_screen_dissolve_iterations

        ; Allow maskable interrupts
        CLI

        ; Continues below

;0D6F
.fn_disable_vsync_event_only
        ; OSBYTE &0D 
        ; Disable VSYNC event ($04)
        LDA     #$0D
        LDX     #$04
        JMP     OSBYTE

;0D76
.fn_reset_palette_music_and_vsync
        ; Reset 
        JSR     fn_dissolve_screen

        LDA     #$FF
        STA     var_note_sequence_number
        RTS

;0D7F
.fn_play_game_sound
        ; Check to see if both sound and music are on
        ; if not branch to the end
        LDA     var_both_sound_and_music_on_status
        BEQ     skip_play_sound

        ; If the sound pitch is zero skip playing
        ; the sound
        LDA     zp_music_block_pitch_lsb
        BEQ     skip_play_sound

        ; OSWORD &07
        ; Perform a sound command
        ; XY contains the sound parameter address block
        LDA     #$07
        JSR     OSWORD

;0D8D
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

;0DAA
.fn_disable_timer_2
        ; Disable Timer 2 on the User VIA
        ; by called the User VIA Interrupt Enable
        ; Register (IER)
        ; 0010 0000
        LDA     #$20
        STA     SHEILA_USER_VIA_R14_IER
        LDA     L00FC
        RTI        

        ; Spare bytes - 2
        EQUB    $00,$00

.L0DB4
; TODO
        JSR     fn_play_music_sound

        JMP     fn_disable_vsync_event_only

        JSR     fn_calc_screen_address_from_x_y_pos

        JMP     fn_wait_for_vertical_sync

;0DC0
.text_out_of_time
        EQUS    " Out of time. "
        EQUB    $0D
        
        ; Spare Byte - 1
        EQUB    $00

;0DD0
.fn_check_out_of_time
        ; Processor is in BCD mode at this point
        ; So if the time remaining MSB has gone
        ; from 00 to 99 (i.e. 00 - 1 = 99 in BCD)
        ; then time is up!

        ; Check if time is up
        CMP     #$99

        ; If there is still time remaining then branch ahead
        ; and return
        BNE     fn_check_out_of_time

        ; Out of time...

        ; Switch off binary coded decimal mode
        CLD

        ; Allow maskable interrupts
        CLI

        ; Clear the carry flag
        CLC

        ; Set the colour mask (to yellow and black)
        LDA     #$F0
        STA     zp_screen_colour_mask

        ;-----------------------------------
        ;  Out of time. 
        ;-----------------------------------
        ; String to write to the screen is 
        ; stored at $0DC0
        ; Set the LSB to the string
        LDA     #LO(text_out_of_time)
        STA     zp_string_to_display_lsb

        ; Set the MSB to the string
        LDA     #HI(text_out_of_time)
        STA     zp_string_to_display_msb

        ; Set the cursor position to (09,19)
        LDX     #$09
        LDY     #$13

        ; Write the string to the screen
        JSR     fn_write_string_to_screen

        ; Dsiplay the message for 1.6 seconds
        ; (80 * 20ms)
        LDX     #$50
;0DEC
.loop_wait_for_1600ms
        ; Wait for 20 ms
        JSR     fn_wait_for_vertical_sync

        ; Continue to wait until the counter
        ; reaches zero
        DEX
        BNE     loop_wait_for_1600ms

        ; Kill repton 
        JMP     fn_kill_repton

;0DF5
.fn_check_out_of_time
        RTS

        ; Spare bytes - 10
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
;0E00
        ; Spare bytes - 2
        EQUB    $0D,$FF

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
        ; ... ($3B60 - Monster left hand up)
        ; ... ($3B80 - Monster right hand up)
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
.repton_moving_left_sprite_lookup
        ; $06 - Repton Moving left,  left hand back
        ; $07 - Repton Moving left,  left hand slightly back
        ; $08 - Repton Moving left,  left hand slightly forward
        ; $09 - Repton Moving left,  left hand forward
        EQUB    $06,$06,$07,$08,$09,$09,$08,$07
;0E2A
.repton_moving_right_sprite_lookup
        ; $02 - Repton Moving right, right hand forward
        ; $03 - Repton Moving right, right hand slightly forward
        ; $04 - Repton Moving right, right hand slightly back
        ; $05 - Repton Moving right, right hand back
        EQUB    $02,$02,$03,$04,$05,$05,$04,$03
;0E32
.repton_standing_idle_looking
        ; $0A - Repton Standing
        ; $0B - Repton Standing looking right
        ; $0C - Repton Standing looking left
        EQUB    $0A,$0B,$0A,$0C

;0E36
.data_map_object_required_bit_mask
        ; This table is used to look up the required bit
        ; when decompressing an object from the stored
        ;  and encoded maps 
        ; 
        ; Bit Bit mask
        ; --- --------
        ;  0  00000001 ($01)
        ;  1  00000010 ($02)
        ;  2  00000100 ($04)
        ;  3  00001000 ($08)
        ;  4  00010000 ($10)
        ;  5  00100000 ($20)
        ;  6  01000000 ($40)
        ;  7  10000000 ($80)
        EQUB    $01,$02,$04,$08,$10,$20,$40,$80      
;0E3E
.data_partial_sprite_offset_lookup_lsb
        ; Used when drawing moving rocks or eggs or monsters
        ; on the screen to find the partial starting point 
        ; offset for the sprite - for example, if a rock is
        ; only half on the top of the screen then add $0280
        ; to the sprite address to get to the start of the second
        ; half of the rock
        EQUB    $00,$C0,$80,$40
;0E42
.data_partial_sprite_offset_lookup_msb
        EQUB    $00,$03,$02,$01

;0E46
.envelope_1
        ; OSWORD &08 / ENVELOPE Paramter block
        ; ENVELOPE 1,2,0,0,0,1,2,3,100,1,255,254,126,126
        ; https://central.kaserver5.org/Kasoft/Typeset/BBC/Ch30.html
        EQUB    $01,$02,$00,$00,$00,$01,$02,$03
        EQUB    $64,$01,$FF,$FE,$7E,$7E

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

;0E60
; TODO EXPLAIN THESE
.data_screen_character_lookup_table
        EQUB    $73,$BC,$BD,$69,$BF,$BE,$75,$73
        EQUB    $62,$63,$C7,$73,$C3,$6C,$C2,$71
        EQUB    $5C,$5D,$5E,$5F,$60,$61,$84,$85
        EQUB    $86,$87,$C1,$6B,$66,$C6,$67,$74
        EQUB    $73,$88,$89,$8A,$8B,$8C,$8D,$8E
        EQUB    $8F,$90,$91,$92,$93,$94,$95,$96
        EQUB    $97,$98,$99,$9A,$9B,$9C,$9D,$9E
        EQUB    $9F,$A0,$A1,$C4,$72,$C5,$70,$6C
;0EA0        
        EQUB    $76,$A2,$A3,$A4,$A5,$A6,$A7,$A8
        EQUB    $A9,$AA,$AB,$AC,$AD,$AE,$AF,$B0
;0EB0
        EQUB    $B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8
        EQUB    $B9,$BA,$BB,$64,$6E,$65,$6D
;0EBF       
.data_mini_map_chararacters 
        ; Object id to mini-map characters lookup table
        ; Object id is the nth position in the table
        ;
        ; $64   Character - top left hand side rounded brick
        ; $65   Character - top right hand side rounded brick
        ; $66   Character - bottom left hand side rounded brick
        ; $67   Character - bottom right hand side rounded brick
        ; $6A   Character - left hand brick edge
        ; $6B   Character - right hand brick edge
        ; $6D   Character - top brick edge
        ; $6E   Character - bottom brick edge
        ; $6F   Character - interior brick
        ; $11   Solid curving top left side with yellow left edge
        ; $12   Solid curving top right side with yellow right edge
        ; $13   Solid curving bottom left side with yellow left edge
        ; $14   Solid curving bottom right side with yellow right edge
        ; $0D   Solid rectangle with yellow left edge
        ; $0F   Solid rectangle with yellow right edge
        ; $10   Solid rectangle with yellow top edge
        ; $0E   Solid rectangle with yellow bottom edge
        ; $0C   Solid rectangle no coloured edges
        ; $70   Character - yellow red brick
        ; $72   Character - four blocks
        ; $75   Character - two vertical oval blocks
        ; $76   Character - two horizontal oval blocks
        ; $77   Character - inverted brick
        ; $BD   Character - Safe
        ; $24   Earth segment 3
        ; $25   Earth segment 4
        ; $69   Character - earth 2
        ; $BE   Character - Key
        ; $BF   Character - Egg
        ; $C0   Character - Rock
        ; $C3   Character - Diamond
        ; $73   Black tile
        EQUB    $64,$65,$66,$67,$6A,$6B,$6D,$6E        
        EQUB    $6F,$11,$12,$13,$14,$0D,$0F,$10
        EQUB    $0E,$0C,$70,$72,$75,$76,$77,$BD
        EQUB    $24,$25,$69,$BE,$BF,$C0,$C3,$73

;0EDF
.data_screen_colour_masks
        ; In mode 5, the screen is 2 bits per pixel
        ; with the bits in the same position in the 
        ; top and bottom nibbles
        ; e.g. 01[0]1 00[0]1 where the [] represents the same pixel
        ; Masking uses both bits ($FF), just the lower bits ($0F)
        ; or just the higher bits ($F0) to choose the colour
        EQUB    $00,$0F,$F0,$FF

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

;0FB4
.fn_wait_for_vertical_sync
        ; Waits for up to 20ms
        
        ; Preserve the processor flags
        PHP

        ; Allow maskable interrupts
        CLI

;0FB6
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

;0FC7
.fn_check_if_high_score
        ; Display the Repton logo on the screen
        JSR     fn_display_repton_logo_for_high_score_entry

        ; The scores are not stored in sequence in memory
        ; from lowest to highest (or vice versa).  So this
        ; piece of code loops through the scores looking for
        ; the lowest score.  It starts by comparing
        ; the first to 99999 to see if it is lower,
        ; it it is then it caches that in $0920-$0922 and
        ; the index position in $0933. It loops through
        ; every score (again they are not in order once
        ; the player starts getting scores in the that table)
        ; and will record the lowest and its index position.

        ; Set the comparison score to high 999999 
        LDA     #$99
        STA     var_lowest_high_score_lsb
        STA     var_lowest_high_score_mlsb
        STA     var_lowest_high_score_msb

        ; Scores are stored in the correct order between
        ; $2B00 - $2B17 (3 bytes per score). Stored
        ; in Binary Coded Decimal (BCD) format but
        ; doesn't matter for the comparison
        LDX     #$00
;0FD7
.loop_find_lowest_high_score
        ; Looking for the lowest score in the high 
        ; score table
        ;
        ; Check to see if the current high score
        ; position MSB is less than the current
        ; cached score (which starts at 999999)
        LDA     data_high_scores+2,X
        CMP     var_lowest_high_score_msb

        ; If high score table score MSB is less
        ; than cached high score then branch and
        ; set the cached high score to this 
        ; high score
        BCC     cache_lower_high_score

        ; If the high score table score MSB is greater
        ; than the cached high score, branch and move 
        ; to the next score in the high score table
        BNE     get_next_high_score

        ; At this point the high score table MSB
        ; is the same as the cached high score so
        ; compare the MLSB next

        ; Check to see if the current high score
        ; position MLSB is less than the current
        ; cached score
        LDA     data_high_scores+1,X
        CMP     var_lowest_high_score_mlsb

        ; If high score table score MLSB is less
        ; than cached high score then branch and
        ; set the cached high score to this 
        ; high score
        BCC     cache_lower_high_score

        ; If the high score table score MLSB is greater
        ; than the cached high score, branch and move 
        ; to the next score in the high score table
        BNE     get_next_high_score

        ; At this point the high score table MLSB
        ; is the same as the cached high score so
        ; compare the LSB next
        LDA     data_high_scores,X
        CMP     var_lowest_high_score_lsb

        ; If high score table score LSB is less
        ; than cached high score then branch and
        ; set the cached high score to this         
        BCC     cache_lower_high_score

        ; If the high score table score LSB is greater
        ; than the cached high score, branch and move 
        ; to the next score in the high score table
        BNE     get_next_high_score

        ; At this point the high score table LLSB
        ; is the same as the cached high score so
        ; set the cached high score to this one

;0FF5
.cache_lower_high_score
        ; Cache the current lowest score
        JSR     fn_cache_lower_high_score

;0FF8
.get_next_high_score
        ; Move to the next score (each score is
        ; 3 bytes so increment X by 3)
        INX
        INX
        INX

        ; There are 8 high scores each of 
        ; 4 bytes so if X != 24 then there
        ; are still scores to process
        CPX     #$18
        BNE     loop_find_lowest_high_score

        ; Check the player's high score MSB
        ; against the lowest high score - if it
        ; is less then don't show the congratulations
        ; screen
        LDX     var_lowest_high_score_index
        LDA     var_score_msb
        CMP     data_high_scores+2,X
        ; If player high score MSB was lower than
        ; the lowest high score, branch ahead
        BCC     end_check_if_high_score

        ; If it was greater than display congratulations
        BNE     display_congratulations

        ; Otherwise the player high score MSB was the
        ; same as the lowest high score MSB so check
        ; the MLSB
        ;
        ; Check the player's high score MLSB
        ; against the lowest high score - if it
        ; is less then don't show the congratulations
        ; screen
        LDA     var_score_mlsb
        CMP     data_high_scores+1,X

        ; If player high score MLSB was lower than
        ; the lowest high score, branch ahead
        BCC     end_check_if_high_score

        ; If it was greater than display congratulations
        BNE     display_congratulations

        ; Otherwise the player high score LSB was the
        ; same as the lowest high score LSB so check
        ; the LSB
        LDA     var_score_lsb
        CMP     data_high_scores,X

        ; If player high score LSB was lower than
        ; the lowest high score, branch ahead
        BCC     end_check_if_high_score

        ; If it was greater than display congratulations
        BNE     display_congratulations

        ; At this point they are they same - so if
        ; the player high score equals the lowest high
        ; score it will display congratulations too

;1020
.display_congratulations
        ; Set the cursor position to (0,15)
        LDX     #$00
        LDY     #$0F

        ;-----------------------------------
        ; Congratulations. Enter your name
        ;-----------------------------------
        ; String to write to the screen is 
        ; stored at $2D00
        ; Set the LSB to the string        
        LDA     #HI(text_congrats_enter_name)
        STA     zp_string_to_display_msb

        ; Set the MSB to the string        
        LDA     #LO(text_congrats_enter_name)
        STA     zp_string_to_display_lsb

        ; Write string to screen
        JSR     fn_write_string_to_screen

        ; Display the high score name entry field
        JSR     fn_display_high_score_name_entry_field

        ; Spare byte - 1
        NOP

        ; Let the player enter their name
        JSR     fn_get_player_password_or_name

        ; Update lowest high score entry with
        ; the player's name and score
        JSR     fn_replace_lowest_high_score_with_current

;1039
.end_check_if_high_score
        ; Reinitialise and restart the game
        JMP     fn_initiliase_game_after_restart

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
        ; or more simply
        ;
        ; R = 3 * ((S + T1H) EOR T1C)
        ;
        ; In BASIC (Note S starting value can be anything)
        ;
        ; 10 S = 20
        ; 20 T1H = ?&FE65
        ; 30 T1C = ?&FE64
        ; 40 R = 3 * ((S + T1H) EOR T1C)
        ; 50 PRINT ~R
        ; 60 GOTO 20
        ;
        LDA     var_random_value
        ADC     SHEILA_USER_VIA_R5_T1C_H
        EOR     SHEILA_USER_VIA_R5_T1C_L
        STA     var_random_value
        ROL     A
        ADC     var_random_value
        STA     var_random_value

        ; Note that $0902 is never read outside
        ; this sub-routine, A is used on return
        RTS

;1058
.end_play_music_sound
        ; Restore A the amplitude
        PLA
        RTS

;105A
.fn_play_music_sound
        ; On entry:
        ; $0000 contains the required sound channel
        ;     A contains the amplitude
        ;     X contains the pitch (note)
        ;     Y contains the duration (in 1/20ths of a second)

        ; Store the amplitude temporarily on the stack
        ; whilst the sound status is switched off
        PHA

        ; Check to see if Sound is switched off
        ; (not music weirdly - bug?) and don't
        ; play the music if sound is off
        LDA     var_sound_status
        BEQ     end_play_music_sound

        ; Restore the amplitude
        PLA

        ; Store the amplitude in the
        ; sound parameter block
        STA     zp_sound_block_channel_msb 

        ; Store the pitch (note) in the
        ; sound parameter block
        STX     zp_sound_block_pitch_lsb

        ; Store the duration in the
        ; sound parameter block        
        STY     zp_sound_block_duration_lsb

        ; Set the MSBs to zero for duration, pitch
        ; and amplitude
        LDX     #$00
        STX     zp_sound_block_duration_msb
        STX     zp_sound_block_pitch_msb
        STX     zp_sound_block_channel_msb

        ; Sound channel is passed in $0000 
        ; so load it and set it in the sound
        ; parameter block
        LDX     zp_required_sound_channel
        STX     zp_sound_block_channel_lsb

        ; vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
        ; Setting X here doesn't do anything
        ; it seems as it's immediately set
        ; in the next block under play_sound
        ; to the zero page location of the
        ; sound block
        LDX     #$FF

        ; This one line DOES do something as the 
        ; amplitude is set in play_sound
        ; to the sound parameter block location
        TAY

        ; Jump to play_sound if amplitude
        ; is negative (N set during TAY)
        BMI     play_sound

        ; Does nothing
        LDX     #$00
        ; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

;107A
.play_sound
        ; Store Y in the sound block parameter
        ; MSB for amplitude - doesn't seem to 
        ; do anything though... maybe this
        ; should have been STX? Bug?
        STY     zp_sound_block_amplitude_msb

        ; OSWORD &07        
        ; Play sound from parameters at $0001
        LDX     #LO(zp_sound_block_channel_lsb)
        LDY     #HI(zp_sound_block_channel_lsb)
        LDA     #$07
        JMP     OSWORD

;1085
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

;108F
.fn_define_logical_colour
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

;10B1
.fn_calc_screen_address_from_x_y_pos
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
;10C1
.end_calc__screen_address_from_x_y_pos
        TAY
        RTS

;10C3
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
;10CF
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
;10DB
.end_check_sound_keys
        RTS

;10DC
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

        ; Kill repton
        JMP     fn_kill_repton        

;10F3
.end_check_for_key_press
        RTS

;10F4
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
        STA     zp_map_x
        STA     zp_map_y

        ; Cache the current top left hand corner
        ; of the visible screen
        ; Cache the xpos
        LDA     zp_visible_screen_top_left_xpos
        STA     zp_visible_screen_top_left_xpos_cache


        ; Cache the ypos
        LDA     zp_visible_screen_top_left_ypos
        STA     zp_visible_screen_top_left_ypos_cache

        ; Reset the xpos and ypos to (0,0)
        LDA     #$00
        STA     zp_visible_screen_top_left_xpos
        STA     zp_visible_screen_top_left_ypos

;1119
.loop_display_map_object
        ; Each map contains 32 x 32 objects e.g. 
        ; Rock or Earth or Egg or solid wall etc
        ; Loop through them all and draw them to the 
        ; screen 

        LDX     zp_map_x
        LDY     zp_map_y

        ; Lookup the object the is at (x,y)
        JSR     fn_lookup_screen_object_for_x_y

        ; Lookup the display tile / character for the
        ; current object id and display it on the map
        JSR     fn_lookup_map_character_and_display

        INC     zp_map_x
        LDA     zp_map_x

        ; Check that x is less than 32
        ; (the row length hasn't been exceeded)
        CMP     #$20

        ; Display the next map object if < 32   
        BNE     loop_display_map_object

        ; Move to the next row and reset x to 0
        LDA     #$00
        STA     zp_map_x
        INC     zp_map_y

        ; Check that y is less than 32
        ; (the row length hasn't been exceeded)        
        LDA     zp_map_y
        CMP     #$20

        ; Display the next map object if < 32
        BNE     loop_display_map_object

        ; Wait for the player to press the 
        ; space bar to return to the status screen
        JSR     loop_wait_for_space_bar_on_screen

        ; Spare bytes - 4
        NOP
        NOP
        NOP
        NOP

        ; Restore the cached xpos and ypos for the
        ; visible game screen top left corner
        LDA     zp_visible_screen_top_left_xpos_cache
        STA     zp_visible_screen_top_left_xpos
        LDA     zp_visible_screen_top_left_ypos_cache
        STA     zp_visible_screen_top_left_ypos
        PLA
        PLA

        ; Display the Repton status screen
        JMP     fn_display_repton_start_screen

;114B
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

;1190
.end_write_3_byte_display_value_to_screen
        RTS

;1191
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

;119B
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

;11A5
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
;11AE
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

;11BD
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

;11CB
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

;11DF
.check_if_user_defined_character
        ; Check if it's a normal ASCII character
        ; if so, branch ahead
        CMP     #$80
        BCC     check_if_normal_character

        ; Greater than $80 so need to look up the
        ; colour mask. The colour mask is used 
        ; to mask out the colour - values are either $00, $0F, $F0 or $FF
        ;
        ; So looks like anything $80 and above just sets the colour mask
        ; based on the bottom three bits
        ;
        ; In mode 5, the screen is 2 bits per pixel
        ; with the bits in the same position in the 
        ; top and bottom nibbles
        ; e.g. 01[0]1 00[0]1 where the [] represents the same pixel
        ; Masking uses both bits ($FF), just the lower bits ($0F)
        ; or just the higher bits ($F0) to choose the colour        
        AND     #$03
        TAX
        LDA     data_screen_colour_masks,X
        STA     zp_screen_colour_mask

        JMP     end_print_character_to_screen

;11EE
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
;1208
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


;1216
.fn_print_character_and_increment_xpos
        PHP
        NOP
        JSR     fn_write_tile_to_screen

        JMP     move_to_next_x_pos
;...
; TODO FOUR PAGES
;...

;16E2
.fn_wait_120ms

        ; Wait 6 * 20 ms = 120 ms
        LDX     #$06
        
        ; Loop around 6 times waiting
        ; for vertical sync (up to 120ms)
;16E4
.loop_wait_for_vsync_fn
        ; Wait up to 20ms
        JSR     fn_wait_for_vertical_sync

        ; If still need to wait then loop back
        DEX
        BNE     loop_wait_for_vsync_fn

        RTS

;16EB
.fn_decrement_remaining_time
        ; Set the processor into BCD mode
        ; for time remaining manipulation
        SED

        ; Subtract one from the LSB of
        ; time remaining
        LDA     var_remaining_time_lsb
        SEC
        SBC     #$01
        STA     var_remaining_time_lsb

        ; If the LSB went from 00 to 99
        ; then need to decrement the MSB
        CMP     #$99
        BNE     end_decrement_remaining_time

        ; Subtract one from the MSB of
        ; time remaining
        LDA     var_remaining_time_msb
        SEC
        SBC     #$01
        STA     var_remaining_time_msb

        ; Check to see if the player is out of 
        ; time - happens when the MSB goes from
        ; 00 to 99 
        JSR     fn_check_out_of_time

        ; Spare byte - 1
        NOP
;1706
.end_decrement_remaining_time
        ; Switch off binary coded decimal mode
        CLD
        RTS        

;1708
.fn_kill_repton
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

        ; Repton is in the middle of the screen
        ; at an offset of (14,14) so add
        ; 14 to xpos to get his position
        LDA     zp_visible_screen_top_left_xpos
        CLC
        ADC     #$0E
        TAX

        ; Repton is in the middle of the screen
        ; at an offset of (14,14) so add
        ; 14 to ypos to get his position
        LDA     zp_visible_screen_top_left_ypos
        CLC
        ADC     #$0E
        TAY

        LDA     #$00
        JSR     fn_draw_or_blank_object

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
        JSR     fn_play_music_sound

        ; Spare byte - 1
        NOP

        ; Wait 120ms
        JSR     fn_wait_120ms

        ; Doesn't do anything - Spare bytes - 2
        ; (Value not used)
        LDA     #$0F

        ; Reduce the number of lives the player
        ; has by one
        DEC     var_lives_left

        ; If the player has run out of lives
        ; (value is negative) then reset the
        ; game, otherwise branch ahead
        BMI     player_out_of_lives

        ; Reset the game
        JMP     fn_reset_and_show_start_screen

;1788
.player_out_of_lives
        ; Player has exhausted all my lives
        ; Did they achieve a high score? 
        ; If so update the player high score
        ; in memory
        JSR     fn_check_and_update_high_score

        ; Get the player name and 
        ; pdate the high score table to include
        ; the player name and score
        JMP     fn_check_if_high_score

;178E
.fn_wait_600ms_then_initialise_game
        ; Number of times to wait for 20ms
        ; So wait fro 30 * 20ms = 600ms
        LDX     #$1E

;1790
.loop_wait_another_20ms
        ; Wait for 20ms (until a vsync occurs)
        JSR     fn_wait_for_vertical_sync

        ; Waited for 600ms yet or 30 times
        ; around the loop - if not loop again
        DEX
        BNE     loop_wait_another_20ms

        ; Initialise game
        JMP     fn_initialise_game_after_restart_no_high_score

;1799
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

;17A8
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

        ; Spare Bytes - 2 
        NOP 
        NOP

;17AF
.fn_update_high_score_reset_music
        JSR     fn_check_and_update_high_score

        JMP     fn_reset_palette_music_and_vsync

;17B5
.fn_display_repton_start_screen
        JSR     fn_update_high_score_reset_music
        
        ; This is almost identical to $25A6

        ; The Repton logo isn't a bitmap graphic as such
        ; it's a series of user defined characters
        ; the same ones used for the map - and 
        ; that's how it's defined in memory.  So
        ; load the charactes and display the right
        ; tile / user defined character

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

;18E5
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

;1919
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

;1947
.after_sound_status
        JSR     fn_write_music_status_and_pwd_to_screen

        ; Check to see if the Password key P was pressed
        ; and show the password screen if it was - only 
        ; if a game has not yet been started.  Also calls
        ; the routine to check the r, d, w keys
        JSR     fn_check_p_key

        ; Check to see if the player has 
        ; pressed the space bar to start or return
        ; to a game
        ; INKEY $9D is SPACE
        LDA     #$9D
        JSR     fn_read_key

        ; If space was pressed go to the end
        BNE     process_space

        ; Check to see if the escape key was pressed
        ; and 
        JSR     fn_check_escape_key

        JMP     write_sound_status_to_screen

;195A
.process_space
        JMP     fn_check_intro_music

;195D
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

;1977
.fn_remove_repton
        ; Works out the screen address where repton 
        ; is currently visible and removes him
        ;
        ; The visible screen holds 8x8 objects
        ;
        ; This equates to 32x32 tiles as each
        ; object is 4x4 tiles
        ;
        ; Repton's first tile position is (14,14)
        ; on the 32x32 grid
        ; and the screen address is calculated for that
        ; starting position

        ; Set the location to the middle of the screen
        ; As it's Repton's position (14,14)
        LDX     #$0E
        LDY     #$0E
        JSR     fn_calc_screen_address_from_x_y_pos

        ; Store the screen address where Repton should
        ; be removed
        STX     zp_tile_load_address_lsb
        STY     zp_tile_load_address_msb

        ; Repton is made of 4 vertical body parts
        ;    Head   
        ;    Torso  
        ;    Legs
        ;    Feet
        ;
        ; Each body part is 8 bytes high 
        ; Each body part is 4 bytes wide

        ; Used to iterate through the body parts
        ; hence 4 
        LDA     #$04
        STA     zp_sprite_parts_to_copy_or_blank
;1986
.loop_blank_next_tile_byte
        ; Y is used to blank all the horizontal
        ; columns for the sprite
        LDY     #$00

        ; X is used to blank all 4 bytes wide
        ; for the current sprite part and tile row
        LDX     #$00

;198A
.loop_blank_next_tile_byte
        ; Blank a byte of data on the screen
        LDA     #$00
        STA     (zp_tile_load_address_lsb),Y

        ; Each tile is 8 bytes high so blank each 
        ; byte of the tile (loop until done)
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
;19A5
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
;19B5
.skip_memory_subtraction_for_blank_2
        DEC     zp_sprite_parts_to_copy_or_blank
        BNE     loop_blank_next_tile_byte

        RTS

;19BA
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

;19CA
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
;19D9
.copy_4_same_row_tiles_to_screen
        ; Y is used to copy all the horizontal
        ; columns for the sprite in particular part
        LDY     #$00

        ; X is used to copy all four sprite parts
        ; Head, torso, legs, feet
        LDX     #$00
;19DD
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
;19F8
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
;1A15
.skip_memory_subtraction_2
        ; Any remaining sprite parts? If so loop back
        DEC     zp_sprite_parts_to_copy_or_blank
        BNE     copy_4_same_row_tiles_to_screen

        RTS        


;1A1A
.end_draw_or_blank_object
        PLA
        RTS

;1A1C
.fn_draw_or_blank_object
        ; Called when a rock or egg drops or egg cracks
        ; or monster moves - this took a LONG time to work
        ; out what it was doing...
        ; 
        ; Blanks a whole or partial object or draws 
        ; a whole or partial a rock or egg or 
        ; cracked egg or monster on the screen based
        ; on the tile starting position in X and Y
        ;
        ; X and Y are based on 0-255 values but in reality
        ; a valid map position is only 0-127 and anything
        ; higher is considered off map so as long as the
        ; off map default object is immoveable then only
        ; 0-127 values will be seen
        ; 
        ; On entry:
        ;     A - $00 blank the object at tile 
        ;             at starting positon held in X Y
        ;       - $01 draw a monster (routine doesn't care
        ;             what it draws)
        ;       - $FF draw rock or egg (routine doesn't care
        ;             what it draws)
        ;     X - object's first tile starting x position 
        ;     Y - object's first tile starting y position 
        ; $0000 - LSB for the object first tile to draw
        ; $0001 - MSB for the object first tile to draw
        ;
        ; Complexity in the sub-routine is around working out
        ; partial screen blanks on the edges of the screen as on the
        ; top/bottom/left/right of the screen only half an object is shown
        ; and for the monster it jitters so 1/4 or 3/4s may be shown
        ;
        ; Routine basically does this
        ;  1. Make X and Y relative to top corner by subtracting the top left co-ordinates
        ;  2. Add 4 to X (to avoid dealing with negative numbers for partial objects on the left)
        ;  3. Add 4 to Y (to avoid dealing with negative numbers for partial objects at the top of the screen)
        ;  4. Check X < $24 (return otherwise)
        ;  5. Check Y < $24 (return otherwise)
        ;  6. Check X != 0  (return otherwise)
        ;  7. Check Y != 0  (return otherwise)
        ;  8. (a) Check X < $21 (b) otherwise if $21 =< X < 24 work out how many horizontal parts to show
        ;  9. (a) Check Y < $21 (b) otherwise if $21 =< Y < 24 work out how many vertial parts to show and adjust start position of sprite tile source
        ; 10. (a) Check X >= $04 (b) otherwise if X < 4 work out how many horizontal parts to show
        ; 11. (a) Check Y >= $04 (b) otherwise if Y < 4 work out how many vertial parts to show and adjust start position of sprite tile source
        ; 12. X = X - 4 (DEC X is performed 4 times)
        ; 13. Y = Y - 4 (DEC Y is performed 4 times)
        ; 14. Get screen address at (X, Y)
        ; 15. (a) Blank or (b) write object to screen address but iterating through tiles
        ;     for all allow parts shown (either whole or partial object)

        ; Cache the value of A which indicates whether to 
        ; draw ($FF or $01) an object or blank it ($00)
        PHA

        ; (1) Make X relative to a top left of (0,0)
        ; by subtracting the top left xpos
        TXA
        SEC
        SBC     zp_visible_screen_top_left_xpos

        ; (2) Left object is off screen so would have a negative
        ; X at this point so add 4 to make all values positive
        ; for easier maths
        CLC
        ADC     #$04
        TAX

        ; (1) Make Y relative to a top left of (0,0)
        ; by subtracting the top left ypos
        TYA
        SEC
        SBC     zp_visible_screen_top_left_ypos

        ; (3) Top object is off screen so would have a negative
        ; Y at this point so add 4 to make all values positive
        ; for easier maths
        CLC
        ADC     #$04
        TAY

        ; (4) Make sure the tile is still onscreen otherwise
        ; nothing to draw or blank
        ; Check X not greater than or equal to $24 / 36
        CPX     #$24
        BCS     end_draw_or_blank_object

        ; (5) Make sure the tile is still onscreen otherwise
        ; nothing to draw or blank
        ; Check Y not greater than or equal to $24 / 36
        CPY     #$24
        BCS     end_draw_or_blank_object

        ; (6) Make sure the tile is still onscreen otherwise
        ; nothing to draw or blank
        ; Check X is not zero 
        CPX     #$00
        BEQ     end_draw_or_blank_object

        ; (7) Make sure the tile is still onscreen otherwise
        ; nothing to draw or blank
        ; Check Y is not zero 
        CPY     #$00
        BEQ     end_draw_or_blank_object

        ; Default width and height of an object in tiles
        ; Gets adjusted in a workign copy for objects 
        ; only partially on screen
        LDA     #$04
        STA     zp_object_width_default_counter
        STA     zp_object_height_default_counter

        ; (8a) Check X < $21 / 33 branch if less than as
        ; no partial object calculations need to be done
        CPX     #$21
        BCC     check_y_bottom_edge

        ; (8b) If X >= $21 and X < $24
        ; 
        ; Calculate how many tiles need to be copied between
        ; the position in X and the edge of the screen 
        ; this is done by subtracting Y from $24 - for rocks
        ; and eggs this will always be 2 but for jittery
        ; monsters could be 0-3
        STX     zp_temp_calc

        ; Subtract X from $24       
        LDA     #$24
        SEC
        SBC     zp_target_screen_address_lsb
        STA     zp_object_width_default_counter

;1A50
.check_y_bottom_edge

        ; (9a) If Y < $21 / 33 branch if less than as
        ; no partial object calculations need to be done
        CPY     #$21
        BCC     check_x_left_edge

        ; (9b) If Y >= $21 and Y < $24
        ; 
        ; Calculate how many tiles need to be copied between
        ; the position in Y and the edge of the screen 
        ; this is done by subtracting Y from $24 - for rocks
        ; and eggs this will always be 2 but for jittery
        ; monsters could be 0-3
        STY     zp_temp_y_calc
        LDA     #$24
        SEC
        SBC     zp_temp_y_calc
        STA     zp_object_height_default_counter
;1A5D
.check_x_left_edge
        ; (10a) If X >= $04 branch if greater than or equal as
        ; no partial object calculations need to be done
        CPX     #$04
        BCS     check_y_top_edge

        ; (10b) X < 4 but by default contains the 
        ; the number of horizontal tiles to copy
        ; But because it's the left edge need to invert
        ; which tiles are needed
        TXA
        STA     zp_object_width_default_counter

        ; This means:
        ; If A is 0 - 0000 0000 EOR 0000 0011 = 0000 0011
        ; If A is 1 - 0000 0001 EOR 0000 0011 = 0000 0010
        ; If A is 2 - 0000 0010 EOR 0000 0011 = 0000 0001
        ; If A is 3 - 0000 0011 EOR 0000 0011 = 0000 0000
        EOR     #$03

        ; Add 1 to make it 1-4 based for the multiplication
        ; and multiply by 8 so it gives the nth tile that
        ; needs to be copied first
        CLC
        ADC     #$01

        ; Multiply by 8
        ASL     A
        ASL     A
        ASL     A

        ; Add this to the memory location of the source
        ; tile to get to the nth tile of this object's
        ; horizontal row first
        CLC
        ADC     zp_source_tile_lsb
        STA     zp_source_tile_lsb
        LDA     zp_source_tile_msb
        ADC     #$00
        STA     zp_source_tile_msb

        ; Set X to 4 now so when it's DEC 4 times
        ; it goes to zero
        LDX     #$04
;1A79
.check_y_top_edge
        ; (11a) If Y >= $04 branch if greater than or equal as
        ; no partial object calculations need to be done
        CPY     #$04
        BCS     adjust_x_and_y

        ; If a rock is only partially on the screen
        ; at the top then only need to blank or 
        ; draw half of it - this routine works out
        ; how much
        
        ; (11b) Y < 4 but by default contains the 
        ; the number of horizontal tiles to copy
        STY     zp_object_height_default_counter

        LDA     data_partial_sprite_offset_lookup_lsb,Y

        ; This is to work out which part of
        ; the rock or egg or monster to start copying from
        ; For rocks and eggs, this can only be 2 but for
        ; monsters because they jitter, it could be other
        ; values
        ; Y = 0 
        ; Y = 1 add $3C0 
        ; Y = 2 add $280
        ; Y = 3 add $140 

        ; Adjust the source tile memory address to 
        ; start at the right partial part of the object
        ; Do the LSB first
        CLC
        ADC     zp_source_tile_lsb
        STA     zp_source_tile_lsb

        ; Do the MSB additions
        LDA     data_partial_sprite_offset_lookup_msb,Y
        ADC     zp_source_tile_msb
        STA     zp_source_tile_msb

        ; Set Y to 4 now so when it's DEC'd 4 times it
        ; goes to zero
        LDY     #$04
;1A90
.adjust_x_and_y
        ; (12) Subtract 4 from X
        DEX
        DEX
        DEX
        DEX

        ; (13) Subtract 4 from X
        DEY
        DEY
        DEY
        DEY

        ; Get the new screen address which needs to be 
        ; blanked or have the rock or egg or monster
        ; written to it
        ; X and Y are the (x,y) pos?
        JSR     fn_calc_screen_address_from_x_y_pos

        ; Screen write address LSB
        STX     zp_target_screen_address_lsb
        ; Screen write address MSB
        STY     zp_target_screen_address_msb

        ; If A was $00 then blank the object
        PLA
        BEQ     fn_blank_screen_object

        ; A was $FF or $01 so draw the object

        ;----------------------------------------------
        ; 15(a) Draw the rock or egg or monster in the new position
        ;----------------------------------------------        

        ; Set the number of rows to copy in the working 
        ; counter (it gets decremented)
        LDA     zp_object_height_default_counter
        STA     zp_object_height_working_counter
;1AA6
.loop_write_object_next_row
        ; Reset the number of horizontal tiles to copy in the
        ; working counter (it gets decremented)
        LDA     zp_object_width_default_counter
        STA     zp_object_width_working_counter
        LDY     #$00

;1AAC
.loop_write_object_tile
        ; Add a rock or egg or monster to the 
        ; new position - copies
        ; the graphics from the tile memory to
        ; the screen rather than moving on screen 
        ; from one position to another (as it's already
        ; been blanked at this point)
        LDA     (zp_source_tile_lsb),Y
        STA     (zp_target_screen_address_lsb),Y

        ; Have all 8 bytes of the current tile
        ; been copied? If not, loop again
        INY
        TYA
        AND     #$07
        BNE     loop_write_object_tile

        ; Add 8 to the tile read address as each
        ; tile is 8 bytes
        CLC
        TYA
        ADC     zp_target_screen_address_lsb
        LDA     #$00
        ADC     zp_target_screen_address_msb

        ; Check to see if the screen start address
        ; has moved beyond $7FFF - this is 
        ; done by checking the MSB is still positive
        ; as when it gets to $80 or greater it's "negative"
        ; as the eigth bit is set
        BPL     write_object_tile_check_horizontal

        LDA     zp_target_screen_address_msb
        ; Wrap the screen start address around by
        ; subtracting $2000 which is the same
        ; as subtracting $20 from the MSB
        SEC
        SBC     #$20
        STA     zp_target_screen_address_msb
;1AC7
.write_object_tile_check_horizontal
        ; Have all current horiztonal parts of the
        ; sprite (all on this row) been drawn? There
        ; are 4 parts to each sprite row
        DEC     zp_object_width_working_counter
        BNE     loop_write_object_tile

        ; Move to the next row tile of the source object 
        ; by adding $140 to the address (each next object
        ; part is $140 higher in memory)
        LDA     zp_source_tile_lsb
        CLC
        ADC     #$40
        STA     zp_source_tile_lsb
        LDA     zp_source_tile_msb
        ADC     #$01
        STA     zp_source_tile_msb

        ; Increment the target screen address
        ; (each row on the screen is $FF/256 bytes)
        ; so easy maths to get to the next row...
        CLC
        INC     zp_target_screen_address_msb
        LDA     zp_target_screen_address_msb
        BPL     check_if_all_rows_copied

        ; Wrap the screen start address around by
        ; subtracting $2000 which is the same
        ; as subtracting $20 from the MSB
        SEC
        SBC     #$20
        STA     zp_tile_load_address_msb
;1AE4
.check_if_all_rows_copied
        ; Move onto the next sprite row
        DEC     zp_object_height_working_counter

        ; If still any sprite rows to
        ; write onto the screen loop back
        BNE     loop_write_object_next_row

        ; Return
        RTS      

        ;----------------------------------------------
        ; 15(b). Blank the rock or egg or monster position 
        ;---------------------------------------------
;1AE9
.fn_blank_screen_object
        ; Set the number of rows to blank in the working 
        ; counter (it gets decremented)
        LDA     zp_object_height_default_counter
        STA     zp_object_height_working_counter
;1AED
.loop_blank_object_next_row
        ; Reset the number of horizontal tiles to blank in the
        ; working counter (it gets decremented)
        LDA     zp_object_height_default_counter
        STA     zp_object_width_working_counter
        LDY     #$00
;1AF3
.loop_blank_object
        ; Blank out the rock or egg in the old position 
        ; Write $00 into the memory locations 
        LDA     #$00
        STA     (zp_target_screen_address_lsb),Y

        ; Have all 8 bytes of the current tile
        ; been blanked? If not, loop again
        INY
        TYA
        AND     #$07
        BNE     loop_blank_object

        ; Check to see if the Y index
        ; is making the memory location 
        ; go beyond $7FFF - - this is done 
        ; by adding Y and checking the MSB is still positive
        ; as when it gets to $80 or greater it's "negative"
        ; as the eigth bit is set. Calculation is not
        ; stored as above it uses an indirect lookup
        ; LDA (base address),Y
        CLC
        TYA
        ADC     zp_target_screen_address_lsb
        LDA     #$00
        ADC     zp_target_screen_address_msb

        ; If < $80xx the branch ahead
        BPL     blank_object_tile_check_horizontal

        ; Wrap the screen start address around by
        ; subtracting $2000 which is the same
        ; as subtracting $20 from the MSB
        LDA     zp_target_screen_address_msb
        SEC
        SBC     #$20
        STA     zp_target_screen_address_msb

;1B0E
.blank_object_tile_check_horizontal
        ; Have all current horiztonal parts of the
        ; sprite (all on this row) been blanked? There
        ; are 4 parts to each sprite row
        DEC     zp_object_width_working_counter
        BNE     loop_blank_object

        ; Increment the target screen address
        ; (each row on the screen is $FF/256 bytes)
        ; so easy maths to get to the next row...
        INC     zp_target_screen_address_msb

        ; Check to see if the memory location is
        ; beyond $7FFF -this is done 
        ; by checking the MSB is still positive
        ; as when it gets to $80 or greater it's "negative"
        ; as the eigth bit is set. If less than, loop
        LDA     zp_target_screen_address_msb
        BPL     check_if_all_rows_blanked

        ; Wrap the screen start address around by
        ; subtracting $2000 which is the same
        ; as subtracting $20 from the MSB
        SEC
        SBC     #$20
        STA     zp_target_screen_address_msb
;1B1D
.check_if_all_rows_blanked
        ; Move onto the next sprite row
        DEC     zp_object_width_working_counter
        BNE     loop_blank_object_next_row

        ; Return
        RTS          
;...
;1B22
.fn_update_6845_screen_start_address
        ; Changes the screen start address in the 6845 
        ; graphics chip
        ;
        ; Get the screen start address lsb/msb and cache
        LDA     zp_screen_start_address_lsb
        STA     zp_screen_start_address_lsb_div8
        LDA     zp_screen_start_address_msb
        STA     zp_screen_start_address_msb_div8

        ; Screen start address must be divided by 8 
        ; before setting
        ; 6845 registers 12 (MSB) and 13 (LSB) require
        ; the screen start address to be divided
        ; by 8 so divide by 8
        ; Accumulator holds the MSB
        ;  LSR                   ROR $76
        ; ========               ========
        ; 76543210 -> (via C) -> 7654321 -> (throw away)
        LSR     zp_screen_start_address_msb_div8
        ROR     zp_screen_start_address_lsb_div8
        LSR     zp_screen_start_address_msb_div8
        ROR     zp_screen_start_address_lsb_div8
        LSR     zp_screen_start_address_msb_div8
        ROR     zp_screen_start_address_lsb_div8

        ; Set 6845 Register to 12
        ; and give the MSB of the screen start
        ; address divided by 8

        ; Spare Bytes - 2
        ; Sub-routine that is called also sets A
        ; Sub-routing waits for vsync and 
        ; then sets SHEILA_6845_ADDRESS to #$0C/12
        LDA     #$0C
        JSR     fn_wait_for_vsync_and_set_sheila_address_to_12

        ; Give the MSB of the screen start
        ; address divided by 8
        LDA     zp_screen_write_address_msb
        STA     SHEILA_6845_DATA

        ; Set 6845 Register to 13
        ; and give the LSB of the screen start
        ; address divided by 8        
        LDA     #$0D
        STA     SHEILA_6845_ADDRESS
        LDA     zp_screen_write_address_lsb
        STA     SHEILA_6845_DATA

        ; Return
        RTS

;1B4B
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
        ; to move from 128 x 128 co-ordinates to 32x32
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

;1BB4
.set_default_off_screen_object
        ; Set the string to display to $E0E0 (garbage)
        ; if beyond the end of a row or beyond
        ; the last row on the screen
        LDA     #$E0
        STA     zp_object_or_string_address_lsb
        STA     zp_object_or_string_address_msb
        LDA     #$16
        RTS


;1BBD
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

;1BEC
.end_display_tile
        ; Reload the current tile from the stack
        ; Actually just clears the value from the stack
        PLA
        RTS

;1BEE
.fn_lookup_map_character_and_display
        ; Cache the x coordinate
        STX     zp_map_x_cache

        ; (Defensively) make sure the object id
        ; is < 32 for the lookup table for the mini
        ; map character.  So only keep the bottom
        ; 5 bits by ANDing with 0001 1111 ($1F)
        AND     #$1F
        TAX

        ; Get the mini-map character id to use
        ; for the current object id
        LDA     data_mini_map_chararacters,X

        ; Restore the x coordinate
        LDX     zp_map_x_cache

        ; Display the character on screen in the 
        ; position marketed by X and Y
        JMP     fn_display_tile

;1BFB
.fn_display_tile
        ; Preserve A - on entry it contains the 
        ; tile to write to the screen
        PHA

        ; The display tile routine works assuming a 
        ; a top left corner of 0,0 hence, the x and y
        ; coordinates need to be adjusted to 0,0.  This
        ; is performed by taking the desired x and y and 
        ; subtracing the top left co-ordinates from them
        ;
        ; So if (topleftx, toplefty) is (2,4)
        ;
        ; And the drawing co-ordinate is (15,19)
        ;
        ; Then the absolute position from the top left of
        ; the screen would be (15-2,19-4) = (13,15)

        ; Adjust the X coordinaet
        TXA
        SEC
        SBC     zp_visible_screen_top_left_xpos
        TAX
        
        ; If the xpos is beyond the end of the row
        ; then don't do anything
        CPX     #$20
        BCS     end_display_tile

        ; Adjust the Y coordinate
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

        ; Redundant? Spare bytes - 2?
        PLA
        PHA

        ; Rest the MSB of tile load address
        LDA     #$00
        STA     zp_tile_load_address_msb

        ; Retrieve the tile to write to the screen
        PLA

        ; Calculate tile load address
        ; Tile load address = (tile number * 8) + $2FC0        

        ; Multiply by 8
        ASL     A
        ROL     zp_tile_load_address_msb
        ASL     A
        ROL     zp_tile_load_address_msb
        ASL     A
        ROL     zp_tile_load_address_msb

        ; Add $2FC0
        CLC
        ADC     #LO(data_tiles)
        STA     zp_tile_load_address_lsb
        LDA     zp_tile_load_address_msb
        ADC     #HI(data_tiles)
        STA     zp_tile_load_address_msb

        ; Copy the tile to the screen (each tile is 8 bytes)
        LDY     #$07
;1C32
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

;1C3A
.fn_write_tile_to_screen

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
;1C61
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

;1C6B
.fn_move_repton_down
        ; This routine does the following:
        ; 1. Blanks the current repton sprite
        ; 2. Updates the screen start address
        ; 3. Updates the top left (xpos,ypos)
        ; 4. Adds next repton sprite to the middle of the screen
        ; 5. Draws new line of tiles at the bottom of the screen

        ; Remove repton from the screen
        JSR     fn_remove_repton

        ; Move the screen down a row
        INC     zp_visible_screen_top_left_ypos

        ; Each screen row of bytes is 256 ($FF) bytes long
        ; so just increase the MSB of the screen start address
        ; to move to the next row
        INC     zp_screen_start_address_msb

        ; Check to see if the screen start address
        ; has moved beyond $7FFF - this is 
        ; done by checking the MSB is still positive
        ; as when it gets to $80 or greater it's "negative"
        ; as the eigth bit is set
        LDA     zp_screen_start_address_msb
        BPL     store_new_screen_start_address_for_down

        ; Wrap the screen start address around by
        ; subtracting $2000 which is the same
        ; as subtracting $20 from the MSB
        SEC
        SBC     #$20
;1C79
.store_new_screen_start_address_for_down
        ; Store the screen start address MSB
        ; after manipulation (don't need to 
        ; do this for just the INC but it's done
        ; anyway)
        STA     zp_screen_start_address_msb

        ; Perform the hardware scroll
        JSR     fn_update_6845_screen_start_address

        ; Display the new repton sprite in the
        ; middle of the screen now the screen has moved
        JSR     fn_lookup_repton_sprite_and_display

        ; Get the current xpos on the 32x32 grid of the
        ; top left corner - bottom row will have the 
        ; same xpos
        LDA     zp_visible_screen_top_left_xpos
        STA     zp_new_tile_xpos

        ; Get and add $1F (31) as it's the bottom
        ; row of the screen which is being updated
        ; so need to add that offset to the top row
        ; stored in the ypos
        LDA     zp_visible_screen_top_left_ypos
        CLC
        ADC     #$1F
        STA     zp_new_tile_ypos

        ; Need to update the bottom row to contain the
        ; new tiles - there are 32 of these
        LDA     #$20
        STA     zp_sprite_parts_to_copy_or_blank
;1C90
.loop_add_new_screen_bottom_tiles
        ; Lookup the tile that should be shown in this
        ; position and return it in A
        LDX     zp_new_tile_xpos
        LDY     zp_new_tile_ypos
        JSR     fn_lookup_screen_tile_for_xpos_ypos

        ; Write the tile held in A to the screen
        ; at the position held in X and Y
        JSR     fn_display_tile

        ; Move to the next tile in the row
        INC     zp_new_tile_xpos

        ; If there are any more tiles to copy
        ; to the bottom row of the screen then loop
        DEC     zp_sprite_parts_to_copy_or_blank
        BNE     loop_add_new_screen_bottom_tiles

        ; Return
        RTS

;1CA1
.fn_move_repton_up
        ; This routine does the following:
        ; 1. Blanks the current repton sprite
        ; 2. Updates the screen start address
        ; 3. Updates the top left (xpos,ypos)
        ; 4. Adds next repton sprite to the middle of the screen
        ; 5. Draws new line of tiles at the top of the screen

        ; Remove repton from the screen
        JSR     fn_remove_repton

        ; Move the screen up a row
        DEC     zp_visible_screen_top_left_ypos

        ; Each screen row of bytes is 256 ($FF) bytes long
        ; so just decrease the MSB of the screen start address
        ; by to move to the previous row

        ; Instead of decrementing by the MSB by 1 and checking
        ; it isn't lower than $60xx and wrapping around by adding
        ; $20xx, this code adds $1Fxx to the current screen 
        ; start address and checking to see if it's > $7FFF
        ; and then subtracting $20xx if it is - which achieves
        ; the same thing
        CLC
        LDA     zp_screen_start_address_msb
        ADC     #$1F
        BPL     store_new_screen_start_address_for_up

        ; Wrap the screen start address around by
        ; subtracting $2000 which is the same
        ; as subtracting $20 from the MSB
        SEC
        SBC     #$20
;1CB0
.store_new_screen_start_address_for_up
        ; Store the screen start address MSB
        ; after manipulation (don't need to 
        ; do this for just the DEC but it's done
        ; anyway)
        STA     zp_screen_start_address_msb

        ; Perform the hardware scroll
        JSR     fn_update_6845_screen_start_address
        ; Display the new repton sprite in the
        ; middle of the screen now the screen has moved
        JSR     fn_lookup_repton_sprite_and_display

        ; Get the current xpos on the 32x32 grid of the
        ; top left corner - bottom row will have the 
        ; same xpos
        LDA     zp_visible_screen_top_left_xpos
        STA     zp_new_tile_xpos

        ; Get the current xpos on the 32x32 grid of the
        ; top left corner - top row will have the 
        ; same ypos obviously
        LDA     zp_visible_screen_top_left_ypos
        STA     zp_new_tile_ypos

        ; Need to update the top bottom row to contain the
        ; new tiles - there are 32 of these
        LDA     #$20
        STA     zp_sprite_parts_to_copy_or_blank

;1CC4
.loop_add_new_screen_top_tiles
        ; Lookup the tile that should be shown in this
        ; position and return it in A
        LDX     zp_display_value_msb
        LDY     zp_display_value_mlsb
        JSR     fn_lookup_screen_tile_for_xpos_ypos

        ; Write the tile held in A to the screen
        ; at the position held in X and Y
        JSR     fn_display_tile

        ; Move to the next tile in the row
        INC     zp_display_value_msb

        ; If there are any more tiles to copy
        ; to the top row of the screen then loop        
        DEC     zp_sprite_parts_to_copy_or_blank
        BNE     loop_add_new_screen_top_tiles

        ; Return
        RTS

;1CD5
.end_move_repton_left
        RTS

;1CD6
.fn_move_repton_left
        ; TODO - not quite true - xpos can be between 0 and 255
        ; The top left location is based on a 128x128 grid
        ; So (xpos,ypos) will be between 0 and 127
        LDA     zp_visible_screen_top_left_xpos

        ; P1 <- Repton
        ; Check what is in position 1 (P1)
        ;
        ; Find the object that is to the left of 
        ; repton to determine if repton can move left

        ; Add $0D / 13 to the xpos to get the object
        ; to the left of repton's position
        ; (Repton is at xpos +$0E so the left object 
        ; right most tile is xpos +$0D)
        CLC
        ADC     #$0D

        ; Divide the xpos by 4 to get the location
        ; on the 32x32 grid
        LSR     A
        LSR     A
        TAX

        ; Add $0E / 14 to the ypos to get the
        ; row the row the object is in
        ; to the left of repton's current position
        ; (Repton is at ypos +$0E and so is the object
        ; to the left)
        LDA     zp_visible_screen_top_left_ypos
        CLC
        ADC     #$0E

        ; Divide the xpos by 4 to get the location
        ; on the 32x32 grid
        LSR     A
        LSR     A
        TAY


        ; Lookup the tile to the right of Repton
        ; (xpos,ypos) are stored in X and Y
        JSR     fn_lookup_screen_object_for_x_y


        ; Is it a solid object? If so branch
        ; as repton cannot move left
        CMP     #$18
        BCC     end_move_repton_left


        ; Is it a diamond or empty (A >= $1E)
        ; if so move repton left
        CMP     #$1E
        BCS     move_repton_left


        ; Is it a earth, a key or green earth?
        ; $17 < A < $1C
        ; if so move repton
        CMP     #$1C
        BCC     move_repton_left

        ; If it's a rock (A = $1D) or an egg (A = $1C)
        ; will end up here

        ; Cache the object id for the object
        ; to the left of repton (rock or egg)
        STA     zp_cached_object_id

        LDA     L000A
        STA     zp_map_object_update_lsb

        LDA     L000B
        STA     zp_map_object_update_msb

        ; P2 <- P1 <- Repton
        ;
        ; Check what is in position 2 (P2)
        ; to see if the egg or rock can move there
        ;
        ; Add $09 / 9 to the xpos to get the
        ; start of the next object position 
        ; to the right of repton's current position
        ; (Repton is at xpos +$0E and is 4 tiles wide
        ; so the object two to the left is 
        ; xpos +$09)
        LDA     zp_visible_screen_top_left_xpos
        CLC
        ADC     #$09

        ; Divide the xpos by 4 to get the location
        ; on the 32x32 grid
        LSR     A
        LSR     A
        TAX
        LDA     zp_visible_screen_top_left_ypos


        ; Add $0E / 14 to the ypos to get the
        ; row the row the object is in
        ; two to the left of repton's current position
        ; (Repton is at ypos +$0E and so is the object
        ; two to the left)
        CLC
        ADC     #$0E

        ; Divide the ypos by 4 to get the location
        ; on the 32x32 grid
        LSR     A
        LSR     A
        TAY

        ; Lookup the tile two to the left of Repton (P2)
        ; (xpos,ypos) are stored in X and Y
        JSR     fn_lookup_screen_object_for_x_y

        ; Is it a blank/empty object ($1F)?
        ; Needs to be empty for Repton to push
        ; it left - if it isn't branch
        ; and don't allow Repton to push it
        CMP     #$1F
        BNE     end_move_repton_left

        ; Reload the object id for what is to the
        ; left of Repton
        LDA     zp_cached_object_id

        ; Update the current map cache to push the
        ; rock or egg one position left - 
        ; $000A contains the address of the 
        ; map location that is to the left of repton
        LDY     #$00
        STA     (L000A),Y

        ; Update the current map cache to put an
        ; empty space ($1F) where the rock or egg
        ; was (where repton is moving to)
        LDA     #$1F
        ; Y is already zero at this point from
        ; above so Spare Bytes - 2
        LDY     #$00
        STA     (L0071),Y

        LDA     zp_visible_screen_top_left_xpos
        CLC
        ADC     #$0A
        TAX

        LDA     zp_visible_screen_top_left_ypos
        CLC
        ADC     #$0E
        TAY

        LDA     #$00

        JSR     fn_draw_or_blank_object

        LDA     zp_visible_screen_top_left_xpos
        CLC
        ADC     #$06
        TAX

        LDA     zp_visible_screen_top_left_ypos
        CLC
        ADC     #$0E
        TAY

        ; Set the data tile location to the 
        ; be the first tile of the rock
        ; which is the first tile at the start
        ; of the data tiles
        LDA     #LO(data_tiles)
        STA     L0000
        LDA     #HI(data_tiles)
        STA     L0001

        ; Is it a rock or an egg that's moving? 
        ; If a rock then branch ahead        
        LDA     zp_cached_object_id
        CMP     #$1D
        BEQ     left_is_an_egg

        ; Otherwise it's an egg so 
        ; set the lsb to be the egg's first tile 
        ;  instead of the rock
        LDA     #LO(data_tiles_egg)
        STA     zp_screen_write_address_lsb
;1D51
.left_is_an_egg
        ; Draw the egg or rock on the screen
        ; Setting to $FF is asking the sub-routine
        ; to draw the object and reads it from the location
        ; in $0000/$0001
        LDA     #$FF
        JSR     fn_draw_or_blank_object

;1D56
.move_repton_left
        ; This does the following:
        ; 1. Blanks the current repton sprite
        ; 2. Updates the screen start address
        ; 3. Updates the top left (xpos,ypos)
        ; 4. Adds next repton sprite to the middle of the screen
        ; 5. Draws new line of tiles at the left of the screen

        ; Remove repton from the screen
        JSR     fn_remove_repton

        ; Move the screen left a column
        DEC     zp_visible_screen_top_left_xpos

        ; When scrolling right, subtract 8 bytes to the
        ; screen start address - this is done by:
        ; 1. adding $F8 to the LSB
        ; 2. Adding the carry to the MSB (if any)
        ; 3. Adding $1F to the MSB
        ; 4. Subtracting $2000 from the address
        ;
        ; Seems more intuitive to do the following?
        ; (and then check if less than $6000 and add $2000)
        ; CLC
        ; LDA     $0070
        ; SBC     #$08
        ; STA     $0070
        ;
        ; LDA     $0071
        ; SBC     #$00
        ; STA     $0071

        ; Calculate the new screen start address
        ; by "subtracting 8"
        CLC
        LDA     zp_screen_start_address_lsb
        ADC     #$F8
        STA     zp_screen_start_address_lsb
        LDA     zp_screen_start_address_msb
        ADC     #$1F

        ; Check to see if the screen start address
        ; has moved beyond $7FFF - this is 
        ; done by checking the MSB is still positive
        ; as when it gets to $80 or greater it's "negative"
        ; as the eigth bit is set        
        BPL     store_new_screen_start_address_for_left

        ; Wrap the screen start address around by
        ; subtracting $2000 which is the same
        ; as subtracting $20 from the MSB
        SEC
        SBC     #$20
;1D6B
.store_new_screen_start_address_for_left
        ; Store the screen start address MSB
        ; after manipulation (don't need to 
        ; do this for just the DEC but it's done
        ; anyway)
        STA     zp_screen_start_address_msb

        ; Perform the hardware scroll
        JSR     fn_update_6845_screen_start_address

        ; Display the new repton sprite in the
        ; middle of the screen now the screen has moved
        JSR     fn_lookup_repton_sprite_and_display

        ; Get the top left hand xpos as this is the xpos
        ; where the new tiles need to be drawn
        LDA     zp_visible_screen_top_left_xpos
        STA     zp_new_tile_xpos

        ; Get the top left hand ypos as this is the ypos
        ; where the new tiles need to be drawn
        LDA     zp_visible_screen_top_left_ypos
        STA     zp_new_tile_ypos

        ; Need to update the left hand column contain the
        ; new tiles - there are 32 of these
        LDA     #$20
        STA     zp_sprite_parts_to_copy_or_blank
;1D7F
.loop_add_new_screen_left_tiles
        ; Lookup the tile that should be shown in this
        ; position and return it in A
        LDX     zp_new_tile_xpos
        LDY     zp_new_tile_ypos
        JSR     fn_lookup_screen_tile_for_xpos_ypos

        ; Write the tile held in A to the screen
        ; at the position held in X and Y
        JSR     fn_display_tile

        ; Move to the next row's tile on the left hand side
        INC     zp_new_tile_ypos

        ; If there are any more tiles to copy
        ; to the bottom row of the screen then loop
        DEC     zp_sprite_parts_to_copy_or_blank
        BNE     loop_add_new_screen_left_tiles

        ; Return
        RTS

;1D90
.end_move_repton_right
        ; Return
        RTS

;1D91
.fn_move_repton_right
        ; The top left location is based on a 128x128 grid
        ; So (xpos,ypos) will be between 0 and 127
        LDA     zp_visible_screen_top_left_xpos

        ; Repton -> P1
        ; Check what is in position 1 (P1)
        ;
        ; Find the object that is to the right of 
        ; repton to determine if repton can move right

        ; Add $12 / 18 to the xpos to get the
        ; start of the next object position 
        ; to the right of repton's current position
        ; (Repton is at xpos +$0E and is 4 tiles wide
        ; so the next object is xpos +$0E +$04)
        CLC
        ADC     #$12

        ; Divide the xpos by 4 to get the location
        ; on the 32x32 grid
        LSR     A
        LSR     A
        TAX

        ; Add $0E / 14 to the ypos to get the
        ; row the row the next object is in
        ; to the right of repton's current position
        ; (Repton is at ypos +$0E and so is the object
        ; to the right)
        LDA     zp_visible_screen_top_left_ypos
        CLC
        ADC     #$0E

        ; Divide the ypos by 4 to get the location
        ; on the 32x32 grid
        LSR     A
        LSR     A
        TAY

        ; Lookup the tile to the right of Repton
        ; (xpos,ypos) are stored in X and Y
        JSR     fn_lookup_screen_object_for_x_y

        ; Is it a solid object? If so branch
        ; as repton cannot move right
        CMP     #$18
        BCC     end_move_repton_right

        ; Is it a diamond or empty (A >= $1E)
        ; if so move repton
        CMP     #$1E
        BCS     move_repton_right

        ; Is it a earth, a key or green earth?
        ; $17 < A < $1C
        ; if so move repton
        CMP     #$1C
        BCC     move_repton_right

        ; If it's a rock (A = $1D) or an egg (A = $1C)
        ; will end up here

        ; Cache the object id for the object
        ; to the right of repton (rock or egg)
        STA     zp_cached_object_id

        ; Check to see if the rock or egg can be pushed
        ; right - can only happen if there is 
        ; empy space to the right of the rock or egg

        LDA     L000A
        STA     L0071

        LDA     L000B
        STA     L0072
        
        ; Repton -> P1 -> P2
        ;
        ; Check what is in position 2 (P2)
        ; to see if the egg or rock can move there
        ;
        ; Add $16 / 22 to the xpos to get the
        ; start of the next object position 
        ; to the right of repton's current position
        ; (Repton is at xpos +$0E and is 4 tiles wide
        ; so the object two to the right is 
        ; xpos +$0E +$04 +$04)
        LDA     zp_visible_screen_top_left_xpos
        CLC
        ADC     #$16

        ; Divide the xpos by 4 to get the location
        ; on the 32x32 grid
        LSR     A
        LSR     A
        TAX

        ; Add $0E / 14 to the ypos to get the
        ; row the row the object is in
        ; two to the right of repton's current position
        ; (Repton is at ypos +$0E and so is the object
        ; two to the right)
        LDA     zp_visible_screen_top_left_ypos
        CLC
        ADC     #$0E

        ; Divide the ypos by 4 to get the location
        ; on the 32x32 grid
        LSR     A
        LSR     A
        TAY

        ; Lookup the tile two to the right of Repton (P2)
        ; (xpos,ypos) are stored in X and Y
        JSR     fn_lookup_screen_object_for_x_y

        ; Is it a blank/empty object ($1F)?
        ; Needs to be empty for Repton to push
        ; it right - if it isn't branch
        ; and don't allow Repton to push it
        CMP     #$1F
        BNE     end_move_repton_right

        ; Reload the object id for what is to the
        ; right of Repton
        LDA     zp_cached_object_id

        ; Update the current map cache to push the
        ; rock or egg one position right
        LDY     #$00
        STA     (L000A),Y

        ; Update the current map cache to put an
        ; empty space where the rock or egg
        ; was (where repton is moving to)
        LDA     #$1F
        STA     (L0071),Y

        LDA     zp_visible_screen_top_left_xpos
        CLC
        ADC     #$12
        TAX
        LDA     zp_visible_screen_top_left_ypos
        CLC
        ADC     #$0E
        TAY

        ; Remove the egg or rock
        LDA     #$00
        JSR     fn_draw_or_blank_object

        LDA     zp_visible_screen_top_left_xpos
.L1DEE
        CLC
        ADC     #$16
        TAX
        LDA     zp_visible_screen_top_left_ypos
        CLC
        ADC     #$0E
        TAY

        ; Set the data tile location to the 
        ; be the first tile of the rock
        ; which is the first tile at the start
        ; of the data tiles
        LDA     #LO(data_tiles)
        STA     L0000
        LDA     #HI(data_tiles)
        STA     L0001

        ; Is it a rock or an egg that's moving? 
        ; If a rock then branch ahead
        LDA     zp_cached_object_id
        CMP     #$1D
        BEQ     right_is_an_egg

        ; Otherwise it's an egg so 
        ; set the lsb to be the egg's first tile 
        ;  instead of the rock
        LDA     #LO(data_tiles_egg)
        STA     L0070

;1E0A
.right_is_an_egg
        ; Draw the egg
        LDA     #$FF
        JSR     fn_draw_or_blank_object

;1E0F
.move_repton_right
        ; This does the following:
        ; 1. Blanks the current repton sprite
        ; 2. Updates the screen start address
        ; 3. Updates the top left (xpos,ypos)
        ; 4. Adds next repton sprite to the middle of the screen
        ; 5. Draws new line of tiles at the right of the screen

        ; Remove repton from the screen
        JSR     fn_remove_repton

        ; Move the screen right a column
        INC     zp_visible_screen_top_left_xpos

        ; When scrolling right, add 8 bytes to the
        ; screen start address
        CLC
        LDA     zp_screen_start_address_lsb
        ADC     #$08
        STA     zp_screen_start_address_lsb

        ; If there was any carry from the LSB
        ; add it to the MSB
        LDA     zp_screen_start_address_msb
        ADC     #$00

        ; Check to see if the screen start address
        ; has moved beyond $7FFF - this is 
        ; done by checking the MSB is still positive
        ; as when it gets to $80 or greater it's "negative"
        ; as the eigth bit is set
        BPL     store_new_screen_start_address_for_down

        ; Wrap the screen start address around by
        ; subtracting $2000 which is the same
        ; as subtracting $20 from the MSB
        SEC
        SBC     #$20
;1E24
.store_new_screen_start_address_for_down
        ; Store the screen start address MSB
        ; after manipulation (don't need to 
        ; do this for just the INC but it's done
        ; anyway)
        STA     zp_screen_start_address_msb

        ; Perform the hardware scroll
        JSR     fn_update_6845_screen_start_address

        ; Display the new repton sprite in the
        ; middle of the screen now the screen has moved
        JSR     fn_lookup_repton_sprite_and_display

        ; Get and add $1F (31) to the top left xpos
        ; as it's the right hand side of the screen 
        ; which is being updated so need to add that 
        ; offset
        LDA     zp_visible_screen_top_left_xpos
        CLC
        ADC     #$1F
        STA     zp_new_tile_xpos

        ; Get the current ypos on the 32x32 grid of the
        ; top left corner -right hand column will have the
        ; same start ypos
        LDA     zp_visible_screen_top_left_ypos
        STA     zp_new_tile_ypos

        ; Need to update the right hand column contain the
        ; new tiles - there are 32 of these
        LDA     #$20
        STA     zp_sprite_parts_to_copy_or_blank

;1E3B
.loop_add_new_screen_right_tiles
        ; Lookup the tile that should be shown in this
        ; position and return it in A
        LDX     zp_new_tile_xpos
        LDY     zp_new_tile_ypos
        JSR     fn_lookup_screen_tile_for_xpos_ypos

        ; Write the tile held in A to the screen
        ; at the position held in X and Y
        JSR     fn_display_tile

        ; Move to the next row's tile on the right hand side
        INC     zp_new_tile_ypos

        ; If there are any more tiles to copy
        ; to the bottom row of the screen then loop
        DEC     zp_sprite_parts_to_copy_or_blank
        BNE     loop_add_new_screen_right_tiles

        ; Return
        RTS

;1E4C
.fn_get_nth_bit_from_memory
        ; Returns the nth bit from memory from
        ; the map data that starts at $4200 using
        ; the relative bit offset that is passed in
        ; 
        ; On exit
        ;     A - $00 - bit not set
        ;     A - $FF - bit set to one
        ;
        ; The values in the follow locations
        ; contain the YXth bit that needs to be
        ; retrieved
        ;
        ;    zp_object_index_lsb_cache - 0072
        ;    zp_object_index_msb_cache - 0073
        ;
        ; This routine takes the relative bit offset and 
        ; works out which relative byte offset containst
        ; that bit (by dividing it by 8)
        ;
        ; It then works out where in memory that is by
        ; adding $4200
        ;
        ; Byte address = (relative bit offset / 8) + $4200
        ;
        STX     zp_starting_bit_offset_lsb_cache
        STY     zp_starting_bit_offset_msb_cache

        ; To calculate which byte this is in,
        ; divide the number of bits by 8 and throw
        ; away the remainder
        ;
        ; Relative byte offset = nth bit / 8
        LSR     zp_starting_bit_offset_msb_cache
        ROR     zp_starting_bit_offset_lsb_cache
        LSR     zp_starting_bit_offset_msb_cache
        ROR     zp_starting_bit_offset_lsb_cache
        LSR     zp_starting_bit_offset_msb_cache
        ROR     zp_starting_bit_offset_lsb_cache

        ; Load the relative byte offset
        LDA     zp_starting_bit_offset_msb_cache

        ; Add $4200 to it (all compressed map info
        ; starts at this address)
        CLC
        ADC     #$42
        STA     zp_starting_bit_offset_msb_cache


        LDY     #$00

        ; Work out which bit from that byte is 
        ; required for this nth bit but masking
        ; to only the bottom three bits (this
        ; gives a value between 0 and 7)
        TXA
        AND     #$07
        TAX

        ; Look up the bit mask using X from a table for the
        ; to be able to retrieve the required bit
        ;
        ; Bit Bit mask
        ; --- --------
        ;  0  00000001 ($01)
        ;  1  00000010 ($02)
        ;  2  00000100 ($04)
        ;  3  00001000 ($08)
        ;  4  00010000 ($10)
        ;  5  00100000 ($20)
        ;  6  01000000 ($40)
        ;  7  10000000 ($80)
        LDA     data_map_object_required_bit_mask,X
        AND     (zp_screen_password_lookup_lsb),Y

        ; If the value of the bit is zero then return zero
        CMP     #$00
        BEQ     end_get_nth_bit_from_memory

        ; Otherwise return $FF to indicate bit is set
        LDA     #$FF
;1E74
.end_get_nth_bit_from_memory
        RTS

;1E75
.fn_get_next_map_object
        ; X and Y get the nth object for the current map
        ;    X is 0 to 255
        ;    Y is 0 to 3 (multiplied by screen number)
        ;
        ; Together as YX they represent the nth serialised objet 
        ; to retrieve for example for screen A (0):
        ;
        ;   X  Y    YX  nth
        ;  -- --  ---- ----
        ;  00 00  0000    0
        ;  01 00  0001    1
        ;  02 00  0002    2
        ;  ...
        ;  FF 00  00FF  255
        ;  00 01  0100  256
        ;  01 01  0101  257
        ;  02 01  0102  258
        ;  ...
        ;  FF 01  01FF  511
        ;  ...
        ;  00 03  0300  768
        ;  ...
        ;  FF 03  03FF 1023   <-- last value to look up as
        ;                         each map is 1024 objects
        ;
        ; This retrieves 4 * 256 = 1024 objects of the current
        ; map
        ;
        ; The map is compressed in that 5 bits ar used to represent
        ; each object so objects can have a value of $00 to $1F. Spare
        ; bits are used for the next object so
        ;
        ; Looking at Screen A, which starts at &4200 the first
        ; 5 bytes contain 8 object defintions (from &4200 to &4204)
        ; with the rest following after (&4200++)
        ;
        ;             <-------------------Memory----------------------------
        ; Address:      &4205    &4204    &4203    &4202    &4201   &4200
        ;              -------- -------- -------- -------- -------- --------
        ; Byte:           &38      &B5      &AD      &6B      &5A      &D6
        ; Binary:      00111000 10110101 10101101 01101011 01011010 11010110
        ;              --><---> <---><-- -><--->< ---><--- ><---><- --><--->
        ; Object:           9     8    7     6     5    4     3     2    1
        ; Obj value:       &18   &16  &16   &16   &16  &16   &16   &16  &16
        ; Obj type:      Earth  BrickBrick Brick BrickBrick Brick BrickBrick
        ; 
        ; The starting bit offset is calculated from the YX and used to
        ; retrieve five bits from that position - note that it is a relative
        ; not absolute position that is calculated so e.g. if YX were $00
        ; the starting bit offset would be $00

        ; Put X and Y into the working variables
        STX     zp_object_index_lsb
        STY     zp_object_index_msb

        ; Cache X and Y as they are required later
        ; and are not changed
        STX     zp_object_index_lsb_cache
        STY     zp_object_index_lsb_cache

        ; Reset nth object identifier - this will
        ; contain the object code at the nth position
        ; It has the bits rolled in from the left 
        ; and then rolled down to the bottom bits when
        ; five bits have been added
        LDA     #$00
        STA     zp_object_id

        ; Calculate the starting bit offset from the start
        ; of the map memory using:
        ;
        ;    Req'd bit = (YX * 4) + X + (Y * 256)
        ;       or
        ;    Req'd bit = (YX * 4) + X + (Y00)
        ;
        ; Which is really the same as:
        ;
        ;    Req'd bit = YX * 5
        ;
        ; But because it's hard to multiply in 6502, it's
        ; calculated as:
        ;
        ;    Req'd bit = (YX * 4) + YX
        ; 

        ; Multiply YX by 4  (YX * 4)...
        ASL     zp_object_index_lsb
        ROL     zp_object_index_msb
        ASL     zp_object_index_lsb
        ROL     zp_object_index_msb

        ; Add ... + X + ...
        CLC
        LDA     zp_object_index_lsb
        ADC     zp_object_index_lsb_cache
        STA     zp_object_index_lsb

        ; Add ... + (Y00)
        LDA     zp_object_index_msb
        ADC     zp_object_index_msb_cache
        STA     zp_object_index_msb

        ; The relative starting bit offset is now stored in:
        ;    zp_object_index_lsb
        ;    zp_object_index_msb

        ; fn_get_next_map_object_bit uses
        ; the values in:
        ;
        ;    zp_object_index_lsb - 0072
        ;    zp_object_index_msb - 0073
        ;
        ; Each call adds the next object bit to
        ; by rolling it in from the left:
        ;
        ;    zp_object_id - 0076
        ;
        ; Until all 5 object bits have been 
        ; retrieved

        ; Get bit 1 for object - note that the 
        ; routine will increment the relative
        ; bit offset by one so updating:
        ;    zp_object_index_lsb
        ;    zp_object_index_msb
        JSR     fn_get_next_map_object_bit

        ; Get bit 2 for object - note that the 
        ; routine will increment the relative
        ; bit offset by one so updating:
        ;    zp_object_index_lsb
        ;    zp_object_index_msb
        JSR     fn_get_next_map_object_bit

        ; Get bit 3 for object - note that the 
        ; routine will increment the relative
        ; bit offset by one so updating:
        ;    zp_object_index_lsb
        ;    zp_object_index_msb
        JSR     fn_get_next_map_object_bit

        ; Get bit 4 for object - note that the 
        ; routine will increment the relative
        ; bit offset by one so updating:
        ;    zp_object_index_lsb
        ;    zp_object_index_msb
        JSR     fn_get_next_map_object_bit

        ; Get bit 5 for object - note that the 
        ; routine will increment the relative
        ; bit offset by one so updating:
        ;    zp_object_index_lsb
        ;    zp_object_index_msb
        JSR     fn_get_next_map_object_bit

        ; Move the bits from high positions to low 
        ; so e.g. 10101000 becaomes 00010101 so the
        ; object number is aligned to the lowest 5 bits
        ; and therefore in the range $00 - $1F
        LSR     zp_object_id
        LSR     zp_object_id
        LSR     zp_object_id

        ; Set the accumulator as the object id
        ; as the code after this will use it to 
        ; write to the map cache at $0400
        LDA     zp_object_id
        RTS

;1EAE
.fn_get_next_map_object_bit
        ; The values in the follow locations
        ; contain the YXth bit that needs to be
        ; retrieved
        ;
        ;    zp_object_index_lsb - 0072
        ;    zp_object_index_msb - 0073
        LDX     zp_object_index_lsb
        LDY     zp_object_index_msb
        JSR     fn_get_nth_bit_from_memory

        ; Roll the bit at the nth position into the object id
        ;
        ; This is performed for 5 bits by the caller
        ; and the previous subroutine returns A is $00
        ; or A is $FF to indicate if the bit is 0 or 1
        ; so the ASL doesn't or does set the carry flag
        ; that gets ROR'd into the MSB for the object_id
        ASL     A
        ROR     zp_object_id

        ; Increment the relative bit offset so the caller
        ; doesn't need to do it
        INC     zp_object_index_lsb
        BNE     end_decode_map_object

        ; If the LSB carried then add 1 to the MSB
        INC     zp_object_index_msb
;1EBE
.end_decode_map_object
        RTS

;1EBF
.fn_reset_game
        ; Reset the screen number if negative
        ; otherwise load the current screen into A
        JSR     fn_reset_start_and_started_on_screen

        ; A at this point will contain the current screen
        ;
        ; Multiply the current screen by 4
        ASL     A
        ASL     A

        ; Store in 78   
        STA     zp_nth_object_index_msb

        ; Reset 77 80 and the number of 
        ; diamonds left
        LDA     #$00

        ; 
        STA     zp_nth_object_index_lsb

        ; Counter used to loop 256 times 
        STA     zp_decode_map_counter_lsb

        ; Reset the number of diamonds left to
        ; collect to zero - they will be counted as
        ; the map is unpacked
        STA     var_number_diamonds_left

        ; Counter used to loop 4 times on top of the 256 times
        ; to get all 1024 (4 x 256) objects
        LDA     #$04
        STA     zp_decode_map_counter_msb
;1ED3
.get_and_decode_nth_map_object
        ; Get the nth object from the encoded (compressed)
        ; map so it can be copied into the current map
        ; cache
        LDX     zp_nth_object_index_lsb
        LDY     zp_nth_object_index_msb
        JSR     fn_get_next_map_object

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
;1EE5
.check_if_object_is_a_safe
        ; If the current object is a Safe ($17)
        ; increment the number of diamonds to collect
        CMP     #$17
        BNE     skip_number_diamonds_left_increment

        ; It's a safe so increment
        INC     var_number_diamonds_left

;1EEC
.skip_number_diamonds_left_increment
        ; Increment to get the next map object
        ; if the LSB carries than add 1 to the MSB
        INC     zp_nth_object_index_lsb
        BNE     skip_nth_object_index_msb_increment

        ; Increment the MSB as the LSB > 255
        INC     zp_nth_object_index_msb
;1EF2
.skip_nth_object_index_msb_increment
        ; A map contains 1024 object ids - these are
        ; retrieved by iterating over 4 * 256 object ids
        ; 
        ; The zp_decode_map_counter_lsb loops 0-255 inclusive
        ; The zp_decode_map_counter_msb loops 4-7 inclusive
        ;
        ; Get and decode the current 256 object ids and 
        ; copy into $0400-$04FF - if all 256 have been
        ; retrieved then increment the MSB
        INC     zp_decode_map_counter_lsb
        BNE     L1EF8

        ; Increment the MSB
        INC     zp_decode_map_counter_msb
;1EF8
.skip_decode_map_counter_msb_increment
        ; Have all 1024 map object ids been retrieved
        ; and copied into the working cache?
        ;
        ; Have 4*256 iterations been performed?
        ; (Remember starts at $04)
        LDA     zp_decode_map_counter_msb
        CMP     #$08
        ; Not all have been retrieved so loop back
        ; and get the rest
        BNE     get_and_decode_nth_map_object

        ; Reset $0980-$09FF to zero
        LDX     #$10
        ; TODO give this label a better name
;1F00
.reset_cache
        ; Set current byte to zero
        LDA     #$00
        ; TODO WHAT IS HELD HERE
        STA     L0970,X
        ; Move to next byte and loop
        ; back if more to reset
        INX
        BPL     reset_cache

        RTS

;1F09
.fn_check_repton_movement
        ; Reset the vertical and horiztonal 
        ; movement keypress indicators to zero
        ; for no key detected
        LDA     #$00
        STA     var_repton_vertical_direction
        STA     var_repton_horizontal_direction

        ; Check the object above Repton 
        ; to see if he can move there - if he can 
        ; then check to see if the player is pressing
        ; the up key (:)
        ; x = (xpos + 14) / 4
        LDA     zp_visible_screen_top_left_xpos
        CLC
        ADC     #$0E
        LSR     A
        LSR     A
        TAX

        ; x = (xpos + 13) / 4
        LDA     zp_visible_screen_top_left_ypos
        CLC
        ADC     #$0D
        LSR     A
        LSR     A
        TAY

        JSR     fn_lookup_screen_object_for_x_y

        ; Is it a solid object? If so branch
        CMP     #$18
        BCC     check_down_key

        ; Is it an egg? If so branch
        CMP     #$1C
        BEQ     check_down_key

        ; Is it a rock? If so branch
        CMP     #$1D
        BEQ     check_down_key

        ; Check to see if the : key is being pressed
        ; (Move Repton Up)
        LDA     #$B7
        JSR     fn_read_key

        ; If it wasn't being pressed then branch away
        BEQ     check_down_key

        ; The : key was being pressed so 
        ; change the value to $01 which indicates
        ; repton is moving up
        INC     var_repton_vertical_direction
;1F3A
.check_down_key
        ; Check the object below Repton 
        ; to see if he can move there - if he can 
        ; then check to see if the player is pressing
        ; the down key (/)
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

        ; Is it a solid object? If so branch
        CMP     #$18
        BCC     check_left_key

        ; Is it an egg? If so branch
        CMP     #$1C
        BEQ     check_left_key

        ; Is it an rock? If so branch
        CMP     #$1D
        BEQ     check_left_key

        ; Check to see if the / key is being pressed
        ; (Move Repton Down)
        LDA     #$97
        JSR     fn_read_key

        ; If it wasn't being pressed then branch away
        BEQ     check_left_key

        ; The / key was being pressed so 
        ; change the value to $FF which indicates
        ; repton is moving up
        DEC     var_repton_vertical_direction
;1F63
.check_left_key
        ; Check to see if the Z key is being pressed
        ; (Move Repton Left)
        LDA     #$9E
        JSR     fn_read_key

        ; If it wasn't being pressed then branch away
        BEQ     check_right_key

        ; The Z key was being pressed so 
        ; change the value to $FF which indicates
        ; repton is moving left
        DEC     var_repton_horizontal_direction
;1F6D
.check_right_key
        ; Check to see if the X key is being pressed
        ; (Move Repton Right)
        LDA     #$BD
        JSR     fn_read_key

        BEQ     cancel_horiztonal_if_vertical

        ; The X key was being pressed so 
        ; change the value to $01 which indicates
        ; repton is moving right
        INC     var_repton_horizontal_direction
;1F77
.cancel_horiztonal_if_vertical
        ; If Repton is moving vertically, then
        ; cancel the horizontal movement
        ; otherwise branch to the end of the fn
        LDA     var_repton_vertical_direction
        BEQ     end_check_repton_movement

        ; Cancel the horizontal movement as Repton
        ; is moving vertically
        LDA     #$00
        STA     var_repton_horizontal_direction
;1F81
.end_check_repton_movement
        RTS

;1F82
.fn_dissolve_screen
        ; Disable Vsync event and change the palette
        NOP
        JSR     fn_disable_vsync_event_and_change_palette

        ; This loop is used to iterate over the entire screen
        ; N times as defined by the value in 
;1F86
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
;1F9E
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

        ; Set the mlsb to $80, set the start and started
        ; screens to zero and reset the game
        JSR     fn_set_high_score_mlsb_and_start_screen

        ; Set sound, music and combined sound/music
        ; to on
        LDA     #$01
        JSR     fn_set_sound_and_music_status
        
        ; continues below
        
;1FED
.fn_initialise_game_after_restart
        ; This is called on load of the game and
        ; also if a player loses ALL of their lives

        ; Clear the screen and if the player
        ; just lost all their lives then show the
        ; high score table
        JSR     fn_clear_screen_show_high_score_table

        ; continues below

;1FF0
.fn_initialise_game_after_restart_no_high_score
        ; Reset the stack pointer 
        LDX     #$FF
        TXS

        ; Spare bytes - 2
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

        ; Reset the game
        JSR     fn_reset_game

;2008
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
        STA     var_main_loop_counter
        STA     var_repton_idle_counter

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

;2027
.fn_return_pressed_from_game
        ; Start screen address is $6000 before scrolling
        LDA     #$00
        STA     zp_screen_start_address_lsb
        LDA     #$60
        STA     zp_screen_start_address_msb 

        ; Top four bits are the logical colour to assign
        ; Bottom four bits are the physical colour to set
        ; $11 = 0001 0001
        ;
        ; Set logical colour 1 to physical colour 1 (Red)
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
;204A
.loop_move_to_next_row
        ; Number of columns to draw objects for - game
        ; screen is 32 x 32 so set this to 32
        LDA     #$20
        STA     zp_game_screen_column_to_draw
        
        ; Get and cache the xpos of the visible
        ; top left corner of the screen   
        LDA     zp_visible_screen_top_left_xpos
        STA     zp_visible_screen_top_left_xpos_cache
;2052
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

;206E
.main_game_loop

        ; TODO
        ; This map be checking to see if repton 
        ; is moving at the moment up or down or
        ; during an animation frame - difficult to 
        ; tell from reading the code

        ; Check to see if the x position is in 
        ; at the start of a 32x32 grid position
        ; (remember ypos is 0 to 127) so mask
        ; it with 3 to see when it is zero
        ; 
        ; AND #$07 (0000 0011)
        LDA     zp_visible_screen_top_left_xpos
        CLC

        ; TODO Check this
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

        ; Spare bytes - 3
        NOP
        NOP
        NOP

        ; Check if the player is trying to 
        ; move repton and change the required
        ; animation sprite for Repton if so
        ; Also checks if repton is idle
        JSR     fn_check_repton_movement

.L2086
        ; Clear Binary Coded Decimal mode
        CLD
        ; Is the player trying to move repton
        ; vertically?  If not, branch ahead
        LDA     var_repton_vertical_direction
        BEQ     check_horizontal_movement

        ; Is the player trying to move Repton up?
        ; If so branch ahead
        BPL     move_repton_up

        ; Move repton down (remove repton, move
        ; the screen down, add repton, add new line
        ; of tiles at the bottom of the screen)
        JSR     fn_move_repton_down

        JMP     check_horizontal_movement

;2094
.move_repton_up
        ; Move repton up (remove repton, move
        ; the screen up, add repton, add new line
        ; of tiles at the top of the screen)
        JSR     fn_move_repton_up

;2097
.check_horizontal_movement
        ; Is the player trying to move repton
        ; horizontally?  If not, branch ahead
        LDA     var_repton_horizontal_direction
        BEQ     L20A7

        ; Is the player trying to move Repton right?
        ; If so branch ahead
        BPL     move_repton_right

        ; Move repton left
        JSR     fn_move_repton_left

        JMP     L20A7

;20A4
.move_repton_right
        ; Move repton right
        JSR     fn_move_repton_right

.L20A7
        ; Allow maskable interrupts
        CLI

        ; Is the player trying to move repton
        ; vertically?  If not, branch ahead
        ; Otherwise work out the animation state
        LDA     var_repton_vertical_direction        
        BEQ     L20B6

        ; Vertical animation state is calculated from 
        ; the top left ypos of the screen
        ; 
        ; State = (ypos / 4) AND 1
        ;
        ; Map is 32 x 32 objects
        ;
        ; Map is 128x128 tiles
        ;
        ; (xpos,ypos) works using 128x128
        ;
        ; So converts to 32x32 number dividing by 4
        ;
        ; And if it's odd show one state or even another
        LDA     zp_visible_screen_top_left_ypos
        LSR     A
        LSR     A
        AND     #$01
        STA     var_repton_animation_state

.L20B6
        ; Horizontal animation state is calculated from 
        ; the top left xpos of the screen and there
        ; are four possible animation sprites for moving left
        ; and another four for moving right
        ; 
        ; State = (xpos / 2) AND 7
        ;
        ; $07 in binary is 00000111
        ; So it masks to the bottom three bits
        ; which gives seven lookups to the four
        ; animation sprites
        ;
        ; Map is 32 x 32 objects
        ;
        ; Map is 128x128 tiles
        ;
        ; (xpos,ypos) works using 128x128
        ;

        ; Calculate the state as above
        LDA     zp_visible_screen_top_left_xpos
        LSR     A
        AND     #$07

        ; Cache the lookup table value inX
        TAX

        ; Check if the player is trying to 
        ; move repton horizontally
        LDA     var_repton_horizontal_direction

        ; No left/right movement so branch ahead
        BEQ     L20D2

        ; Player moving Repton right so branch to that
        ; code
        BPL     find_moving_right_sprite

        ; Player moving Repton left so lookup which
        ; moving left sprite should be used using the
        ; lookup table
        LDA     repton_moving_left_sprite_lookup,X

        ; Store this as the current repton sprite
        ; so it will be drawn on the screen
        STA     var_repton_animation_state
        JMP     L20D2

;20CC
.find_moving_right_sprite
        ; Player moving Repton right so lookup which
        ; moving right sprite should be used using the
        ; lookup table
        LDA     repton_moving_right_sprite_lookup,X

        ; Store this as the current repton sprite
        ; so it will be drawn on the screen        
        STA     var_repton_animation_state

.L20D2
        ; Check to see if the the player was 
        ; moving repton either vertically or horizontally
        LDA     var_repton_vertical_direction
        ORA     var_repton_horizontal_direction

        ; If player was moving Repton was moving 
        ; vertically or horizontally then branch ahead
        BNE     L20E5

        ; Player was not trying to move Repton
        ; Check to see if Repton has been idle
        ; for 127 times around this loop
        LDA     var_repton_idle_counter

        ; If it's negative then Repton has been
        ; stood still for 127 checks around this
        ; loop so branch ahead and get the standing
        ; still icons
        BMI     L20ED

        ; No player requested movement so increment
        ; the number of times through this routine
        ; that Repton has been idle
        INC     var_repton_idle_counter
        JMP     L2100

.L20E5
        ; Reset the idle counter as
        ; player requested movement was
        ; detected
        LDA     #$00
        STA     var_repton_idle_counter
        JMP     L2100

.L20ED
        ; There is a main loop counter that 
        ; is incremeneted each time around the
        ; main game loop - it's used here to 
        ; selected which repton animation sprite
        ; to use for standing still
        ;
        ; Sprite index = (counter / 16) AND $03
        ;
        ; There are four standing idle lookup values
        ; hence AND $03 / 0000 0011
        ;
        ; The divide by 16 means it won't change
        ; that often, every 16th loop
        LDA     var_main_loop_counter
        LSR     A
        LSR     A
        LSR     A
        LSR     A
        AND     #$03
        TAX

        ; Player not trying to move so use the 
        ; standing idle sprites and lookup based on 0907
        LDA     repton_standing_idle_looking,X


        ; Store this as the current repton sprite
        ; so it will be drawn on the screen             
        STA     var_repton_animation_state

        ; Draw the repton standing idle sprite on the screen
        JSR     fn_lookup_repton_sprite_and_display

.L2100
        ; Switch off Binary Coded Decimal mode
        CLD

        LDA     #$FF
        JSR     L121E

        JSR     L12F6

        LDA     #$1F
        JSR     L121E

        ; Spare byte -1
        NOP


        LDA     var_number_diamonds_left
        BNE     L2138

        LDA     zp_visible_screen_top_left_ypos
        CLC
        ADC     #$02
        AND     #$03
        BNE     L2138

        LDA     zp_visible_screen_top_left_xpos
        CLC
        ADC     #$02
        AND     #$03
        BNE     L2138

        ; Screen has been completed so increment
        ; the current screen number
        INC     var_screen_number

        ; Was this the last screen? If not,
        ; branch ahead
        LDA     var_screen_number
        CMP     #$0C
        BNE     L2135

        ; Last screen completed 
        LDA     #$00
        JSR     fn_display_completed_screen

.L2135
        JMP     L2005

.L2138
        ; Spare byte - 1
        NOP
        JSR     L1588

        ; Allow maskable interrupts
        CLI

        ; Check if the return key has been pressed
        ; INKEY -74/ $B6
        LDA     #$B6
        JSR     fn_read_key

        ; If the key was not being pressed branch
        ; ahead and check for other key presses
        BEQ     check_for_other_key_presses

        ; Return was pressed - show the
        ; status screen
        JMP     fn_return_pressed_from_game

;2147
.check_for_other_key_presses
        ; Check if the music on/off or restart
        ; game keys are being pressed
        JSR     fn_check_r_d_w_keys

        ; Check if the escape key is being
        ; pressed for the player to kill repton
        JSR     fn_check_escape_key

        ; Decrement the remaining time by 1
        JSR     fn_decrement_remaining_time

        ; Increment the main loop counter
        ; Used for standing idle animation
        INC     var_main_loop_counter
        JMP     main_game_loop

        ; Spare bytes - 2
        EQUB    $00, $00
;2158
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
;2164
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
;2170
.check_r_key
        ; Check to see if the player has 
        ; asked for the music to be switched on
        ; INKEY $CC is R for restart
        LDA     #$CC
        JSR     fn_read_key

        ; Branch ahead if key not pressed
        BEQ     set_combined_sound_music

        ; Restart the game
        JMP     fn_restart_game

;217A
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

        ; Spare bytes - 7
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
;219F
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
        ; Set the byte counter for loading 
        ; and displaying the repton logo to zero 
        LDA     #$00
        STA     zp_screen_write_total_byte_counter
;21BA
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

;21D0
.fn_play_intro_music
        ; Reset the sound note index to the
        ; start of the tune
        LDA     #$00
        STA     zp_sound_note_index
;21D4
.play_next_intro_chord
        ; Load the index into Y as it'll
        ; be used to retrieve the current note
        LDY     zp_sound_note_index

        ; -------------------------------------
        ; Play SOUND channel 1 note
        ; -------------------------------------
        LDX     music_intro_channel_1,Y
        ; If the pitch is zero skip the note
        BEQ     play_intro_music_channel_2

        ; Set the sound channel to 1 ($x1) with 
        ; the immediate flush of the sound channel
        ; to play the note ($1x)
        LDA     #$11
        STA     zp_required_sound_channel

        ; Set the duration to 1 (1/20th of a second)
        LDY     #$01

        ; Set the amplitude to 01 (use envelope 1)
        LDA     #$01

        ; Play the current note 
        ; $0000 - set to the required sound channel
        ; A     - set to the amplitude
        ; X     - set to the pitch (note)
        ; Y     - set to the duration
        JSR     fn_play_music_sound

;21E6
.play_intro_music_channel_2
        ; -------------------------------------
        ; Play SOUND channel 2 note
        ; -------------------------------------
        ; Load the index into Y as it'll
        ; be used to retrieve the current note
        LDY     zp_sound_note_index
        LDX     music_intro_channel_2,Y
        BEQ     play_intro_music_channel_3

        ; Set the sound channel to 2 ($x2) with 
        ; the immediate flush of the sound channel
        ; to play the note ($1x)
        LDA     #$12
        STA     zp_required_sound_channel

        ; Set the duration to 1 (1/20th of a second)
        LDY     #$01

        ; Set the amplitude to 01 (use envelope 1)
        LDA     #$01

        ; Play the current note 
        ; $0000 - set to the required sound channel
        ; A     - set to the amplitude
        ; X     - set to the pitch (note)
        ; Y     - set to the duration        
        JSR     fn_play_music_sound

;21F8
.play_intro_music_channel_3
        ; -------------------------------------
        ; Play SOUND channel 3 note
        ; -------------------------------------
        ; Load the index into Y as it'll
        ; be used to retrieve the current note
        LDY     zp_sound_note_index
        LDX     music_intro_channel_3,Y
        BEQ     wait_for_80ms

        ; Set the sound channel to 3 ($x3) with 
        ; the immediate flush of the sound channel
        ; to play the note ($1x)
        LDA     #$13
        STA     zp_required_sound_channel

        ; Set the duration to 1 (1/20th of a second)
        LDY     #$01

        ; Set the amplitude to 01 (use envelope 1)
        LDA     #$01

        ; Play the current note 
        ; $0000 - set to the required sound channel
        ; A     - set to the amplitude
        ; X     - set to the pitch (note)
        ; Y     - set to the duration      
        JSR     fn_play_music_sound

;220A
.wait_for_80ms
        ; Wait for (4 * 20ms) 80 ms
        LDX     #$04
;220C
.loop_wait_for_80ms
        ; Wait for 20ms
        JSR     fn_wait_for_vertical_sync
        ; Loop back and wait another 20 ms
        ; if the index is still non-zero
        DEX
        BNE     loop_wait_for_80ms

        ; Move to the next notes to play
        INC     zp_sound_note_index
        LDA     zp_sound_note_index

        ; There are 52 ($34) notes to play
        ; for the intro tune - loop if not
        ; all played yet
        CMP     #$34
        BNE     play_next_intro_chord

        ; Re-enable maskable interrupts
        CLI
        RTS

;221C

        JSR     fn_draw_or_blank_object
        LDY     #$41
        LDA     ($72),Y
        CMP     #$FF
        BNE     $2230
        LDA     $71
        CMP     #$1E
        BCS     $2230

        ; Kill repton (lose a life)
        JMP     fn_kill_repton
;2230
        RTS


;2231
.fn_write_string_and_set_escape_lsb
        ; Display the string
        JSR     fn_write_string_to_screen

        ; Set the LSB for the "press escape to kill yourself"
        ; string so that when the main routine writes it'll 
        ; choose this string for that line
        JMP     fn_set_press_escape_lsb
; 2237
        ; Spare bytes - 9
        NOP
        NOP
        NOP
        NOP
        NOP 
        NOP
        NOP
        NOP
        NOP
;2240
INCLUDE "repton-music-intro-notes.asm"
;2300
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

        ; Spare bytes - 27
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

;2346
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
;2397
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

;23A7
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
;23AC
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

;23D6
.flip_score_lookup_positions
        ; Flip the positions of the scores
        LDX     var_score_index
        LDA     data_sorted_score_offsets,X
        TAY
        LDA     data_sorted_score_offsets+1,X
        STA     data_sorted_score_offsets,X
        TYA
        STA     data_sorted_score_offsets+1,X

;23E7
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
;2400
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

;24B3
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

;24C3
.text_copyright
        ; Unused copyright statement
        ; Spare bytes - 23
        EQUS    "(C) Timothy Tyler 1985"
        EQUB    $0D

;24DA
.fn_display_high_score_name_entry_field
        ; Set the cursor position to (2,22)
        LDA     #$02
        STA     zp_password_cursor_xpos
        LDA     #$16
        STA     zp_password_cursor_ypos

        ; Set the colour mask to all colours
        LDA     #$FF
        STA     zp_screen_colour_mask

        ; Write an & to the screen (gets translated into
        ; two vertical lines with dots tile)
        LDA     #$26
        JSR     fn_print_character_to_screen

        ; Set the cursor position to (25,22)
        ; Note ypos is already set above
        LDA     #$19
        STA     zp_password_cursor_xpos

        ; Write an & to the screen (gets translated into
        ; two vertical lines with dots tile)
        LDA     #$26
        JSR     fn_print_character_to_screen

        ; Set the cursor start position for name entry 
        ; to (03,22)
        LDX     #$03
        LDY     #$16
        RTS
;24F9
        ; Spare bytes - 6
        EQUB    $00,$00,$00,$00,$00,$00,$00

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
        JMP     $fn_wait_600ms_then_initialise_game     

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

;2567
.fn_check_if_nearly_out_of_time
        ; Checks to see if remaining time is less than 300
        ; and flashes the screen (well repeated calls flash it)
        ; based on the background music note sequence. Also plays
        ; a white noise sound
        LDA     var_remaining_time_msb
        CMP     #$03
        BCS     end_check_if_nearly_out_of_time

        ; Every fourth beat flash the screen white
        LDA     var_note_sequence_number
        AND     #$03
        BEQ     flash_screen_white_and_play_beep

        ; Top four bits are the logical colour to assign
        ; Bottom four bits are the physical colour to set
        ; $00 = 0000 0000
        ;
        ; Set logical colour 0 to physical colour 0 (Black)
        LDA     #$00
        JSR     fn_define_logical_colour

        ; Check to see if the player has changed their
        ; sound preferences by pressing a key i.e.
        ; S for sound on and Q for sound off
        JMP     fn_check_sound_keys

;257D
.flash_screen_white_and_play_beep
        ; Top four bits are the logical colour to assign
        ; Bottom four bits are the physical colour to set
        ; $07 = 0000 0007
        ;
        ; Set logical colour 0 to physical colour 7 (White)
        LDA     #$07
        JSR     fn_define_logical_colour

        ; Set the sound channel to white noise 0 ($x0) 
        ; with the immediate flush of the sound channel
        ; to play the note ($1x)
        LDA     #$10
        STA     zp_required_sound_channel

        ; Set the pitch to 10
        TAX
        ; Set the amplitude to -15 (loudest)
        LDA     #$F1
        ; Set the duration to 1 (1/20th of a second)
        LDY     #$01
        JSR     fn_play_music_sound

;258E
.end_check_if_nearly_out_of_time
        JMP     fn_check_sound_keys

;2591
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

;25A3
.fn_display_repton_logo_for_high_score_entry
        ; Dissolve the screen
        JSR     fn_dissolve_screen

        ; This is almost identical to $17B8

        ; The Repton logo isn't a bitmap graphic as such
        ; it's a series of user defined characters
        ; the same ones used for the map - and 
        ; that's how it's defined in memory.  So
        ; load the charactes and display the right
        ; tile / user defined character

        ; Set the text cursor position to (0,3)
        ; Set the x part
        LDA     #$00
        STA     zp_password_cursor_xpos

        ; Set the colour mask to show black and
        ; red only         
        LDA     #$0F
        STA     zp_screen_colour_mask

        ; Set the y part
        LDA     #$03
        STA     zp_password_cursor_ypos

        ; Set the byte counter for the loading 
        ; and displaying the repton logo to zero 
        LDA     #$00
        STA     zp_screen_write_total_byte_counter
;25B6
.loop_get_next_repton_logo_char
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
        BNE     loop_get_next_repton_logo_char

        RTS

;25C7
.fn_wait_for_vsync_and_set_sheila_address_to_12
        ; Wait for vertical sync
        JSR     fn_wait_for_vertical_sync

        ; Set SHEILA_6845_ADDRESS to #$0C/12
        LDA     #$0C
        STA     SHEILA_6845_ADDRESS
        RTS        

;25D0
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

;25F4
.game_started
        JMP     fn_write_r_to_restart

        ; Spare bytes
        NOP
        NOP

;L25F9
.fn_check_p_key
        ; Check to see if the player has 
        ; asked for the music to be switched 
        ; on or off or pressed restart
        JSR     fn_check_r_d_w_keys

        ; If less than four lives are 
        ; left then return - player can't enter 
        ; a password when in a game
        LDA     var_lives_left
        CMP     #$03
        BNE     end_check_p_key

        ; Check to see if score is positive
        ; or if there is any remaining time
        ; if not, return - player can't enter 
        ; a password when in a game
        LDA     var_score_lsb
        ORA     var_score_mlsb
        ORA     var_score_msb
        ORA     var_remaining_time_lsb
        BNE     end_check_p_key

        ; Wait for a key press of P
        LDA     #$C8
        JSR     fn_read_key

        ; If it was't pressed branch away
        BEQ     end_check_p_key

        ; Set current screen and started on screen to
        ; unknown
        LDA     #$FF
        JSR     fn_set_start_and_started_on_screen

        ; Display the password entry screen
        JSR     fn_display_password_screen

        ; Reset the game to a new game
        JSR     fn_reset_game

        ; TODO No idea what's on the stack at this point
        ; but it's cleared and thrown away
        PLA
        PLA

        ; Continues below
;2625
fn_check_intro_music
        ; If player has all lives and score is zero
        ; then play the intro music as it's the
        ; start of a game
        JSR     fn_check_if_intro_music_should_play

        ; Dissolve the screen 
        JMP     fn_dissolve_screen

;262B
.end_check_p_key
        RTS

;262C
        ; TODO
        LDA     $71
        LSR     A
        LSR     A
        ADC     #$F1
        JMP     fn_play_music_sound

; 2635
        ; Spare bytes - 11
        RTS
        RTS
        RTS
        RTS
        RTS
        RTS
        RTS
        RTS
        NOP
        NOP
        NOP

; 2640
.fn_game_start
        ; Reset the time remaining to $60xx
        LDA     #$60
        STA     var_remaining_time_msb

        ; Set the restart pressed flag so the high
        ; scores aren't shown
        LDA     #$FF
        STA     var_restart_pressed

        ; Initialise the game
        JMP     fn_initialise_game

;264D
.fn_set_high_score_mlsb_and_start_screen
        LDA     #$80
        JSR     fn_set_start_screen_and_reset_game

;2652
.end_check_if_intro_music_should_play
        RTS        
;2653
.fn_check_if_intro_music_should_play
        ; Check to see if there are still four lives left
        LDA     var_lives_left
        CMP     #$03
        BNE     end_check_if_intro_music_should_play

        ; Four lives left
        ; Check to see if a new game has started
        ; yet - if not branch ahead
        ; When a new game has started, the score
        ; will be 1 or greater. Also check the
        ; the time LSB isn't zero (there's a chance)
        ; a player could come back to the screen before
        ; the score has been updated on a new game
        ;
        ; If it is a new game then play the intro music!
        LDA     var_score_lsb
        ORA     var_score_mlsb
        ORA     var_score_msb
        ORA     var_remaining_time_lsb
        BNE     end_check_if_intro_music_should_play

        ; Play the short intro music and return
        JMP     fn_play_intro_music   

;266B
.fn_set_start_screen_and_reset_game
        ; Set the middle high score digits to whatever
        ; is passed in A ($80)
        STA     var_high_score_mlsb

        ; Set A to 0 for the start and started on screen
        LDA     #$00

        ; Set the start screen and started on screen to 0
        JSR     fn_set_start_and_started_on_screen

        ; Reset the game
        JSR     fn_reset_game

        RTS

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

        ; Display the high scores on the screen
        JSR     fn_sort_and_display_scores

        ; Show the repton logo on the high score screen
        JSR     fn_show_high_score_repton_logo

        ; Wait for the player to hit the space bar
        JSR     fn_loop_wait_for_space_bar_on_screen

;2695
.end_show_high_score_table
        ; Reset the "hide high score screen" flag
        LDA     #$00
        STA     var_restart_pressed
        RTS        

;269B
        ; Spare bytes - 5
        EQUB    $FF,$FF,$FF,$FF,$FF

;26A0
.fn_set_start_and_started_on_screen
        ; Set the start and started on screens
        ; to the value passed in A 
        STA     var_screen_number
        STA     var_player_started_on_screen_x
        RTS

;26A7
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
        JMP     fn_initialise_game_after_restart

;26B4
        ; Spare bytes - 76
        EQUB    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        EQUB    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        EQUB    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        EQUB    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        EQUB    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        EQUB    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        EQUB    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        EQUB    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        EQUB    $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        EQUB    $FF,$FF,$FF,$FF
;2700
INCLUDE "repton-has-been-finished.asm"
;29FF

;2A00
.fn_replace_lowest_high_score_with_current
        
        ; Get the lowest high score index that
        ; was cached previously when scanning the
        ; high score table
        LDX     var_lowest_high_score_index

        ; Change the lowest high score index 
        ; value to the player's high score
        LDA     var_score_lsb
        STA     data_high_scores,X
        LDA     var_score_mlsb
        STA     data_high_scores+1,X
        LDA     var_score_msb
        STA     data_high_scores+2,X

        ; Multiply the lowest high score index
        ; by 8 as each high score name is 24 
        ; characters long and the index is 
        ; multiples of 3 based as each score is 
        ; 3 bytes long
        TXA
        ; Multiply by 2
        ASL     A
        ; Multiply by 2
        ASL     A
        ; Multiply by 2
        ASL     A
        TAX

        ; Read the player entered name and replace
        ; the lowest high score name in the high score
        ; table with it
        LDY     #$00
;2A1C
.loop_copy_high_score_name
        ; Get the current nth character of the name
        LDA     data_player_entered_password_or_name,Y
        ; Store it in the high score table
        STA     data_high_score_names,X
        ; Move to the next character
        INX
        INY
        ; If not all 24 characters have been copied
        ; then loop again
        CPY     #$18
        BNE     loop_copy_high_score_name

        RTS


;2A29
.fn_cache_lower_high_score
        ; Cache the lowest score so 
        ; far index position
        STX     L0923

        ;  Cache the lowest score LSB
        LDA     data_high_scores,X
        STA     var_lowest_high_score_lsb

        ;  Cache the lowest score MLSB
        LDA     data_high_scores+1,X
        STA     var_lowest_high_score_mlsb

        ;  Cache the lowest score MSB
        LDA     data_high_scores+2,X
        STA     var_lowest_high_score_msb

        RTS

;2A3F
.fn_call_osword_and_reset_score
        JSR     OSWORD

        LDA     #$00
        ; Set the score to zero
        STA     var_score_lsb
        STA     var_score_mlsb
        STA     var_score_msb
        RTS

;2A4E
.fn_display_completed_screen
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

        ; Spare bytes
        NOP
        NOP
        NOP
        NOP             

        ; Copy the REPTON has been FINISHED
        ; graphics onto the screen - it's 
        ; 3 pages long        
        LDY     #$00
;2A64
.loop_repton_finished_logo
        LDA     data_repton_has_been_finished_page_1,Y
        STA     $6500,Y
        LDA     data_repton_has_been_finished_page_2,Y
        STA     $6600,Y
        LDA     data_repton_has_been_finished_page_3,Y
        STA     $6700,Y
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

;2AAB
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

;2AC2
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

        ; Spare bytes - 2
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
;2AF2
.end_check_and_update_high_score
        RTS

;2AF3
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

;2AFF 
        ; Spare byte - 1
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
        ; Spare Bytes - 29
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

;2C0B
        ; Spare bytes - 10
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
        JSR     fn_get_player_password_or_name

        ; Reset the screen password index to zero
        ; before trying to match passwords
        LDA     #$00
        STA     zp_screen_password_lookup_index
;2C55
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
;2C62
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

;2C71
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
        ; Spare bytes 3
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
        EQUS    "Last Score : ",$0D

        ; Spare bytes - 16
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

;2D57 - Spare Byte        
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

;2DF4
.fn_write_password_to_screen
        JSR     fn_write_string_to_screen
        JMP     L10F4


;2E00
.fn_get_player_password_or_name
        ; Set the entered password length to zero
        ; as the player hasn't entered anything yet
        LDA     #$00
        STA     zp_password_character_count
        
        ; Flush keyboard buffer and all other buffers
        JSR     fn_flush_all_buffers_cache_xpos_and_ypos

        ; Spare byte - 1
        NOP

        ; Set the colour mask to only use
        ; the high nibble colours
        LDA     #$F0
        STA     zp_screen_colour_mask
;2E0C
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

;2E1B
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



;2E31
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

;2E4D
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
        STA     data_player_entered_password_or_name,X
        INC     zp_password_character_count
        JMP     read_next_password_character

;...
;2E64
.fn_set_rest_of_password_to_crs
        ; Entered passwords in memory can be up to 24 
        ; characters long - set all characters to carriage
        ; returns after the password to the end of the 
        ; memory buffer
        LDX     zp_password_character_count
        LDA     #$0D
;2E68
.loop_set_carriage_return
        ; Set the current position to a CR
        STA     data_player_entered_password_or_name,X
        INX
        ; Have we reached the end of the memory buffer
        ; if not loop back
        CPX     #$18
        BCC     loop_set_carriage_return

        ; Set A to the length of the entered password
        LDA     zp_password_character_count
        RTS
;...

;2E73
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

;2EB3
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
;2EC8
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
.data_player_entered_password_or_name
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