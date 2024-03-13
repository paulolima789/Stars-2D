// Evento Draw no obj_enemy
draw_self(); // Desenha o próprio objeto

// Calcula a posição para desenhar a sprite da vida acima da cabeça
var _draw_x = x;
var _draw_y = y - sprite_height - 20; // Ajuste conforme necessário

// Fator de escala desejado
var _scale_factor = 0.5; // Ajuste conforme necessário

// Desenha a sprite da vida acima da cabeça com escala ajustada
draw_sprite_ext(spr_life_enemy, life_enemy, _draw_x, _draw_y, _scale_factor, _scale_factor, 0, c_white, 1);
draw_text(x,y - sprite_height*1.2, string(id))
