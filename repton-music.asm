org &1900

OSWORD = $FFF1

OSBYTE = $FFF4

OS_ZP_INTERRUPT_A_STORAGE=$00FC

; Sheila System Via Interrupt Enable Register
SHEILA_SYSTEM_VIA_R14_IER=$FE4E
; Sheila System Via Interrupt Flag Register
SHEILA_SYSTEM_VIA_R14_IFR=$FE4D

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

; Interrupt-request vector 2 (IRQ2V)
IRQ2V_LSB = $0206
IRQ2V_MSB = $0207

zp_music_block_channel_lsb=$0060

zp_music_block_channel_msb=$0061

zp_music_block_amplitude_lsb=$0062

zp_music_block_amplitude_msb=$0063

zp_music_block_pitch_lsb=$0064

zp_music_block_pitch_msb=$0065

zp_music_block_duration_lsb=$0066

zp_music_block_duration_msb=$0067

var_note_sequence_number=$09FE

var_music_rate_cycle=$09FF

eventv_lsb_vector = $0220
eventv_msb_vector = $0221

.main_code_block_start




.main
        LDA     #$08
        LDX     #LO(envelope_1)
        LDY     #HI(envelope_1)
        JSR     OSWORD

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
        ; Called sub-routine ends with an RTI
        JMP     fn_disable_timer_2

.fn_event_handler_IRQ2V
        ; This is the IRQ2V event handler routine
        ; when Timer 2 fires - pointed at by IRQ2V

        ; This plays the music for the game and
        ; plays 3 notes in rapid succession on 
        ; Channel 1 to give a pseudo chord effect

        ; This is NOT used to play the intro music
        ; when a new game starts

        ; First  note is stored $0A00-$0AFF
        ; Second note is stored $0B00-$0BFF
        ; Third  note is stored $0C00-$0CFF

        ; All parameters are the same other than the
        ; pitch i.e. channel, amplitude, volume

        ; Preserve A, X and Y and on the stack
        ; as this is processing an interrupt 
        ; (will get restored before returning)
        TXA
        PHA
        TYA
        PHA

        ; Limit the rate at which the notes are played
        ; only play every 8th time this is called - this is
        ; achieved by ANDing with 7 / 0000 0111 so will only
        ; play when the result is zero
        INC     var_music_rate_cycle
        LDA     var_music_rate_cycle
        AND     #$07
        BNE     end_event_handler_IRQ2V        

        ; Get the next note sequence number to play
        INC     var_note_sequence_number

        ; Set initial channel to channel 1 ($x1)and 
        ; flush the sound channel ($1x) if a note is 
        ; already playing
        LDA     #$11
        STA     zp_music_block_channel_lsb

        ; Get the next note sequence number to play
        LDX     var_note_sequence_number

        ; Load the note and play the note
        LDA     data_first_chord_note,X
        ;JSR     fn_set_sound_block_and_play_sound

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
        ;JSR     fn_set_sound_block_and_play_sound

        ; End the processing here
        JMP     end_event_handler_IRQ2V

.fn_set_sound_block_and_play_sound
        ; Called by the IRQ2V event handler above
        ; and used to play the in-game music only
        ; Assumes the LSBs (other than pitch) in the
        ; sound block have been set, sets the pitch
        ; LSB to whatver is in A and zeros the MSBs

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

        ; Play the sound and return
        JMP     fn_play_game_sound

.fn_play_game_sound

        ; If the sound pitch is zero skip playing
        ; the sound
        LDA     zp_music_block_pitch_lsb
        BEQ     skip_play_sound

        ; OSWORD &07
        ; Perform a sound command
        ; XY contains the sound parameter address block
        LDA     #$07
        JSR     OSWORD

.skip_play_sound
        ; Increment the sound channel (moves between &11 and &13)
        INC     zp_music_block_channel_lsb
        RTS

.fn_enable_timer_2
        ; Called everytime there is a VSYNC event 
        ; (50 times a second, every 20ms)
        ;
        ; Enable Timer 2 on the User VIA
        ; by called the User VIA Interrupt Enable
        ; Register 
        ; 1010 0000
        LDA     #$A0
        STA     SHEILA_USER_VIA_R14_IER

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

.fn_disable_timer_2
        ; Disable Timer 2 on the User VIA
        ; by called the User VIA Interrupt Enable
        ; Register (IER)
        ; 0010 0000
        LDA     #$20
        STA     SHEILA_USER_VIA_R14_IER

        ; Restore the accumulator's old value
        LDA     OS_ZP_INTERRUPT_A_STORAGE
        RTI                

.envelope_1
        ; OSWORD &08 / ENVELOPE Parameter block
        ; ENVELOPE 1,2,0,0,0,1,2,3,100,1,255,254,126,126
        EQUB    $01,$02,$00,$00,$00,$01,$02,$03
        EQUB    $64,$01,$FF,$FE,$7E,$7E        

INCLUDE "repton-main-music.asm"

.main_code_block_end

SAVE "MUSIC", main_code_block_start, main_code_block_end, $1900