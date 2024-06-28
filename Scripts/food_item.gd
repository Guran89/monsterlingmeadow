extends TextureRect

const EMPTY = preload("res://Assets/UI/empty.png")

var _food

func set_food(food):
	_food = food
	texture = food.texture
	return self

func get_food():
	return _food

func setScale(newScale):
	scale = Vector2(newScale, newScale)

func _on_mouse_exited():
	setScale(1)

func _on_mouse_entered():
	setScale(1.1)

func _on_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		var mouse_pos = get_viewport().get_mouse_position()
		var offset = global_position - mouse_pos
		print("offset: ", offset)

		Events.food_item_selected.emit(self, offset)
		texture = EMPTY
		#visible = false

func reset_texture():
	texture = _food.texture
