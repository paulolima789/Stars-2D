/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _h_spd = sign(h_spd)
var _v_spd = sign(v_spd)

repeat(abs(h_spd)){
	if (place_meeting(x + _h_spd, y,obj_wall)){
		h_spd = 0
		break
	}
	x +=_h_spd
}

repeat(abs(v_spd)){
	if (place_meeting(x, y + _v_spd,obj_wall)){
		v_spd = 0
		break
	}
	y +=_v_spd
}
