/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// mata a instancia quando ele n tiver mais vida
if life_enemy <= 0{
instance_destroy()
}

// Evento de colisão com o objeto inimigo
if (!invulnerabilidade) {
    life_enemy -= other.damege_shoot // Subtrai o dano do inimigo da vida
    invulnerabilidade = true; // Ativa o estado de invulnerabilidade
    invulnerabilidade_tempo_atual = invulnerabilidade_tempo; // Inicializa o contador de tempo de invulnerabilidade
}