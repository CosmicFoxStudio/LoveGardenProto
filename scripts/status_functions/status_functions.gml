// Keeps _val between _min and _max cyclically encapsulating values outside the range
function wrap(_val, _min, _max) {
	if _val > _max return _min;
	else if _val <_min return _max;
	else return _val;
}

// Keep _val between min and max
function wrapInside(_val, _min, _max) {
	if _val > _max return _max;
	else if _val <_min return _min;
	else return _val;
}

// getHidratacao
function hidratacao() {
	return global.status.hidratacao;
}

// getNutricao
function nutricao() {
	return global.status.nutricao;
}

// setFlag
function flag(_nome) {
	switch (_nome) {
		case "parque": global.status.parque = true; break;
		case "quarto": global.status.quarto = true; break;
		case "loveending": global.status.loveending = true; break;
		case "badending": global.status.badending = true; break;
	}
}

// getParque
function parque() {
	return global.status.parque;
}

// getLove
function love() {
	return global.status.loveending;
}

// getBad
function bad() {
	return global.status.badending;
}
