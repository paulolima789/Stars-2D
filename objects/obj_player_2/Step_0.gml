/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


var _right, _left, _jump, _attack, _run;
var _chao = place_meeting(x,y+1,obj_wall);

_right = keyboard_check(inputs.right);
_left = keyboard_check(inputs.left);
_jump = keyboard_check(inputs.jump);
_run = keyboard_check(inputs.run);
_attack = keyboard_check(inputs.attack);

// verifica se eu vou correr ou andar
if !_run{
	hspeed = (_right - _left) * velocidade_andando;
	
}else{
	hspeed = (_right - _left) * velocidade_correndo;
}

show_debug_message(hspeed)
show_debug_message(olhando_para)

if(olhando_para == "direita") 
{
	image_xscale = 1;
}
else 
{
	image_xscale = -1;
}

//VERIFICA SE NAO ESTA COLIDINDO COM O CHAO PARA APLICAR GRAVIDADE
if !_chao {
	if (vspeed < velocidade_salto * 2)
	vspeed += gravidade 
}


#region INICIANDO MAQUINA DE ESTADOS
switch(estado)
{
	
	#region PARADO
	case "Parado": {
		//comportamento do estado parado
		sprite_index = spr_player_idle
		
		//verifica se ele esta caindo
		if (vspeed > 0){
			sprite_index = spr_player_jump_final;
			if (image_index>=image_number-1){
				image_index = image_number-1
			}
		}
		// condicao para trocar de estado
		//Movendo
		if ((_right or _left) or ((_right and _run) or (_left and _run))){
			estado = "Movendo"
			
		} else if (_jump){
			estado = "Pulo"
			vspeed -= velocidade_salto
			image_index = 0
		} else if (_attack){
			estado = "Attack"
			hspeed = 0
			image_index = 0
		}

		break;
	}
	#endregion
	
	#region MOVENDO
	case "Movendo": {
	
		// quando está andando
		if (!_run) 
		{
			sprite_index = spr_player_walk
		}
		else
		// quando está correndo
		{
			sprite_index = spr_player_run
		}
		
		// corrige a orientação da sprite quando anda
		if(hspeed > 0) 
		{
				olhando_para = "direita";
		}
		else if(hspeed < 0)
		{
				olhando_para = "esquerda";
		}
		//verifica se ele esta caindo
		if (vspeed > 0){
			sprite_index = spr_player_jump_final;
			if (image_index>=image_number-1){
				image_index = image_number-1
			}
		}
		// condicao para trocar de estado
		//Parado
		if (abs(hspeed)< 0.1){
			estado = "Parado"
			image_index = 0
		} else if (_jump){
			estado = "Pulo"
			vspeed -= velocidade_salto
			image_index = 0
		} else if (_attack){
			estado = "Attack"
			hspeed = 0
			image_index = 0
		}
		break;
	}
	#endregion
	
	#region PULO
	case "Pulo": {
		//comportamento do estado pulo
		if (vspeed > 0){
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
			vspeed = 0
		}	
		break;
	}
	#endregion
	
	#region ATTACK
	case "Attack": {
		hspeed = 0
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
			hspeed = knockback_force * lengthdir_x(1, knockback_direction);
			vspeed = knockback_force * lengthdir_y(1, knockback_direction);
			knockback_duration--;
			vspeed -= 0.8;

		    // Se o knockback terminar, resetar velocidades e forças
		    if (knockback_duration == 0) {
		        hspeed = 0;
		        vspeed = 0;
		        knockback_force = 0;
			}
		}
	}
	#endregion
	
	
}
#endregion