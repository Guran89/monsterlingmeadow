extends HBoxContainer

const HUNGER_UI = preload("res://Scenes/HungerUI.tscn")

func _ready():
	Events.hunger_changed.connect(_on_hunger_changed)

	for i in range(Constants.MAX_HUNGER):
		add_child(HUNGER_UI.instantiate())

func _on_hunger_changed(hunger):
	var children = get_children()
	for i in children.size():
		children[i].set_full(hunger > i)
