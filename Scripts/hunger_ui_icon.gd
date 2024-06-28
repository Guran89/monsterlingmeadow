extends TextureRect

const ICON_FULL = preload("res://assets/UI/hungerfull.png")
const ICON_HALF = preload("res://Assets/UI/hungerhalf.png")
const ICON_EMPTY = preload("res://assets/UI/hungerempty.png")

var _fill : float = 0

func set_fill(fill):
	_fill = fill

	if _fill > 0.75:
		texture = ICON_FULL
	elif _fill < 0.25:
		texture = ICON_EMPTY
	else:
		texture = ICON_HALF
