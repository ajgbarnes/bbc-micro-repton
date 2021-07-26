; Disassembly and annotation of Repton by Superior Software
; 
; Originally written by Tim Tyler (c) Copyright 1984
;
; Disassembly labels and comments by Andy Barnes (c) Copyright 2021
; Twitter: @ajgbarnes

org     $2F00

; Write character (to screen) from A
OSWRCH = $FFEE
; Perfrom miscellaneous OS operation using control block to pass parameters
OSWORD = $FFF1
; Perfrom miscellaneous OS operation using registers to pass parameters
OSBYTE = $FFF4

SHEILA_6845_address=$FE00
SHEILA_6845_data=$FE01
SHEILA_SYS_VIA_REG_B_CTL=$FE40

; OS Workspace 
OS_WS_SCREEN_SIZE_PAGES=$0354
OS_WS_MSB_OF_HIMEM=$034E
OS_WS_NO_BYTES_PER_ROW_LSB=$0352
OS_WS_NO_BYTES_PER_ROW_MSB=$0353
OS_WS_SIZE_OF_SCREEN_MEMORY=$0356
OS_WS_CURRENT_MODE=$0355

WRCHV_LSB = $020E
WRCHV_MSB = $020F
IND1V_LSB =$0230
IND1V_MSB =$0231
FSCV_LSB = $021E

unknown_data_target=$03B0
target_custom_wrchv=$0400
relocate_game_code_target=$0700

buffer_character_definition=$0C7F
buffer_character_target=$0CF0
unused_buffer_character_definition=$0C80
unused_buffer_character_target = $0CF0

fn_game_start = $2640


zp_code_source_lsb = $0070
zp_code_source_msb = $0071
zp_code_target_lsb = $0072
zp_code_target_msb = $0073
zp_wrchv_chars_written = $008E


zp_wrchv_x_cache = $0070
zp_wrchv_y_cache = $0071


.BeebDisStartAddr
        ; Copy 48 bytes from 2fd0 to 03b0 (not sure why)
        LDX     #$00
        ;2f02
.byte_copy_loop
        LDA     unknown_data_source,X
        STA     unknown_data_target,X
        INX
        CPX     #$30
        BNE     byte_copy_loop

        JMP     fn_main
;...
;2F10
INCLUDE "graphics-unused.asm"
;2FCC

        ;EQUB    $00
;2FD0

.unknown_data_source
        EQUS    $00,$00,"REPTON2",$00,$00,$00,$00,$00,$00,$0E,$00,$00,$00,$07,$00,$00,"U",$00,$00,$01,$80,$00,$00,$00,$00,"b",$C5,$19,"REPTON2",$00,$00,$00,$00,$00,$00,$80

;3000
; File defines the loading screen graphic (man running with monster)
; and the superior software logo
;2FC0
INCLUDE "graphics-load-screen.asm"
; 4100
.fn_main
        ; Switch to MODE 5
        ; OSWRCH &16
        LDA     #$16
        JSR     OSWRCH
        LDA     #$05
        JSR     OSWRCH

        ; Define Logical colour 3 as Green
        ; OSWRCH &13 / VDU 19, 3, 2, 0, 0, 0
        LDA     #$13
        JSR     OSWRCH
        LDA     #$03
        JSR     OSWRCH
        LDA     #$02
        JSR     OSWRCH
        LDA     #$00
        JSR     OSWRCH
        JSR     OSWRCH
        JSR     OSWRCH

        ; Switch off the cursor 
        ; SHEILA register &0A / 10 
        ; 7-bit register and it's sent 0100000
        ; Bit 7 - 0 - not used
        ; Bits 6-5 - 10 - Enabled, 16 x field rate (fast)
        ; Bits 4-1 - 0000 - cursor start line 0
        LDA     #$0A
        STA     SHEILA_6845_address
        LDA     #$20
        STA     SHEILA_6845_data

        ; Set characters per line to $20 / 32
        ; (Means only 16 characters will be visible)
        ; (Defaults normally to 20 characters visible)
        ; SHEILA register &01 / 01         
        LDA     #$01
        STA     SHEILA_6845_address
        LDA     #$20
        STA     SHEILA_6845_data

        ; Set the horizontal sync position register to push the 
        ; screen to the right to centralise the display because
        ; characters per line were reduced above
        ; SHEILA register &02 / 02
        ; 0010 1110 / $2E / 46
        ; Note it defaults to 49 in Mode 5
        LDA     #$02
        STA     SHEILA_6845_address
        LDA     #$2E
        STA     SHEILA_6845_data

        ; Update the OS workspace to change the size of the
        ; current screen mode in pages to $20 / 32
        LDA     #$20
        STA     OS_WS_SCREEN_SIZE_PAGES        

        ; Update the OS workspace to change the MSB of HIMEM
        ; to $60
        LDA     #$60
        STA     OS_WS_MSB_OF_HIMEM


        ; Update the OS workspace to change the number of
        ; bytes per character row to $100  / 256
        LDA     #$00
        STA     OS_WS_NO_BYTES_PER_ROW_LSB
        LDA     #$01
        STA     OS_WS_NO_BYTES_PER_ROW_MSB

        ; Update the OS workspace to change the current
        ; screen size memo  ry to 8k (value 3)
        LDA     #$03
        STA     OS_WS_SIZE_OF_SCREEN_MEMORY

        ; Update the OS workspace so it knows the screen
        ; is in Mode 5 (why is it set to 6)
        LDA     #$06
        STA     OS_WS_CURRENT_MODE

        ; Disable maskable interrupts
        SEI

        ; Switch off Caps Lock - the top four bits
        ; are ignored given the DDRB is in the default state
        ; for output not input - weird as it gets reset
        ; on the next interrupt after the CLI
        LDA     #$7E
        STA     SHEILA_SYS_VIA_REG_B_CTL

        ; Set the hardware scrolling start address to $5800
        ; https://tobylobster.github.io/mos/mos/S-s3.html
        LDA     #$0C
        STA     SHEILA_SYS_VIA_REG_B_CTL
        LDA     #$05
        STA     SHEILA_SYS_VIA_REG_B_CTL

        ; Allow maskable interrupts again
        CLI        

        ; Clear the text area
        ; OSWRCH &0C
        LDA     #$0C
        JSR     OSWRCH

        ; Copy the 17 pages fo the loading
        ; screen to the visible screen memory
        ; Copied from $3000 - $40FF
        ;          to $6300 - $74FF
        LDX     #$00
.loop_copy_loading_screen
        LDA     $3000,X
        STA     $6300,X
        LDA     $3100,X
        STA     $6400,X
        LDA     $3200,X
        STA     $6500,X
        LDA     $3300,X
        STA     $6600,X
        LDA     $3400,X
        STA     $6700,X
        LDA     $3500,X
        STA     $6800,X
        LDA     $3600,X
        STA     $6900,X
        LDA     $3700,X
        STA     $6A00,X
        LDA     $3800,X
        STA     $6B00,X
        LDA     $3900,X
        STA     $6C00,X
        LDA     $3A00,X
        STA     $6D00,X
        LDA     $3B00,X
        STA     $6E00,X
        LDA     $3C00,X
        STA     $7000,X
        LDA     $3D00,X
        STA     $7100,X
        LDA     $3E00,X
        STA     $7200,X
        LDA     $3F00,X
        STA     $7300,X
        LDA     $4000,X
        STA     $7400,X
        INX
        BNE     loop_copy_loading_screen

        ; Back up the "write characters to current output screen"
        ; vector value - INDIV1 is used by the custom handler
        ; to call before it does its own thing
        LDA     WRCHV_LSB
        STA     IND1V_LSB
        LDA     WRCHV_MSB
        STA     IND1V_MSB

        ; Write the address of the new indirection vector
        ; (custom code) to call a routine at $0403 - routine
        ; will be copied there after this is set
        LDA     #LO(target_custom_wrchv) + 3
        STA     WRCHV_LSB
        LDA     #HI(target_custom_wrchv)
        STA     WRCHV_MSB

        ; Copy the custom wrchv code to $0400 - $04FF
        LDX     #$00
;L41F9
.loop_copy_custom_wrchv
        LDA     source_custom_wrchv,X
        STA     target_custom_wrchv,X
        INX
        BNE     loop_copy_custom_wrchv

        ; Initialise the character count
        LDA     #$00
        STA     zp_wrchv_chars_written

        ; Suppress file system messages (no messages)
        ; *OPT 1,0
        ; OSBYTE &8B
        LDA     #$8B
        LDX     #$01
        LDY     #$00
        JSR     OSBYTE

        ; Display the Press Space Bar text and wait for the 
        ; key press
        JSR     display_press_space_and_wait

        ; Tell the OS to ignore the function keys
        ; OSBYTE $E1
        ; X = FF, Y=FF after space bar detection
        ; Is this mistakenly doing a *FX 225,255?
        LDA     #$E1
        JSR     OSBYTE

        NOP
        ; Set XY to the location of the filename to *RUN
        LDX     #LO(text_filename)
        LDY     #HI(text_filename)

        ; Weird - A regiser value isn't used in sub-routine
        ; Presumably initially the sub-routine called
        ; FSCV immediately and this was used to do the *RUN
        LDA     #$04
        JMP     fn_move_relocate_game_code
;...

;--------------------------------------------------------------
; UNUSED CODE!
;
; Code below is (almost) a copy of the WRCHV at $4400 routine 
; and isn't called by anything in REPTON1 - uncommented because
; of that. Looks like an earlier version of WRCHV routine as it
; has more function
;4221
.unused_source_custom_wrchv
        JMP     (IND1V_LSB)

        STX     zp_wrchv_x_cache
        STY     zp_wrchv_y_cache
        CMP     #$0D
        BNE     unused_wrchv_not_cr

        LDA     #$1F
        JSR     target_custom_wrchv

        LDA     #$00
        JSR     target_custom_wrchv

        LDA     #$18
        JSR     target_custom_wrchv

        LDA     #$00
        STA     zp_wrchv_chars_written
        JMP     target_custom_wrchv + (unused_inc_chars_written_and_restore_x_y - unused_source_custom_wrchv)

;L4242
.unused_wrchv_not_cr
        CMP     #$0A
        BNE     unused_wrchv_not_cursor_down

        JSR     target_custom_wrchv + (unused_loop_copy_memory - unused_source_custom_wrchv)

        NOP
        NOP
        JMP     target_custom_wrchv + (unused_inc_chars_written_and_restore_x_y - unused_source_custom_wrchv)

;L424E
.unused_wrchv_not_cursor_down
        ; This is different to the used routine - in the used routine
        ; it does a JMP target_custom_wrchv but here it checks for a
        ; if A is less than $20/32
        CMP     #$20
        BCC     unused_wrchv_write_character

        ; A > 32 so check if it's a custom character (otherwise
        ; just write it to the screen). If it is custom, 
        ; query the raster data for the character
        CMP     #$7F
        BCC     unused_wrchv_query_raster_data

;L4256
.unused_wrchv_write_character

        JSR     target_custom_wrchv

        JMP     target_custom_wrchv + (unused_restore_x_and_y - unused_source_custom_wrchv)
;L425C
.unused_wrchv_query_raster_data
        STA     buffer_character_definition
        LDA     #$0A
        LDX     #$7F
        LDY     #$0C
        JSR     OSWORD

        LDX     #$00
        LDY     #$00
;L426C
.unused_loop_copy_characters
        LDA     unused_buffer_character_definition,X
        STA     unused_buffer_character_target,Y
        STA     unused_buffer_character_target+1,Y
        INY
        INY
        INX
        CPX     #$08
        BNE     unused_loop_copy_characters

        LDA     #$FF
        JSR     target_custom_wrchv

        LDY     #$10
;L4283
.unused_loop_cursor_back
        LDA     #$08
        JSR     target_custom_wrchv

        DEY
        BPL     unused_loop_cursor_back

        LDA     #$FE
        JSR     target_custom_wrchv

        LDY     #$0F
;L4292
.unused_loop_cursor_forward
        LDA     #$09
        JSR     target_custom_wrchv

        DEY
        BPL     unused_loop_cursor_forward


;429A
.unused_inc_chars_written_and_restore_x_y       
        INC     zp_wrchv_chars_written
 
;429C
.unused_restore_x_and_y
        LDX     zp_wrchv_x_cache
        LDY     zp_wrchv_y_cache
        RTS
;42A1
.unused_text_filename
        EQUS    "Repton2"
        EQUB    $0D        

;42A9
.unused_loop_copy_memory        
        LDY     #$00
;42AB
.unused_loop_copy_memory_2
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        LDA     $7700,Y
        STA     $7500,Y
        LDA     $7800,Y
        STA     $7600,Y
        LDA     $7900,Y
        STA     $7700,Y
        LDA     $7A00,Y
        STA     $7800,Y
        LDA     $7B00,Y
        STA     $7900,Y
        LDA     $7C00,Y
        STA     $7A00,Y
        LDA     $7D00,Y
        STA     $7B00,Y
        LDA     $7E00,Y
        STA     $7C00,Y
        LDA     $7F00,Y
        STA     $7D00,Y
        LDA     #$00
        STA     $7E00,Y
        STA     $7F00,Y
        DEY
        BNE     unused_loop_copy_memory_2

        RTS

; END OF UNUSED CODE
;--------------------------------------------------------------




;L42F3
.fn_move_relocate_game_code
        ; Write a carriage return to the screen
        LDA     #$0D
        JSR     OSWRCH
        
        ; Write a new line to the screen
        LDA     #$0A
        JSR     OSWRCH

        ; X currently points at the LSB for the filename 
        ; to *RUN so preserve it whilst some code is copied
        TXA
        PHA

        ; Relocate the code that will move the REPTON2
        ; down in memory by $1300.  Weirdly, it takes 
        ; the full page from 4320 - 441F and moves to
        ; $0A00 - $0AFF when it looks like it only
        ; needs 82 bytes  - so it moves some of the 
        ; printing of the press the space bar cade, the
        ; REPTON1 entry point and waiting for space bar code
        ; which aren't required by the main game
        LDX     #$00
;4301
.loop_relocate_game_code
        ; Copy a page of code 
        LDA     fn_relocate_game_code,X
        STA     relocate_game_code_target,X
        INX
        BNE     loop_relocate_game_code

        ; Do nothing, spare bytes
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP

        ; Make X point at the LSB for the filename to *RUN 
        PLA
        TAX
        ; Calls the File System Control Vector (FSCV)
        ; And performs a *RUN / $04 with the filename at the 
        ; location pointed at by XY
        ; *RUN Repton2
        ;
        ; Note the execution address is $0700 so it'll
        ; call the fn_relocate_game_code routine that was
        ; moved to $0700 above when it loads
        LDA     #$04
        JMP     (FSCV_LSB)
        ;Ends

; Spare bytes
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00

; --------------------------------------------------------
; Code block that's relocated to 0700 - 07FF
; The code will move the REPTON2 game code down in memory
; once it is loaded
;4320

.fn_relocate_game_code
        ; OSBYE &8C
        ; X=12 perform *TAPE at 1200 baud
        ; Same as a *TAPE12 command 
        ; Presumably to quiesce the DFS
        LDA     #$8C
        LDX     #$0C
        JSR     OSBYTE

        ; Initilaise the zero page variables
        ; Source is set to $1D00
        ; Target is set to $0A00
        ;
        ; Relocates the game code from $1D00-$7300 
        ; ($5600 bytes) to $0A00 to $6000

        LDA     #$00
        STA     zp_code_source_lsb
        STA     zp_code_target_lsb
        LDA     #$1D
        STA     zp_code_source_msb
        LDA     #$0A
        STA     zp_code_target_msb

        ; Use Y to copy a page of bytes then
        ; increment the source and target msbs
        ; and copy another page etc...
        LDY     #$00
;4337
.loop_get_next_eor_byte
        ; Loop and copy $FF / 255 bytes
        ; All the code is obfuscated and needs
        ; to be de-obfuscated by EORing with $FF
        LDA     (zp_code_source_lsb),Y
        EOR     #$FF
        STA     (zp_code_target_lsb),Y       
        INY
        BNE     loop_get_next_eor_byte

        ; Move to the next source/target page
        ; and copy
        INC     zp_code_target_msb
        INC     zp_code_source_msb

        ; Check to see if we have relocated $70 / 112 pages
        ; ($7000 bytes)if not, loop around again
        LDA     zp_code_target_msb
        CMP     #$70
        BNE     loop_get_next_eor_byte

        ; No longer call the custom WRCHV routine
        ; replace it with the original
        LDA     IND1V_LSB
        STA     WRCHV_LSB
        LDA     IND1V_MSB
        STA     WRCHV_MSB

        ; Initialise 6000-62FF with zeros - that's on screen
        ; data and there was code there before it was relocated 
        ; above
        LDX     #$00
        LDA     #$00
.loop_zero_memory
        STA     $6000,X
        STA     $6100,X
        STA     $6200,X
        INX
        BNE     loop_zero_memory

        ; OSWRCH &0C
        ; Clear text area
        LDA     #$0C
        JSR     OSWRCH

        ; Set memory to be cleared on Break 
        ; and disable escape key (*FX 200,3)
        ; OSBYTE &C8
        LDX     #$03
        LDY     #$00
        LDA     #$C8
        JSR     OSBYTE

        ; Set characters per line to $20 / 32 
        ; (normally 40)
        ; SHEILA register &01 / 01
        LDA     #$01
        STA     SHEILA_6845_address
        LDA     #$20
        STA     SHEILA_6845_data

        ; Start the game by calling the code in REPTON2
        JMP     fn_game_start
        EQUB    $00
; End routine for relocation (although it copies up to $441F)
; but doesn't use beyond here when relocated - from here
; on it's called at runtime in REPTON1
; --------------------------------------------------------
;4382
.text_press_space_bar

        ; OSWRCH characters
        ; $0A moves the cursor down one line
        ; $0D moves cursor to the start of the line
        ; $11 defines the text colour

        ; Move the cursor down 7 lines and
        ; put it at the start of the line
        EQUB    $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0D
        ; Set the text colour to red
        EQUB    $11,$01
        ; First part of the string to write to the screen
        EQUS    "Press "
        ; Set the text colour to yellow
        EQUB    $11,$02
        EQUS    "SPACE BAR."
        ; Two spare bytes (assume they used to be "..")
        ; VDU 0 does nothing
        EQUB    $00,$00        

; 43A0
.fn_entry_point
        ; Disable the start of vertical sync event
        ; OSBYTE &0D
        LDA     #$0D
        LDX     #$04
        JSR     OSBYTE

        JMP     BeebDisStartAddr

        RTS

; 43AB
.display_press_space_and_wait
        ; Flush the input buffer (keyboard)
        ; X register is always set to 1 at this point
        LDA     #$0F
        JSR     OSBYTE

        ; Display the "Press Space Bar." text on screen
        ; $1C / 28 control codes and characters to output
        LDX     #$00
.loop_display_text_press_space_bar
        LDA     text_press_space_bar,X
        JSR     OSWRCH

        INX
        CPX     #$1C
        BNE     loop_display_text_press_space_bar

.loop_wait_for_space_bar
        ; Waits for the space bar to be pressed
        ; OSBYTE &81
        ; Scan keyboard for keypress of key in X
        ; X - negative inkey value of key ($9D is -99)
        ;     which is the space bar
        ; Y - always $FF
        LDA     #$81
        LDX     #$9D
        LDY     #$FF
        JSR     OSBYTE

        ; On exit X and Y will be $00 if space not pressed
        ; or $FF if pressed
        TYA
        BEQ     loop_wait_for_space_bar


        ; Set characters per line to $00 / 0
        ; SHEILA register &01 / 01       
        LDA     #$01
        STA     SHEILA_6845_address
        LDA     #$00
        STA     SHEILA_6845_data
        RTS

        ; Spare bytes
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00
        EQUB    $00,$00,$00,$00
;4400
.source_custom_wrchv
        ; Custom handler for WRCHV

        ; Call the standard WRCHV handler i.e. OSWRCH 
        ; in the MOS that was cached in IND1V - always
        ; called by the custom handler at some point at least
        ; once
        JMP     (IND1V_LSB)

        ; -------------------------------------------
        ; Entry point for the WRCHV vector i.e. $0403
        ; -------------------------------------------
        ; Cache the values of X and Y as X and Y are used
        ; in this subroutine - they get restored at the end
        STX     zp_wrchv_x_cache
        STY     zp_wrchv_y_cache

        ; Check to see if a carriage return was sent to the
        ; screen - it not then branch ahead
        CMP     #$0D
        BNE     wrchv_not_cr

        ; Carriage return was specified so send the move the cursor
        ; command $1F - e.g. PRINT TAB(x,y) where x = $0 and y = $18
        LDA     #$1F
        JSR     target_custom_wrchv

        ; Send the x co-ordinate to the screen
        LDA     #$00
        JSR     target_custom_wrchv

        ; Send the y co-ordinate to the screen
        LDA     #$18
        JSR     target_custom_wrchv

        ; Initialise the character count
        LDA     #$00
        STA     zp_wrchv_chars_written

        JMP     target_custom_wrchv + (inc_chars_written_and_restore_x_y - source_custom_wrchv)

;L4421
.wrchv_not_cr
        ; Check to see if the move cursor down one line
        ; control code was sent to the screen - if not
        ; branch ahead
        CMP     #$0A
        BNE     wrchv_not_cursor_down

        JSR     target_custom_wrchv + (loop_copy_memory_2 - source_custom_wrchv)

        NOP
        NOP

        JMP     target_custom_wrchv + (inc_chars_written_and_restore_x_y - source_custom_wrchv)

;L442D
.wrchv_not_cursor_down
        ; Write the character - looks like the earlier incarnation
        ; of this code at $424E checked for a space bar first
        JMP     target_custom_wrchv

        ;JUnk byte
        EQUB    $04

        ; Unused 
        ; NEVER CALLED by this code
        ; Checks to see if \the value is a custom char (> 128)
        ; If it is, write it to the screen otherwise branch ahead

        CMP     #$7F
        BCC     wrchv_query_raster_data

        ; Here is A is >= $7F

        JSR     target_custom_wrchv

        JMP     target_custom_wrchv + (restore_x_and_y - source_custom_wrchv)

;L443B
.wrchv_query_raster_data
        ; Unused 
        ; NEVER CALLED by this code
        ; Store the character to be queried for its
        ; raster data at 0C7F
        STA     buffer_character_definition

        ; OSWORD &0A - Read character definition. 
        ; On entry $0C7F contains character to read
        ; On exit  Place the result at $0C7F + 1
        LDA     #$0A
        LDX     #LO(buffer_character_definition)
        LDY     #HI(buffer_character_definition)
        JSR     OSWORD

        JSR     target_custom_wrchv + (create_user_defined_character - source_custom_wrchv)

        ; Do nothing...
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
        ; OSBYTE &FF / VDU 255
        ; Write custom character 255 to the screen        
        LDA     #$FF
        JSR     target_custom_wrchv

        ; Move backwards 17 characters
        LDY     #$10
;4471
.loop_move_backward_one_character
        ; OSWORD &08 / VDU 08
        ; Move character backwards one position
        LDA     #$08
        JSR     target_custom_wrchv
        DEY
        BPL     loop_move_backward_one_character

        ; OSBYTE &FE / VDU 254
        ; Write custom character 254 to the screen
        LDA     #$FE
        JSR     target_custom_wrchv

        ; Move forward 16 characters
        LDY     #$0F
.loop_move_forward_one_character
        ; OSWORD &09 / VDU 09
        ; Move character forward one position
        LDA     #$09
        JSR     target_custom_wrchv
        DEY
        BPL     loop_move_forward_one_character
;4479
.inc_chars_written_and_restore_x_y
        INC     zp_wrchv_chars_written
;L447B
.restore_x_and_y
        LDX     zp_wrchv_x_cache
        LDY     zp_wrchv_y_cache        
        RTS

;L4480
.create_user_defined_character
        ; OSWORD &17 / VDU 23
        ; Create user defined character
        LDA     #$17
        JSR     target_custom_wrchv

        ; Second parameter - create character 254
        LDA     #$FE
        JSR     target_custom_wrchv

        LDX     #$00
.loop_FE_copy_next_character_byte
        ; Send the next 8 bytes
        LDA     buffer_character_target,X
        JSR     target_custom_wrchv

        INX
        CPX     #$08
        BNE     loop_FE_copy_next_character_byte

        ; OSWORD &17 / VDU 23
        ; Create user defined character
        LDA     #$17
        JSR     target_custom_wrchv

        ; Second parameter - create character 255
        LDA     #$FF
        JSR     target_custom_wrchv

.loop_FF_copy_next_character_byte
        ; Send the next 22 bytes - why not just 8?
        LDA     buffer_character_target,X
        JSR     target_custom_wrchv

        INX
        CPX     #$16
        BNE     loop_FF_copy_next_character_byte

        RTS

;44AD
; Junk byte? Doesn't appear to be used (letter "y")
        EQUB    $79

;44AE
.text_filename
        EQUS    "Repton2"
        EQUB    $0D

; Junk bytes
        EQUB    $A0,$00

;L44B8
.loop_copy_memory 
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
;L44BE
.loop_copy_memory_2
        ; Copy some memory... everything set to zero
        ; on the loader so doesn't do anything there
        LDA     $7700,Y
        STA     $7500,Y
        LDA     $7800,Y
        STA     $7600,Y
        LDA     $7900,Y
        STA     $7700,Y
        LDA     $7A00,Y
        STA     $7800,Y
        LDA     $7B00,Y
        STA     $7900,Y
        LDA     $7C00,Y
        STA     $7A00,Y
        LDA     $7D00,Y
        STA     $7B00,Y
        LDA     $7E00,Y
        STA     $7C00,Y
        LDA     $7F00,Y
        STA     $7D00,Y
        ; Zero the memory from $7E00 to &7FFF
        ; after copying them two pages lower in memory
        LDA     #$00
        STA     $7E00,Y
        STA     $7F00,Y
        DEY
        BNE     loop_copy_memory 

        RTS    
.BeebDisEndAddr            
SAVE "REPTON1",BeebDisStartAddr,BeebDisEndAddr,fn_entry_point