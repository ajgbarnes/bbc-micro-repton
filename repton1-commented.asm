; Disassembly and annotation of Repton by Superior Software
; 
; Originally written by Tim Tyler (c) Copyright 1984
;
; Disassembly labels and comments by Andy Barnes (c) Copyright 2021
;
; Twitter @ajgbarnes


; Code
; ----
; - Main entry point on load is fn_entry_point ($43A0)
; 
; Timers
; ------
; - None
;
; Sound
; -----
; - None
;
; General
; -------
; 1. Copies the custom WRCHV handler to $0400
; 2. Sets up the custom WRCHV vector and caches the original in IND1V
; 3. Changes the mode to 5
; 4. Defines logical colour 3 as physical colour green (2)
; 5. Sets characters per line to $20 / 32
; 6. Shifts the screen right because of (3) to centre it
; 7. Updates a bunch of OS workspace variables in $03xx because of 3, 5 and 6
; 8. Switches off caps lock
; 9. Sets hardware scrolling address to $6000 because of (3) above
; 10. Copies the graphic to the screen
; 11. Performs a *OPT 1,0 (OSBYTE equivalent) to suppress file system messages
; 12. Prints the "Press SPACE BAR." message
; 13. Moves the game relocation code to $0700
; 14. Performs a *RUN Repton2 using the File System Control Vector (FSCV)
;
; Custom WRCHV
; ------------
; 1. Contains a custom WRCHV routine that gets relocated to $0400 on load
; 2. The WRCHV custom routine calls the standard WRCHV (gets cached in IND1V) and then checks to see if carriage return was the character ($0D)
; 3. If it was a CR then it moves the cursor to (0,18) using OSWRCH $1F - only once, seems overkill to put this code in a custom WRCHV handler unless at some point there was scrolling text or multiple "steps" of text to work through.
; 4. Also processes moving the cursor down ($0A) but uses it as a control code to copy the memory from $7700-$7FFF to $7500-$7D00 but the memory it copies at this point is always blank. Feels like it was used for a text animation effect (moving up the screen) at some point but has no effect now.
;
; Main Graphic
; ------------
; 1. Displays the cool "man running from lizard" (iconic!) graphic
; 2. Just relocates this into screen memory
;
; CFS OS Workspace
; ----------------
; 1. Writes hardcoded values into the OS Workspace for the CFS BGET $03B0 - $03DF - doesn't do anything for my DFS :)
; 2. Haven't tried playing with this on a cassette yet and NOPing it to see if it "doesn't matter"
;
; Move Game Relocation Code
; -------------------------
;
; 1. Routine to move the code at $42F3 to $0700 - weirdly copies a full page even though it only needs the first 82 bytes, guess the subsequent bytes never get executed so no harm done.
;
; Game Relocation Code
; --------------------
;
; 1. This is executed as soon as the next file Repton2 is loaded
; 2. Repton2 contains the main game code
; 3. Repton2 loads at $1D00 onwards and has an execution address of $0700 - which is this relocated routine from Repton1
; 4. First thing it does is perform the OSBYTE equivalent of *TAPE12 presumably to quiesce the DFS
; 5. Copies the game code from $1D00-$72FF to $0A00-$5FFF
; 6. When it copies each byte it EORs with $FF to de-obfuscate
; 7. Then it restores the original WRCHV vector address from IND1V
; 8. Write zeros to $6000-$62FF (part of the visible screen) as code was there previously
; 9. Clears the text area (OSWRCH $0C)
; 10. Does the OSBYTE equivalent of *FX 200,3 (clear on break and disable escape)
; 11. Sets characters per line (again) to $20/32
; 12. Calls the relocated main game entry point at $2640
;
; Other Notes
; -----------
;
; There is a quite some clutter and junk in Repton1 including a duplicate 
; but different custom WRCHV handler that never does anything, many NOPs, 
; many spare bytes of EQUBs, code that can never be reached, some VDU23 
; equivalents that never get used. Even parts of the active WRCHV handler 
; can't be reached. So feels hastily thrown together or hacked by someone 
; or repurposed from a routine to load another game. It works though and 
; does the set up for the game.
;
; On Load Memory Map
; ------------------
; From  To      Bytes   Type            Description
;
; 2F00  2F0F    16      Code            fn_setup_cfs
; 2F10  2FCF    192     Graphics        Unused graphics data
; 2FD0  2FFF    48      Data            data_cfs_bget
; 3000  40FF    4352    Graphics        Loading screen graphics
; 4100  4220    289     Code            fn_main
; 4221  42F2    209     Unused          Unused Duplicate WRCHV Handler
; 42F3  431F    44      Code            fn_move_relocate_game_code
; 4320  43D3    159     Code            fn_entry_point
; 43D4  43FF    44      Unused          Zero bytes
; 4400  447F    128     Code            source_custom_wrchv Custom WRCHV handler for relocation
; 4430  443A    11      Unused          Code that's never executed
; 443B  4478    62      Unused          Code that's never executed
; 4479  447F    7       Code            rest of source_custom_wrchv Custom WRCHV handler for relocation
; 4480  44AC    45      Unused          Code that's never executed
; 44AD  44AD    1       Unused          Spare byte
; 44AE  44B5    8       Data            Filename "Repton2" to *RUN
; 44B6  44B7    2       Unused          Code that's never executed
; 44B8  44BD    6       Unused          Spare bytes - NOPS
; 44BE  44FF    66      Code            rest of source_custom_wrchv Custom WRCHV handler for relocation
; 
; Note all the code between $4400 an $44FF is relocated to $0400 to $04FF

org     $2F00

; Write character (to screen) from A - OSWRCH uses VDU values
OSWRCH = $FFEE
; Perfrom miscellaneous OS operation using control block to pass parameters
OSWORD = $FFF1
; Perfrom miscellaneous OS operation using registers to pass parameters
OSBYTE = $FFF4

; Address of the memory mapped hardware
; for the 6845 CRTC video controller
SHEILA_6845_address=$FE00
SHEILA_6845_data=$FE01

; System VIA Port B Control
SHEILA_SYS_VIA_REG_B_CTL=$FE40

; ----------------------
; OS Workspace variables
; ----------------------

; Number of pages of the visible screen
OS_WS_SCREEN_SIZE_PAGES=$0354

; High byte of bottom of screen memory
OS_WS_MSB_OF_HIMEM=$034E

; Bytes per screen row
OS_WS_NO_BYTES_PER_ROW_LSB=$0352
OS_WS_NO_BYTES_PER_ROW_MSB=$0353

; Memory map type
; 0 - 20K mode
; 1 - 16K mode
; 2 - 10K mode
; 3 - 8K mode
; 4 - 1K mode
OS_WS_SIZE_OF_SCREEN_MEMORY=$0356

; Current screen mode
OS_WS_CURRENT_MODE=$0355

; WRCHV - Send character to current output stream vector
WRCHV_LSB = $020E
WRCHV_MSB = $020F

; Spare indirect vector
IND1V_LSB =$0230
IND1V_MSB =$0231

; FSCV - Various filing system control calls
; Used to perform a *RUN
FSCV_LSB = $021E

; Used to hold the game code / data source 
; memory address when relocating in memory
zp_code_source_lsb = $0070
zp_code_source_msb = $0071

; Used to hold the game code / data target
; memory address when relocating in memory
zp_code_target_lsb = $0072
zp_code_target_msb = $0073

; Counts the nuymber of characters written to the
; screen om the custom WRCHV function 
; but never seems to be used beyond that
zp_wrchv_chars_written = $008E

; Used to cache the values of X and Y 
; when the custom WRCHV handler is called
; The values are the 
zp_wrchv_x_cache = $0070
zp_wrchv_y_cache = $0071

; Cassette File System BGET OS Workspace
; Data copied here but not used as this compiles
; for DFS
cfs_bget_workspace=$03B0

; Address of where the Custom WRCHV code
; will reside for writing to the loading screen
; when the Repton graphic is displayed
target_custom_wrchv=$0400

; Address of where the code will be written
; that relocates the REPTON2 game lower in memory
; when it is loaded.  REPTON2 loads at $1D00
; but the execution address is $0700 where the
; code (in this program) that performs the relocation will be 
; written
relocate_game_code_target=$0700

buffer_character_definition=$0C7F
buffer_character_target=$0CF0
unused_buffer_character_definition=$0C80
unused_buffer_character_target = $0CF0

fn_game_start = $2640




;2F00
.main_code_block_start

.fn_setup_cfs
        ; ----------------------------------------
        ; Copy 48 bytes of Cassette Filing System data
        ; into the CFS BGET OS workspace.  Redundant
        ; for DFS...
        ; ----------------------------------------
        LDX     #$00
;2F02
.byte_copy_loop
        LDA     data_cfs_bget,X
        STA     cfs_bget_workspace,X
        INX
        CPX     #$30
        BNE     byte_copy_loop

        ; Start the main processing
        JMP     fn_main

;2F10
INCLUDE "graphics-unused.asm"

;2FD0
.data_cfs_bget
        ; The data here is written to the Cassette filesystem 
        ; OS workspace at $03B0.  Makes no difference to a Disk
        ; Filing System - don't have access to a CFS to try this
        ;
        ; These are written from $03B0 to $03DF
        ; 
        ; 03A7-03B1 Filename of file being BGETed
        ; 03B2-03D0 Block header of most recent block read
        ;   B2-BD Filename terminated by zero
        ;   BE-C1 Load address
        ;   C2-C5 Execution address
        ;   C6-C7 Block number
        ;   C8-C9 Length of block
        ;   CA    Block flag byte
        ; CB-CE Four spare bytes
        ; CF-D0 Checksum byte
        ; 03D1 Sequential block gap as set by *OPT3
        ; 03D2-03DC Filename of file being searched for
        ; 03DD-03DE Number of next block expected for BGET
        ; 03DF Copy of block flag of last block read
        ; 
        ; $03B0 - $03B1 - zero the last two BGETed filename chars
        EQUB    $00,$00

        ; $03B2 - $03BD Filename terminated by zero
        EQUS    "REPTON2",$00,$00,$00,$00,$00

        ; $03BE - $03C1 Load address ($00000E00 aka $0E00)
        EQUB    $00,$0E,$00,$00

        ; $03C2 - $03C5 Execution address ($00000700 aka $0700)
        EQUB    $00,$07,$00,$00

        ; $03C6 - $03C7 Block number
        EQUB    $55,$00

        ; $03C8 - $03C9 Length of block (128?)
        EQUB    $00,$01
        
        ; $03CA - Block flag byte
        EQUB    $80
        
        ; $03CB - $03CE Four spare bytes
        EQUB    $00,$00,$00,$00

        ; $03CF - $03D0 Checksum bytes        
        EQUB    $62,$C5
        
        ; $03D1 - Sequential block gap as set by *OPT3
        EQUB    $19
        
        ; 03D2-03DC Filename of file being searched for
        EQUB    "REPTON2",$00,$00,$00,$00
        
        ; 03DD-03DE Number of next block expected for BGET'
        EQUB    $00,$00
        
        ; 03DF Copy of block flag of last block read
        EQUB    $80

;3000
; File defines the loading screen graphic (man running with monster)
; and the superior software logo
INCLUDE "graphics-load-screen.asm"
; 4100
.fn_main
        ; Switch to MODE 5
        ; OSWRCH &16
        LDA     #$16
        JSR     OSWRCH
        LDA     #$05
        JSR     OSWRCH

        ; OSWRCH &13 / VDU 19, 3, 2, 0, 0, 0
        ; Define Logical colour 3 as  as physical
        ; colour 2 (green)
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
        ; screen size memory to 8k (value 3)
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

        ; Set the hardware scrolling start address to $6000
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

        ; Copy the 17 pages of the loading
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
        ; WRCHV vector value - INDIV1 is used by the custom handler
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

        ; Weird - The A register value isn't used in sub-routine
        ; Presumably initially the sub-routine called
        ; FSCV immediately and this was used to do the *RUN
        LDA     #$04
        JMP     fn_move_relocate_game_code
;...

        ; vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
        ; UNUSED CODE!
        ;
        ; Code below is (almost) a copy of the WRCHV at $4400 routine 
        ; and isn't called by anything in REPTON1 - uncommented because
        ; of that. Looks like an earlier version of WRCHV routine as it
        ; has more function

;4221
.unused_source_custom_wrchv
        ; > Unused
        JMP     (IND1V_LSB)

        ; > Unused
        STX     zp_wrchv_x_cache
        STY     zp_wrchv_y_cache
        CMP     #$0D
        BNE     unused_wrchv_not_cr

        ; > Unused
        LDA     #$1F
        JSR     target_custom_wrchv

        ; > Unused
        LDA     #$00
        JSR     target_custom_wrchv

        ; > Unused
        LDA     #$18
        JSR     target_custom_wrchv

        ; > Unused
        LDA     #$00
        STA     zp_wrchv_chars_written
        JMP     target_custom_wrchv + (unused_inc_chars_written_and_restore_x_y - unused_source_custom_wrchv)

;L4242
.unused_wrchv_not_cr
        ; > Unused
        CMP     #$0A
        BNE     unused_wrchv_not_cursor_down

        ; > Unused
        JSR     target_custom_wrchv + (unused_loop_copy_memory - unused_source_custom_wrchv)

        ; > Unused
        NOP
        NOP
        JMP     target_custom_wrchv + (unused_inc_chars_written_and_restore_x_y - unused_source_custom_wrchv)

;L424E
.unused_wrchv_not_cursor_down
        ; > Unused: This is different to the used routine - in the used routine
        ; > Unused: it does a JMP target_custom_wrchv but here it checks for a
        ; > Unused: if A is less than $20/32
        CMP     #$20
        BCC     unused_wrchv_write_character

        ; > Unused: A > 32 so check if it's a custom character (otherwise
        ; > Unused: just write it to the screen). If it is custom, 
        ; > Unused: query the raster data for the character
        CMP     #$7F
        BCC     unused_wrchv_query_raster_data

;L4256
.unused_wrchv_write_character
        ; > Unused
        JSR     target_custom_wrchv

        ; > Unused
        JMP     target_custom_wrchv + (unused_restore_x_and_y - unused_source_custom_wrchv)
;L425C
.unused_wrchv_query_raster_data
        ; > Unused
        STA     buffer_character_definition
        LDA     #$0A
        LDX     #$7F
        LDY     #$0C
        JSR     OSWORD

        ; > Unused
        LDX     #$00
        LDY     #$00
;L426C
.unused_loop_copy_characters
        ; > Unused
        LDA     unused_buffer_character_definition,X
        STA     unused_buffer_character_target,Y
        STA     unused_buffer_character_target+1,Y
        INY
        INY
        INX
        CPX     #$08
        BNE     unused_loop_copy_characters

        ; > Unused
        LDA     #$FF
        JSR     target_custom_wrchv

        ; > Unused
        LDY     #$10
;L4283
.unused_loop_cursor_back
        ; > Unused
        LDA     #$08
        JSR     target_custom_wrchv

        ; > Unused
        DEY
        BPL     unused_loop_cursor_back

        ; > Unused
        LDA     #$FE
        JSR     target_custom_wrchv

        ; > Unused
        LDY     #$0F
;L4292
.unused_loop_cursor_forward
        ; > Unused
        LDA     #$09
        JSR     target_custom_wrchv

        ; > Unused
        DEY
        BPL     unused_loop_cursor_forward


;429A
.unused_inc_chars_written_and_restore_x_y       
        ; > Unused
        INC     zp_wrchv_chars_written
 
;429C
.unused_restore_x_and_y
        ; > Unused
        LDX     zp_wrchv_x_cache
        LDY     zp_wrchv_y_cache
        RTS
        
;42A1
.unused_text_filename
        ; > Unused
        EQUS    "Repton2"
        EQUB    $0D        

;42A9
.unused_loop_copy_memory        
        ; > Unused
        LDY     #$00
;42AB
.unused_loop_copy_memory_2
        ; > Unused
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
        ; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^




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

        ; Do nothing, spare bytes - 7
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

        ; Spare bytes - 8
        EQUB    $00,$00,$00,$00,$00,$00,$00,$00

;4320
.fn_relocate_game_code
        ; vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
        ; Code block that's relocated to 0700 - 07FF
        ; The code will move the REPTON2 game code down in memory
        ; once it is loaded

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
        ; Relocates the game code from $1D00-$72FF
        ; ($5600 bytes) to $0A00 to $5FFF

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
        ;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
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
        ; ----------------------------------------
        ; Execution point on load
        ; ----------------------------------------

        ; OSBYTE &0D
        ; Disable the start of vertical sync event
        LDA     #$0D
        LDX     #$04
        JSR     OSBYTE

        ; Copy the BGET 
        JMP     main_code_block_start

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

;43D4
        ; Spare bytes - 44
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

        ; Carriage return was specified 
        
        ; Code here, if a CR was detected, moves the cursor
        ; to (0,so send the move the cursor (0,18)
        ; where OSWRCH $1F is the equivalent of the comamnd
        ; PRINT TAB(x,y) where x = $0 and y = $18 in thi sinstance
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

        ; Calls the inc_chars_written_and_restore_x_y which
        ; increments the number of characters written on the row
        ; and restores X and Y - calculation below is for when it 
        ; is relocated in memory
        JMP     target_custom_wrchv + (inc_chars_written_and_restore_x_y - source_custom_wrchv)

;L4421
.wrchv_not_cr
        ; Check to see if the move cursor down one line
        ; control code was sent to the screen - if not
        ; branch ahead
        CMP     #$0A
        BNE     wrchv_not_cursor_down

        ; Calls the loop_copy_memory_2 which copies blank memory
        ; for no reason as far as I can tellf
        JSR     target_custom_wrchv + (loop_copy_memory_2 - source_custom_wrchv)

        NOP
        NOP

        JMP     target_custom_wrchv + (inc_chars_written_and_restore_x_y - source_custom_wrchv)

;L442D
.wrchv_not_cursor_down
        ; Write the character - looks like the earlier incarnation
        ; of this code at $424E checked for a space bar first - but this
        ; ends the routine - code afterwards cannot execute
        JMP     target_custom_wrchv

        ; vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
        ; > Unused can NEVER be called by this code

        ; > Unused: Spare byte - 1
        EQUB    $04

        ; > Unused: Checks to see if the value is a custom char (> 128)
        ; > If it is, write it to the screen otherwise branch ahead
        CMP     #$7F
        BCC     wrchv_query_raster_data

        ; > Unused: Here if A is >= $7F
        JSR     target_custom_wrchv

        ; > Unused: Restore X and Y 
        JMP     target_custom_wrchv + (restore_x_and_y - source_custom_wrchv)
        ; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

;L443B
.wrchv_query_raster_data
        ; vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
        ; > Unused: the part of the code that calls it above
        ; > Unused: is never executed

        ; > Unused: Store the character to be queried for its
        ; > Unused: raster data at 0C7F
        STA     buffer_character_definition

        ; > Unused: OSWORD &0A - Read character definition. 
        ; > Unused: On entry $0C7F contains character to read
        ; > Unused: On exit  Place the result at $0C7F + 1
        LDA     #$0A
        LDX     #LO(buffer_character_definition)
        LDY     #HI(buffer_character_definition)
        JSR     OSWORD

        ; > Unused: Create user defined character
        JSR     target_custom_wrchv + (create_user_defined_character - source_custom_wrchv)

        ; > Unused: Spare Bytes - 17
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

        ; > Unused: OSBYTE &FF / VDU 255
        ; > Unused: Write custom character 255 to the screen        
        LDA     #$FF
        JSR     target_custom_wrchv

        ; > Unused: Move backwards 17 characters
        LDY     #$10
;4471
.loop_move_backward_one_character
        ; > Unused: OSWORD &08 / VDU 08
        ; > Unused: Move character backwards one position
        LDA     #$08
        JSR     target_custom_wrchv
        DEY
        BPL     loop_move_backward_one_character

        ; > Unused: OSBYTE &FE / VDU 254
        ; > Unused: Write custom character 254 to the screen
        LDA     #$FE
        JSR     target_custom_wrchv

        ; > Unused: Move forward 16 characters
        LDY     #$0F
.loop_move_forward_one_character
        ; > Unused: OSWORD &09 / VDU 09
        ; > Unused: Move character forward one position
        LDA     #$09
        JSR     target_custom_wrchv
        DEY
        BPL     loop_move_forward_one_character
        ; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

;4479
.inc_chars_written_and_restore_x_y
        ; Increment the number of characters 
        ; written to the screen so far (value is never used)
        INC     zp_wrchv_chars_written
;447B
.restore_x_and_y
        ; Restore X and Y which were cached at the start 
        ; of the WRCHV
        LDX     zp_wrchv_x_cache
        LDY     zp_wrchv_y_cache        
        RTS

;L4480
.create_user_defined_character
        ; vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
        ; > Unused: can never be executed
        ; > Unused: OSWORD &17 / VDU 23
        ; > Unused:  Create user defined character
        LDA     #$17
        JSR     target_custom_wrchv

        ; > Unused:  Second parameter - create character 254
        LDA     #$FE
        JSR     target_custom_wrchv

        LDX     #$00
.loop_FE_copy_next_character_byte
        ; > Unused:  Send the next 8 bytes
        LDA     buffer_character_target,X
        JSR     target_custom_wrchv

        INX
        CPX     #$08
        BNE     loop_FE_copy_next_character_byte

        ; > Unused: OSWORD &17 / VDU 23
        ; > Unused: > Unused:  Create user defined character
        LDA     #$17
        JSR     target_custom_wrchv

        ; > Unused: Second parameter - create character 255
        LDA     #$FF
        JSR     target_custom_wrchv

.loop_FF_copy_next_character_byte
        ; > Unused: Send the next 22 bytes - why not just 8?
        LDA     buffer_character_target,X
        JSR     target_custom_wrchv

        INX
        CPX     #$16
        BNE     loop_FF_copy_next_character_byte

        RTS
        ; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

;44AD
        ; Unused: Doesn't appear to be used (letter "y")
        ; Spare byte - 1
        EQUB    $79

;44AE
.text_filename
        ; Filename to *RUN when FSCV is called
        EQUS    "Repton2"
        EQUB    $0D

; 44B6
        ; vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
        ; > Unused: never called

        ; > Unused: Reset the Y index
        LDY     #$00
        ; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

;L44B8
.loop_copy_memory 
        ; Spare bytes -  6
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
;L44BE
.loop_copy_memory_2
        ; Copy some memory... everything set to zero
        ; on the loader so doesn't do anything there as 
        ; the target memor is also already set to zero
        ; WRCHV handler calls it anyway
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
        ; It's already zero though so doesn't do anything
        LDA     #$00
        STA     $7E00,Y
        STA     $7F00,Y
        DEY
        BNE     loop_copy_memory 
;44FF
        RTS    
;5000
.main_code_block_end      
SAVE "REPTON1",main_code_block_start,main_code_block_end,fn_entry_point