/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

#region invulnerabilidade
// Evento Step do objeto jogador (ou afetado)
if (invulnerabilidade) {
    invulnerabilidade_tempo_atual -= 1; // Reduz o tempo de invulnerabilidade
    if (invulnerabilidade_tempo_atual <= 0) {
        invulnerabilidade = false; // Desativa o estado de invulnerabilidade quando o tempo expira
    }
}
#endregion

#region movimento


if (knockback_duration > 0) {
    // Se estiver em knockback, aplicar movimento baseado na força e direção
    h_spd = knockback_force * lengthdir_x(1, knockback_direction);
    v_spd = knockback_force * lengthdir_y(1, knockback_direction);
    knockback_duration--;
	

    // Se o knockback terminar, resetar velocidades e forças
    if (knockback_duration == 0) {
        h_spd = 0;
        v_spd = 0;
        knockback_force = 0;
    }
} else {
    // Se não estiver em knockback, aplicar movimento normal
	//gravidade
	
	// Se não estiver em knockback, aplicar movimento de perseguição ao jogador

    
	if instance_exists(obj_player_2){
		// Calcular a direção para o jogador
	    var direction_to_player = point_direction(obj_player_2.x, obj_player_2.y, x, y);
	
	    // Ajustar a direção do inimigo gradualmente em direção ao jogador
	    direction += angle_difference(direction, direction_to_player) * 0.1;
	
		var move = 0.3
		// Calcular as componentes horizontal e vertical do vetor de movimento
		h_spd = lengthdir_x(move * spd, direction);
	}else{h_spd = 0}
    // Adicionar gravidade
    v_spd += grv;

    // Inverter a imagem se estiver indo para a esquerda
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