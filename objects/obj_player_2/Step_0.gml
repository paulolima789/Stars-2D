/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _right, _left, _jump, _attack, _run;
var _chao = place_meeting(x,y+1,obj_wall);

_right = keyboard_check(ord("D"));
_left = keyboard_check(ord("A"));
_jump = keyboard_check(vk_space)
_run = keyboard_check(vk_shift)
_attack = keyboard_check(ord("J"))

// verifica se eu vou correr ou andar
if !_run{
	h_spd = (_right - _left) * max_h_spd;
}else{
	h_spd = (_right - _left) * run_h_spd;
}

//VERIFICA SE NAO ESTA COLIDINDO COM O CHAO PARA APLICAR GRAVIDADE
if !_chao {
	if (v_spd < max_v_spd * 2)
	v_spd += GRAVIDADE * massa
}


#region INICIANDO MAQUINA DE ESTADOS
switch(estado)
{
	
	#region PARADO
	case "Parado": {
		//comportamento do estado parado
		sprite_index = spr_player_idle
		
		//verifica se ele esta caindo
		if (v_spd > 0){
			sprite_index = spr_player_jump_final;
			if (image_index>=image_number-1){
				image_index = image_number-1
			}
		}
		// condicao para trocar de estado
		//Movendo
		if ((_right or _left) or ((_right and _run) or (_left and _run))){
			estado = "Movendo"
			image_index = 0
		} else if (_jump){
			estado = "Pulo"
			v_spd -= max_v_spd
			image_index = 0
		} else if (_attack){
			estado = "Attack"
			h_spd = 0
			image_index = 0
		}

		break;
	}
	#endregion
	
	#region MOVENDO
	case "Movendo": {
		//comportamento do estado movendo
		if (!_run) {
			sprite_index = spr_player_walk
		}else{
			sprite_index = spr_player_run
		}
		//verifica se ele esta caindo
		if (v_spd > 0){
			sprite_index = spr_player_jump_final;
			if (image_index>=image_number-1){
				image_index = image_number-1
			}
		}
		// condicao para trocar de estado
		//Parado
		if (abs(h_spd)< 0.1){
			estado = "Parado"
			image_index = 0
		} else if (_jump){
			estado = "Pulo"
			v_spd -= max_v_spd
			image_index = 0
		} else if (_attack){
			estado = "Attack"
			h_spd = 0
			image_index = 0
		}
		break;
	}
	#endregion
	
	#region PULO
	case "Pulo": {
		//comportamento do estado pulo
		if (v_spd > 0){
			sprite_index = spr_player_jump_final;
			if (image_index>=image_number-1){
				image_index = image_number-1
			}
		}else{
			sprite_index = spr_player_jump_inicial;
			if (image_index>=image_number-1){
				image_index = image_number-1
			}
		}
		
		// condicao para trocar de estado
		//Parado
		if (_chao){
			estado="Parado"
			v_spd = 0
		}	
		break;
	}
	#endregion
	
	#region ATTACK
	case "Attack": {
		h_spd = 0
		sprite_index = spr_player_attack_projetil
		
		if (image_index > image_number-1){
			image_index = image_number-1
			#region Tiro
			var _flipped = direction;
			var _gun_x = (x+5)*(_flipped)
			var _xx = x + lengthdir_x(15, image_angle)
			var _y_offset = lengthdir_y(20, image_angle)

			with(instance_create_layer(_xx,y-56,"Shoot",obj_shoot_blood)){
			speed = 15
			direction = -90+90*other.image_xscale
			image_angle = direction
				}
			#endregion
			estado = "Parado"
		}
		break;
	}
	#endregion
	
	#region KNOCKBACK
	case "Knockback":{
		if (knockback_duration > 0) {
			// Se estiver em knockback, aplicar movimento baseado na força e direção
			h_spd = knockback_force * lengthdir_x(1, knockback_direction);
			v_spd = knockback_force * lengthdir_y(1, knockback_direction);
			knockback_duration--;
			v_spd -= 0.8;

		    // Se o knockback terminar, resetar velocidades e forças
		    if (knockback_duration == 0) {
		        h_spd = 0;
		        v_spd = 0;
		        knockback_force = 0;
			}
		}
	}
	#endregion
	
	
}
#endregion