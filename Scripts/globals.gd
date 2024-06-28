extends Node
var is_dragging = false
var hunger: float = 0

func _process(delta: float) -> void:
	if hunger < 0:
		hunger = 0
	
	if hunger > 3:
		hunger = 3
