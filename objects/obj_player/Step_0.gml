#region CONTROLES

key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_up = keyboard_check(ord("W"));
key_jump = keyboard_check(vk_space);
key_ctrl = keyboard_check(vk_control);
key_shoot = keyboard_check_pressed(ord("E"))

#endregion

#region MOVIMENTACAO knockback

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
} else {
    // Se não estiver em knockback, aplicar movimento normal
    var move = key_right - key_left;
    h_spd = move * spd;
    v_spd = v_spd + grv;
	if move {
		sprite_index = spr_player_walk
	} else {
		sprite_index = spr_player_idle
	}
	if (h_spd != 0) image_xscale = sign(h_spd);
}

#endregion

#region COLISAO


// HORIZONTALL
if place_meeting(x+h_spd,y,obj_wall)
{
 while(!place_meeting(x+sign(h_spd),y,obj_wall))
 {
 x = x+sign(h_spd);
 }
 h_spd = 0;
}
x = x + h_spd;


// VERTICAL
if place_meeting(x,y+v_spd,obj_wall)
{
 while(!place_meeting(x,y+sign(v_spd),obj_wall))
 {
 y = y+sign(v_spd);
 }
 v_spd = 0;
}
y = y + v_spd;


#endregion

#region Tiro
var flipped = direction;
var gun_x = (x+4)*(flipped)
var _xx = x + lengthdir_x(15, image_angle)
var y_offset = lengthdir_y(20, image_angle)

if key_shoot and obj_player.bullets > 0{
	
with(instance_create_layer(_xx,y-15,"Shoot",obj_shoot_blood)){
obj_player.bullets--;
speed = 15
direction = -90+90*other.image_xscale
image_angle = direction
}
}
#endregion

#region barreira

// Step event of obj_player
if (barreira_pode_ser_colocada && key_ctrl) {
	
    // Cria a barreira na posição do jogador
    instance_create_layer(x, y, "Barreira",obj_barrier);
    
    // Impede que mais barreiras sejam colocadas instantaneamente (opcional)
    //barreira_pode_ser_colocada = false;
}

#endregion

#region invulnerabilidade
// Evento Step do objeto jogador (ou afetado)
if (invulnerabilidade) {
    invulnerabilidade_tempo_atual -= 1; // Reduz o tempo de invulnerabilidade
    if (invulnerabilidade_tempo_atual <= 0) {
        invulnerabilidade = false; // Desativa o estado de invulnerabilidade quando o tempo expira
    }
}
#endregion
if place_meeting(x,y+1,obj_wall) and key_jump {
	v_spd -= 11;
	}
#region sprites

if !place_meeting(x,y+1,obj_wall){

if (sign(v_spd) > 0.5) sprite_index = spr_player_jump_final; else sprite_index = spr_player_jump_inicial
}

#endregion


