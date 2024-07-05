extends Node

var hunger = 0

func _ready():
	Events.game_ready.connect(_on_game_ready)

func change_hunger(change):
	hunger = clamp(hunger + change, Constants.MIN_HUNGER, Constants.MAX_HUNGER)
	Events.hunger_changed.emit(hunger)
	print("Hunger changed")

func _on_game_ready():
	change_hunger(Constants.MIN_HUNGER)
