extends Area2D

var _hover = false

func hover():
	return _hover

func _on_mouse_entered():
	_hover = true

func _on_mouse_exited():
	_hover = false
