extends Node2D

@onready var _feed_area = $FeedArea
@onready var _hunger = $Hunger

# References to the AnimatedSprite2D nodes
@onready var arm_sprite = $arms
@onready var head_sprite = $heads
@onready var leg_sprite = $legs
@onready var eye_sprite = $eyes
@onready var mouth_sprite = $mouths
@onready var torso_sprite = $torsos

func _ready():
	Events.food_item_dropped.connect(_on_food_item_dropped)
	Events.time_changed.connect(_on_time_changed)

	randomize()

	var _torso = get_random(Data.torsos.values())
	var _head = get_random(Data.heads.values())
	var _arms = get_random(Data.arms.values())
	var _legs = get_random(Data.legs.values())
	var _mouth = get_random(Data.mouths.values())
	var _eyes = get_random(Data.eyes.values())

	head_sprite.sprite_frames = _head.idle_animation
	mouth_sprite.sprite_frames = _mouth.idle_animation
	arm_sprite.sprite_frames = _arms.idle_animation
	eye_sprite.sprite_frames = _eyes.idle_animation

	for i in get_children():
		if i is AnimatedSprite2D:
			i.play()

func get_random(array):
	return array[randi() % array.size()]

func _on_feed_area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		print("Monster clicked")

func _on_food_item_dropped(food_item):
	if _feed_area.hover():
		_hunger.change_hunger(food_item.get_food().nutrition)

func _on_time_changed(time):
	if time == Data.times.DAY:
		_hunger.change_hunger(Constants.FOOD_LOSS_PER_DAY)
