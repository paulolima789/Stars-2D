/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if (place_meeting(x,y,other)) {
	
	with (other) {
    // Aplica knockback ao jogador
    knockback_force = 2; // Ajuste conforme necessário
    knockback_duration = 2; // Ajuste conforme necessário
    direction = point_direction(other.x, other.y, x, y); // Direção do knockback
		
	knockback_direction = point_direction(other.x, other.y, x, y);
    }
	
}

