/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if place_meeting(x, y, other) {
    with (other) {
        // Aplica knockback 
        knockback_force = 2; // Ajuste conforme necessário
        knockback_duration = 5; // Ajuste conforme necessário
        direction = point_direction(other.x, other.y, x, y); // Direção do knockback
		knockback_direction = point_direction(other.x, other.y, x, y);
    }	
}

if (!invulnerabilidade) {
    life_barreira -= other.damege_enemy // Subtrai o dano do inimigo da vida
    invulnerabilidade = true; // Ativa o estado de invulnerabilidade
	invulnerabilidade_tempo_atual = invulnerabilidade_tempo; // Inicializa o contador de tempo de invulnerabilidade
	if life_barreira <= 0{
		instance_destroy()
	}
}

// mata a instancia quando ele n tiver mais vida

