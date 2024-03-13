/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
keys()
if place_meeting(x,y, obj_player_2){
teleportar=true
}else{
teleportar=false
}

if _key_agir && teleportar{
	obj_player_2.x = id._alvoX
	obj_player_2.y = id._alvoY
}

