extends TextureRect

var _selected = null
var _offset = null

func _ready():
	Events.food_item_selected.connect(_on_food_item_selected)
	scale = Vector2(1.1, 1.1)

func _input(event):
	if _selected and event is InputEventMouseMotion:
		position = event.position + _offset

func _unhandled_input(event):
	if _selected and event is InputEventMouseButton and !event.pressed:
		visible = false
		Events.food_item_dropped.emit(_selected)
		_selected = null

func _on_food_item_selected(food_item, offset):
	_selected = food_item
	_offset = offset
	position = get_viewport().get_mouse_position() + offset
	texture = food_item.texture
	visible = true
