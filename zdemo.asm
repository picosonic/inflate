; OS defines
INCLUDE "os.asm"

; Zero page vars
ORG &50

.inflate_zp
  EQUW &0000, &0000
  EQUB &00, &00, &00, &00, &00, &00

ORG &1200

.start

  ; Entry point
  JSR inflate_demo

.infinite_loop
  JSR infinite_loop

  ; Back to OS
  RTS

.inflate_demo
{
  ; Mode 0 (640x256, 0 colours)
  LDA #&16:JSR OSWRCH
  LDA #&00:JSR OSWRCH

  ; Hide the cursor, with cursor start register (in scanlines)
  LDA #&0A:STA CRTC00
  LDA #&20:STA CRTC01

  ; source (deflate data)
  LDA #(zscr) MOD 256:STA inflate_zp
  LDA #(zscr) DIV 256:STA inflate_zp+1

  ; dest
  LDA #(MODE0BASE) MOD 256:STA inflate_zp+2
  LDA #(MODE0BASE) DIV 256:STA inflate_zp+3

  ; Inflate from source to dest
  JSR inflate

  RTS
}

.inflate
INCLUDE "inflate_lib.asm"

.zscr
INCBIN "ZSCR"
.end

SAVE "INFLATE", start, end