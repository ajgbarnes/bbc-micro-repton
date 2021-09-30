import os

os.remove('REPTON2.ff')

fr = open('REPTON2','rb')
fw = open('REPTON2.ff','wb')
byte = fr.read(1)

while byte:
    clean_value=int.from_bytes(byte,"little") ^ 255
    fw.write(bytes([clean_value]))
    byte=fr.read(1)

fr.close()
fw.close()

os.remove('REPTON2')
os.rename('REPTON2.ff','REPTON2')