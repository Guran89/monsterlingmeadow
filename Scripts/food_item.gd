extends TextureRect

#const TEXTURE = preload("res://assets/UI/chickenskewer.png")

func setScale(newScale):
	scale = Vector2(newScale, newScale)

func _on_mouse_exited():
	setScale(1)

func _on_mouse_entered():
	setScale(1.1)

func _on_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		Events.food_item_selected.emit(self)
		visible = false
