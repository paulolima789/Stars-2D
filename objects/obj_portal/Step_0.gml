/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
keys()
if place_meeting(x,y, obj_player_2){
teleportar=true
}else{
teleportar=false
}

if _key_agir && teleportar{
	a = _id
	show_debug_message(string(a))
	obj_player_2.x = a.x
	obj_player_2.y = a.y
}

