/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if obj_player.life_player == 4{
draw_sprite(spr_life,4,50,50)
}
if obj_player.life_player == 3{
draw_sprite(spr_life,3,50,50)
}
if obj_player.life_player == 2{
draw_sprite(spr_life,2,50,50)
}
if obj_player.life_player == 1{
draw_sprite(spr_life,1,50,50)
}
if obj_player.life_player <= 0{
draw_sprite(spr_life,0,50,50)
}