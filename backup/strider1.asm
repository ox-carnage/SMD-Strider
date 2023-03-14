//Definições
arch    md.cpu
endian  msb
output  "bin/Strider_br.bin", create   //Saída do arquivo
//Configurações
constant    CONFIG_LANGUAGE(PORTUGUESE)
    define      CONFIG_ROM_NAME("STRIDER HIRYU")
    define      CONFIG_ROM_REGION("UE")
    define      CONFIG_ROM_SIZE(eof)
origin      ROM_START  //Pega o inicio da rom
    insert      "bin/Strider (USA, Europe).md"
    include     "asm/constants.asm"
    include     "asm/macros.asm"
//
//include     "asm/pointers.asm"
if  (CONFIG_LANGUAGE == ENGLISH) 
{
//include     "text/en/options.asm"
//include     "text/en/menu.asm"

}
if  (CONFIG_LANGUAGE == PORTUGUESE
{
define      CONFIG_ROM_NAME("STRIDER BR")
define      CONFIG_ROM_REGION("UE")
//include     "text/br/options.asm"
include     "text/br/menu.asm"
}

origin      $00000150
    db (CONFIG_ROM_NAME)
origin      $000001A4
    db (CONFIG_ROM_SIZE)
origin      $000001F0
    db (CONFIG_ROM_REGION)

eof: