/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (cooldown_timer > 0) {
    cooldown_timer -= 1; // Reduz o temporizador de recarga a cada quadro
}


if (cooldown_timer <= 0 and quatidade_mod>=0) {
    // Executar a habilidade
	
	var _player =  obj_player_2;
	
    if (_player){
		
		diff_both = x - _player.x;
		
	
		if (diff_both <= 245 && diff_both >= - 300)
		{
			instance_create_layer(x, y, "Enemy", obj_enemy)
			num_enemies++;
		}
	
	}
    // Configurar o cooldown
	quatidade_mod -= 1
    cooldown_timer = cooldown_duration;
}


