//CONTROL MACRO

macro menu(TEXT) {
    table "tbl/geral.tbl"
    db {TEXT}
    end()
}
macro end() {
    db $FF
{

