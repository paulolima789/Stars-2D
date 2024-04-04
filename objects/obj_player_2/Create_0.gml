/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
event_inherited()


velocidade = 5;

// variaveis de vida
vida_max = 10;
vida_atual = vida_max;
// variaveis de movimento

ataque = 1;
// estados de movimento
mostra_estado = true

// Variáveis de knockback
knockback_force = 0;
knockback_duration = 0;
knockback_direction = 0;


hspeed = 0;
vspeed = 0;

estado = "Parado"
velocidade_salto = 11;
velocidade_andando = 5;
velocidade_correndo = 11;
olhando_para = "direita"

inputs = {
	left	: ord("A"),
	right	: ord("D"), 
	jump	: vk_space,
	run     : vk_shift,
	attack	: ord("J") 
}
