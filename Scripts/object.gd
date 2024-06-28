extends TextureRect




func _on_area_2d_mouse_entered() -> void:
	scale = Vector2(1.05, 1.05)
	print("mouse entered")


func _on_area_2d_mouse_exited() -> void:
	scale = Vector2(1, 1)
	print("mouse exited")
