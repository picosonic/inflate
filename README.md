# inflate
Demo of decompression of data in the DEFLATE format on the BBC Micro using 6502 assembler

This demo loads a fullscreen Mode 0 image into screen memory decompressing as it goes.

![3D Tutankhamun](3dtut.png?raw=true "3D Tutankhamun")

Library used is from https://github.com/pfusik/zlib6502 with changes to allow assembling with beebasm

```
inflate - uncompress data stored in the DEFLATE format
by Piotr Fusik <fox@scene.pl>
Last modified: 2017-11-07
```

The library uses zlib license which can be seen in the file `inflate_lib.asm`
