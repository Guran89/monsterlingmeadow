extends TextureRect

const ICON_FULL = preload("res://assets/UI/hungerfull.png")
const ICON_EMPTY = preload("res://assets/UI/hungerempty.png")

var _full = false

func set_full(full):
	_full = full
	texture = ICON_FULL if full else ICON_EMPTY
