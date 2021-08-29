fr = open('repton2a','rb')
fw = open('repton2','wb')
byte = fr.read(1)

while byte:
    clean_value=int.from_bytes(byte,"little") ^ 255
    fw.write(bytes([clean_value]))
    byte=fr.read(1)

fr.close()
fw.close()
