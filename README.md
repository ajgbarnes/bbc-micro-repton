# Repton - Work in progress

This is a disassembly of the **Superior Software** game **Repton**.  Originally written by **Tim Tyler** in 1985.

Always been fascinated by this game and wanted to get inside its author's head hence...

You can play the game in your browser here at [bbcmicro.co.uk](http://www.bbcmicro.co.uk/game.php?id=266)

I do not hold the copyright to the original game, only the disassembly labelling and comments.

Status
- The commenting isn't quite finished yet by some margin.
- All of REPTON1 is commented and will assemble byte identical
- Script written to take extracted REPTON2 and EOR with $FF to decode
- REPTON2 mostly commented - need to walk through again (slowly)
- REPTON2 compiles to be byte identical to the original (before EOR with $FF)
- Need to write routine that will EOR with $FF

# Disassembly

I used the [BeedDis](https://github.com/prime6809/BeebDis) by *Phill Harvey-Smith* which was fantastic.

I also used [HxD for Window](https://mh-nexus.de/en/hxd/) for inspecting the original binary and comparing my new one to it

And all editing was completed in [Visual Studio Code](https://code.visualstudio.com/) and [Simon M's](https://github.com/simondotm) excellent BBC Specific 6502 extension [Beeb VSC](https://marketplace.visualstudio.com/items?itemName=simondotm.beeb-vsc)

# Building

I use the rather excellent [BeebAsm](https://github.com/stardot/beebasm) by *Richard Talbot-Watkins* and I compiled this on WIndows 10.

1. Download the [beebasm.exe](https://github.com/stardot/beebasm/blob/master/beebasm.exe) into the same directory as your clone of this repository

2. Run the following commands 

```
beebasm -i repton1-commented.asm
```

This generates REPTON1 - contains relocation routines and the main loading graphic

```
beebasm -i repton2-commented.asm
```

This generates REPTON2a - the main game file before EOR with $FF

```
python dirty_repton2.py
```

This generates REPTON2 - the main game flie EOR'd with $FF

For now, manually add REPTON1 and REPTON2 to the repton.ssd file


3. I will eventually run it then using [beebjit](https://github.com/scarybeasts/beebjit) created by *Chris Evans(scarybeasts)* using:

```beebjit -0 repton.ssd```

4. Shift+Break (F12) to run the compiled game

Note that when it compiles the binary is *byte identical* to the original.

Hope you can learn something from this disassembly and it inspires a project.  

![alt text](https://github.com/ajgbarnes/bbc-micro-repton/blob/main/repton-sprites.png "Repton Sprites")


Andy Barnes