extends VBoxContainer

const FOOD_ITEM_UI = preload("res://Scenes/food_item_ui.tscn")

func _on_toggle_pressed():
	visible = !visible

func _ready():
	Events.food_item_dropped.connect(_on_food_item_dropped)
	for i in range(3):
		add_child(FOOD_ITEM_UI.instantiate())

func _on_food_item_dropped(food_item):
	food_item.visible = true
