//pega todas as teclas do teclado
function keys(){
#region CONTROLES jogador

_key_right = keyboard_check(ord("D")); //
_key_left = keyboard_check(ord("A")); //
_key_up = keyboard_check(ord("W")); //
_key_jump = keyboard_check(vk_space); //jump
_key_ctrl = keyboard_check(vk_control); // barreira
_key_shoot = keyboard_check_pressed(ord("E")) // atira
_key_agir = keyboard_check_pressed(ord("F")); //agir

#endregion

#region CONTROLES menu
_key_esc = keyboard_check(vk_escape)
#endregion

#region

#endregion
}