/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Evento Step no obj_barrier
#region status
// Evento Step do objeto jogador (ou afetado)
if (invulnerabilidade) {
    invulnerabilidade_tempo_atual -= 1; // Reduz o tempo de invulnerabilidade
    if (invulnerabilidade_tempo_atual <= 0) {
        invulnerabilidade = false; // Desativa o estado de invulnerabilidade quando o tempo expira
    }
}
#endregion

