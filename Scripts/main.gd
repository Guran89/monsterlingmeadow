extends Node2D

func _ready():
	Events.game_ready.emit()
