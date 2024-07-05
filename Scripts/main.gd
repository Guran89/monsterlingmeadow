extends Node2D

func _ready():
	Events.game_ready.emit()

func _unhandled_input(_event):
	if Input.is_action_just_pressed("ReloadScene"):
		get_tree().reload_current_scene()
