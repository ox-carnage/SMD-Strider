
// LANGUAGES
constant ENGLISH(0)
constant SPANISH(1)
constant PORTUGUESE(2)
constant ITALIAN(3)
constant GERMANY(4)
constant RUSSIAN(5)
constant CHINESE(6)
constant JAPANESE(7)

// CONTROL CODES
  
// GAME
constant ROM_START($0000000)
constant ROM_END($00100000)

// GAME OVER
constant font_original_vram($0000)
constant VDP_DATA($C00000)
constant VDP_CTRL($C00004)
constant M68K_RAM($FF0000)

macro save_registers_to_sp() {
    movem.l #$FFFF,-(a7)
}
macro load_registers_from_sp() {
    movem.l (a7)+,#$FFFF
}

macro tilecopy_to_vram(SRC, LENGTH, DEST) {
    save_registers_to_sp()

    move.l  #($40000000+(({DEST}&$3FFF)<<16)+(({DEST}&$C000)>>14)),(VDP_CTRL).l
    movea.l #({SRC}),a0
    clr.l   d0
    move.l  #(({LENGTH}/32)-3),d0
-;
    move.l  (a0)+,(VDP_DATA).l //; TILE LINE #1
    move.l  (a0)+,(VDP_DATA).l //; TILE LINE #2
    move.l  (a0)+,(VDP_DATA).l //; TILE LINE #3
    move.l  (a0)+,(VDP_DATA).l //; TILE LINE #4
    move.l  (a0)+,(VDP_DATA).l //; TILE LINE #5
    move.l  (a0)+,(VDP_DATA).l //; TILE LINE #6
    move.l  (a0)+,(VDP_DATA).l //; TILE LINE #7
    move.l  (a0)+,(VDP_DATA).l //; TILE LINE #8
    dbf     d0,-

    load_registers_from_sp()
}