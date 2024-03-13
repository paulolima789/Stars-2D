/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (place_meeting(x, y, obj_player)) and invulnerabilidade == false {
    with (obj_player) {
        // Aplica knockback ao jogador
        knockback_force = 5; // Ajuste conforme necessário
        knockback_duration = 10; // Ajuste conforme necessário
        direction = point_direction(other.x, other.y, x, y); // Direção do knockback
		knockback_direction = point_direction(other.x, other.y, x, y);
    }
}

// Evento de colisão com o objeto inimigo
if (!invulnerabilidade) {
    invulnerabilidade = true; // Ativa o estado de invulnerabilidade
    invulnerabilidade_tempo_atual = invulnerabilidade_tempo; // Inicializa o contador de tempo de invulnerabilidade
}


