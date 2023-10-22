// Navegar no texto e nas opções

var _count = ChatterboxGetOptionCount(chatterbox); // número de opções

// Esperando por user input ou esperando pela escolha da opção
if ChatterboxIsWaiting(chatterbox) and keyboard_check_pressed(vk_space) {
	ChatterboxContinue(chatterbox);
	chatterbox_update();
} else if _count {
	var _key = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	
	// Mover option_index
	// Mover 2 vezes se a próxima opção é inválida
	
	repeat(1 + (ChatterboxGetOptionConditionBool(chatterbox, wrap(option_index + _key, 0, _count - 1)) == false)) {
		option_index = wrap(option_index + _key, 0, _count - 1);
	}
	
	if keyboard_check_pressed(vk_space) {
		ChatterboxSelect(chatterbox, option_index);
		audio_play_sound(snd_test, 0, false, 1, 0, random_range(0.8, 1.2));
		
		// Verificar metadata
		// WATER, SUN, EARTH, MUSIC
		var _metadata = ChatterboxGetContentMetadata(chatterbox, 0);
		//show_debug_message(_metadata);
		if (array_length(_metadata) > 0) {
			if (_metadata[0] != "") { global.status.hidratacao = wrapInside(obj_waterbar.fillBar + real(_metadata[0]), 0, 10); obj_waterbar.fillBar = global.status.hidratacao; }
			if (_metadata[1] != "") { global.status.humor = wrapInside(obj_sunbar.fillBar + real(_metadata[1]), 0, 10); obj_sunbar.fillBar = global.status.humor; }
			if (_metadata[2] != "") { global.status.nutricao = wrapInside(obj_earthbar.fillBar + real(_metadata[2]), 0, 10); obj_earthbar.fillBar = global.status.nutricao; }
			if (_metadata[3] != "") audio_play_sound(asset_get_index(_metadata[3]), 10, false);
			if (_metadata[4] != "") flag(_metadata[4]);
		}
		
		option_index = 0;
		chatterbox_update();
	}
}

// Chegou no fim do chatterbox
if ChatterboxIsStopped(chatterbox) {
	instance_destroy();
}