extends TextureRect

var _fill : float = 0

func set_fill(fill):
	_fill = fill

	if _fill > 0.75:
		texture = Data.icons.HUNGER_FULL.texture
	elif _fill < 0.25:
		texture = Data.icons.HUNGER_EMPTY.texture
	else:
		texture = Data.icons.HUNGER_HALF.texture
