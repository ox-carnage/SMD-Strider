// ; Definitions
arch    md.cpu
endian  msb

// ; Patched Output
output  "bin/Strider_br.bin",create

// ; Configuration
constant    CONFIG_LANGUAGE(PORTUGUESE)

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

    //include "text/en/credits.asm"
    include "text/en/menu.asm"
    //include "text/en/locations.asm"
    //include "text/en/dialogue.asm"
}


if (CONFIG_LANGUAGE == PORTUGUESE) {

    define   CONFIG_ROM_NAME("STRIDER BR")
    define   CONFIG_ROM_REGION("UE")

    
    include "text/br/menu.asm"
    
}

    include "asm/pointers.asm"

origin $00000150
    db {CONFIG_ROM_NAME}

origin $000001A4
    dl {CONFIG_ROM_SIZE}

origin $000001F0
    db {CONFIG_ROM_REGION}

    define CONFIG_ROM_SIZE(pc())

eof: