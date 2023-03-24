// ; Definitions
arch    md.cpu
endian  msb

// ; Patched Output
output  "bin/strider_br.bin",create

// ; Configuration
constant CONFIG_LANGUAGE(PORTUGUESE)

define   CONFIG_ROM_NAME("STRIDER HIRYU                                   ")
define   CONFIG_ROM_REGION("UE")
define   CONFIG_ROM_SIZE(eof)


origin ROM_START
    // ; Original File
    insert "bin/Strider (USA, Europe).md"
    
    // ; Includes
    include "asm/macros.asm"
    include "asm/constants.asm"
        

if (CONFIG_LANGUAGE == ENGLISH) {

    include "text/en/tilemap_8x8.asm"
    include "text/en/menu.asm"
    include "text/en/credits.asm"
    include "text/en/dialogues.asm"
}


if (CONFIG_LANGUAGE == PORTUGUESE) {

    define   CONFIG_ROM_NAME("STRIDER HIRYU BR           ")
    define   CONFIG_ROM_REGION("UE")

    
    include "text/br/menu.asm"
    include "text/br/tilemap_8x8.asm"
    include "text/br/dialogos.asm"
    include "text/br/creditos.asm"
}
    include "asm/pointers.asm"
  
origin $00000150
    db {CONFIG_ROM_NAME}

origin $000001A4
    dl {CONFIG_ROM_SIZE}

origin $000001F0
    db {CONFIG_ROM_REGION}

    define CONFIG_ROM_SIZE(pc())

origin $00028F66
desvio_1:
    jmp     new_font

origin $00100000
new_font:
    jsr     $00020556

    tilecopy_to_vram(gfx_new_font, (gfx_new_font_end-gfx_new_font), font_original_vram)
    jmp     $00028F6C

eof: