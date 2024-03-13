/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


// Evento de colisão com o objeto inimigo
if (!invulnerabilidade) {
    life_player -= other.damege_enemy // Subtrai o dano do inimigo da vida
    invulnerabilidade = true; // Ativa o estado de invulnerabilidade
    invulnerabilidade_tempo_atual = invulnerabilidade_tempo; // Inicializa o contador de tempo de invulnerabilidade
}
if life_player <=0{
	instance_destroy()
}