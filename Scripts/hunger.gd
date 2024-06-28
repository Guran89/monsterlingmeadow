extends Node

var hunger = 0

func change_hunger(change):
	hunger = clamp(hunger + change, Constants.MIN_HUNGER, Constants.MAX_HUNGER)
	Events.hunger_changed.emit(hunger)
	print("hunger changed: ", hunger)
