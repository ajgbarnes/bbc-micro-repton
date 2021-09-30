# Repton 

This is a disassembly of the **Superior Software** game **Repton**.  Originally written by **Tim Tyler** in 1985.

This is an absolutely iconic game for the BBC Micro and Electron.  And I have always been fascinated by this game and wanted to get inside its author's head who was 15 or 16 at the time he wrote it, hence... here we are.

You can play the game in your browser here at [bbcmicro.co.uk](http://www.bbcmicro.co.uk/game.php?id=266)

I do not hold the copyright to the original game, only the disassembly labelling and comments.

Feedback and comments are always appreciated to help preserve and understand the internals of this classic.

Maps are documented in the spreadsheet [repton-maps.xlsx](https://github.com/ajgbarnes/bbc-micro-repton/blob/main/repton-maps.xlsx)

# Disassembly

I used the [BeedDis](https://github.com/prime6809/BeebDis) by *Phill Harvey-Smith* which was fantastic.

I also used [HxD for Window](https://mh-nexus.de/en/hxd/) for inspecting the original binary and comparing my new one to it

And all editing was completed in [Visual Studio Code](https://code.visualstudio.com/) and [Simon M's](https://github.com/simondotm) excellent BBC Specific 6502 extension [Beeb VSC](https://marketplace.visualstudio.com/items?itemName=simondotm.beeb-vsc)

# Building - Byte Identical

I use the rather excellent [BeebAsm](https://github.com/stardot/beebasm) by *Richard Talbot-Watkins* and I compiled this on WIndows 10.

1. Download the [beebasm.exe](https://github.com/stardot/beebasm/blob/master/beebasm.exe) into the same directory as your clone of this repository

2. Run the following commands 

```
beebasm -i repton1-commented.asm -di repton.ssd -do repton1.ssd
```

This generates REPTON1 - contains relocation routines and the main loading graphic

```
beebasm -i repton2-commented.asm
```

This generates a new REPTON2 - the main game file before EOR with $FF

```
python dirty_repton2.py
```

This replaces the REPTON2 file - the main game flie EOR'd with $FF

For now, manually add REPTON2 to the repton1.ssd file using e.g. BBC Explorer.

Note that when it compiles using this approach the binary files are *byte identical* to the original.

# Building - Easier (And Without Obfuscation)

I use the rather excellent [BeebAsm](https://github.com/stardot/beebasm) by *Richard Talbot-Watkins* and I compiled this on WIndows 10.

1. Again download the [beebasm.exe](https://github.com/stardot/beebasm/blob/master/beebasm.exe) into the same directory as your clone of this repository

2. Edit [repton1-commented.asm](https://github.com/ajgbarnes/bbc-micro-repton/blob/d7cc30dd3212cf7c3850141568c2a700d89745a7/repton1-commented.asm#L806) and change the line of code from ```EOR $FF``` to ```EOR $00```. This removes the de-obfuscation.

2. Run the following commands 

```
beebasm -i repton1-commented.asm -di repton.ssd -do reptona.ssd
```

This generates REPTON1 - contains relocation routines and the main loading graphic

```
beebasm -i repton2-commented.asm -di reptona.ssd -do repton1.ssd
```

This generates a new REPTON2 - the main game file which has not be obfuscated, and puts it into the same SSD image

# Running the Game

3. Run the file using [beebjit](https://github.com/scarybeasts/beebjit) created by *Chris Evans(scarybeasts)* using:

```beebjit -0 repton1.ssd```

4. Shift+Break (F12) to run the compiled game

# Devilishly Infuriating Music Only

To help me understand the in-game music code, I separated it out into [repton-music.asm](https://github.com/ajgbarnes/bbc-micro-repton/blob/main/repton-music.asm). 

To build and run this:

1. Using beebasm:

```beebasm -i repton-music.asm -di MUSIC.SSD -do MUSIC1.SSD```

2. Load the disc into an emulator using [beebjit](https://github.com/scarybeasts/beebjit) using:

```beebjit -0 MUSIC1.ssd```

3. Play the music using:

```*MUSIC```

4. Enjoy...

Hope you can learn something from this disassembly and it inspires a project.  

![alt text](https://github.com/ajgbarnes/bbc-micro-repton/blob/main/repton-loading-screen.png "Repton Loading Screen")

![alt text](https://github.com/ajgbarnes/bbc-micro-repton/blob/main/repton-sprites.png "Repton Sprites")

![alt text](https://github.com/ajgbarnes/bbc-micro-repton/blob/main/other-sprites.png "Other Sprites")

![alt text](https://github.com/ajgbarnes/bbc-micro-repton/blob/main/repton-has-been-finished.png "Repton has been finished")

Andy Barnes
Twitter: @ajgbarnes