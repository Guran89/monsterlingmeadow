extends Area2D

var _hover = false

func hover():
	return _hover

func _on_mouse_entered():
	_hover = true
	print("entered")

func _on_mouse_exited():
	_hover = false
	print("left")


func _on_body_entered(body):
	print("body entered")
