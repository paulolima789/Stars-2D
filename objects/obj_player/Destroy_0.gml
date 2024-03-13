#region morto?
sprite_index = spr_player_dead

if (image_index >= image_number-1){
	sprite_index=image_number-1
	h_spd = 0
	v_spd = 0
	
}
game_restart()
#endregion