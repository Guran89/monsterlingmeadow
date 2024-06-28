extends CanvasLayer

var hunger = Globals.hunger
@onready var hunger_1: TextureRect = $Hunger/hunger1
@onready var hunger_2: TextureRect = $Hunger/hunger2
@onready var hunger_3: TextureRect = $Hunger/hunger3
@onready var food_items: VBoxContainer = $FoodItems
const HUNGEREMPTY = preload("res://assets/UI/hungerempty.png")
const HUNGERHALF = preload("res://assets/UI/hungerhalf.png")
const HUNGERFULL = preload("res://assets/UI/hungerfull.png")

func _ready() -> void:
	food_items.visible = false

func _process(delta: float) -> void:
	print(hunger)
	if hunger == 0:
		hunger_1.texture = HUNGEREMPTY
		hunger_2.texture = HUNGEREMPTY
		hunger_3.texture = HUNGEREMPTY
	elif hunger == 0.5:
		hunger_1.texture = HUNGERHALF
		hunger_2.texture = HUNGEREMPTY
		hunger_3.texture = HUNGEREMPTY
	elif hunger == 1:
		hunger_1.texture = HUNGERFULL
		hunger_2.texture = HUNGEREMPTY
		hunger_3.texture = HUNGEREMPTY
	elif hunger == 1.5:
		hunger_1.texture = HUNGERFULL
		hunger_2.texture = HUNGERHALF
		hunger_3.texture = HUNGEREMPTY
	elif hunger == 2:
		hunger_1.texture = HUNGERFULL
		hunger_2.texture = HUNGERFULL
		hunger_3.texture = HUNGEREMPTY
	elif hunger == 2.5:
		hunger_1.texture = HUNGERFULL
		hunger_2.texture = HUNGERFULL
		hunger_3.texture = HUNGERHALF
	elif hunger == 3:
		hunger_1.texture = HUNGERFULL
		hunger_2.texture = HUNGERFULL
		hunger_3.texture = HUNGERFULL


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if hunger < 3:
			hunger += 0.5
		else:
			return


func _on_timer_timeout() -> void:
	if hunger > 0:
		hunger -= 0.5


func _on_button_pressed() -> void:
	if food_items.visible == false:
		food_items.visible = true
	else:
		food_items.visible = false
