extends TextureRect

var _selected = null

func _ready():
	Events.food_item_selected.connect(_on_food_item_selected)

func _input(event):
	if event is InputEventMouseMotion:
		position = event.position

func _unhandled_input(event):
	if event is InputEventMouseButton and !event.pressed:
		visible = false
		if _selected:
			Events.food_item_dropped.emit(_selected)
			_selected = null

func _on_food_item_selected(food_item):
	_selected = food_item
	texture = food_item.texture
	visible = true
