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

# Timers for animations
@onready var head_timer = $heads/HeadTimer
@onready var arm_timer = $arms/ArmTimer
@onready var eye_timer = $eyes/EyeTimer


@export var resource: DialogueResource
@export var dialogueStart: String

@export_category("Head Animation Timer")
@export_range(1, 20) var head_timer_max: int = 5
@export_range(1, 20) var head_timer_min: int = 3

@export_category("Eyes Animation Timer")
@export_range(1, 20) var eyes_timer_max: int = 5
@export_range(1, 20) var eyes_timer_min: int = 2

@export_category("Arms Animation Timer")
@export_range(1, 20) var arms_timer_max: int = 8
@export_range(1, 20) var arms_timer_min: int = 3

var _torso
var _head
var _arms
var _legs
var _mouth
var _eyes

func _ready():
	Events.food_item_dropped.connect(_on_food_item_dropped)
	Events.time_changed.connect(_on_time_changed)

	randomize()

	_torso = get_random(Data.torsos.values())
	_head = get_random(Data.heads.values())
	_arms = get_random(Data.arms.values())
	_legs = get_random(Data.legs.values())
	_mouth = get_random(Data.mouths.values())
	_eyes = get_random(Data.eyes.values())

	head_sprite.sprite_frames = _head.idle_animation
	mouth_sprite.sprite_frames = _mouth.idle_animation
	arm_sprite.sprite_frames = _arms.idle_animation
	eye_sprite.sprite_frames = _eyes.idle_animation

	#for i in get_children():
		#if i is AnimatedSprite2D:
			#i.play()

func get_random(array):
	return array[randi() % array.size()]

func _on_feed_area_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		print("Monster clicked")

func _on_food_item_dropped(food_item):
	if _feed_area.hover():
		_hunger.change_hunger(food_item.get_food().nutrition)
		mouth_sprite.sprite_frames = _mouth.eat_animation
		mouth_sprite.play()
		
		if _mouth.name == "mouth1":
			FMODRuntime.play_one_shot_path("event:/SFX/Monster/eat_tongue")
		if _mouth.name == "mouth2":
			FMODRuntime.play_one_shot_path("event:/SFX/Monster/eat_mouthopen")
		if _mouth.name == "mouth3":
			FMODRuntime.play_one_shot_path("event:/SFX/Monster/eat_blush")
		if _mouth.name == "mouth4":
			FMODRuntime.play_one_shot_path("event:/SFX/Monster/eat_eyesclosed")

func _on_time_changed(time):
	if time == Data.times.DAY || time == Data.times.NIGHT:
		_hunger.change_hunger(Constants.FOOD_LOSS_PER_DAY)


func _on_mouths_animation_finished():
	mouth_sprite.sprite_frames = _mouth.idle_animation
	mouth_sprite.play()

func _unhandled_input(_event):
	if Input.is_action_just_pressed("Space"):
		print("Start dialogue")
		var _dialogue_line = await DialogueManager.get_next_dialogue_line(resource, dialogueStart)
		DialogueManager.show_dialogue_balloon_scene("res://Scenes/balloon.tscn", resource)


func _on_eye_timer_timeout():
	eye_sprite.play()
	FMODRuntime.play_one_shot_path("event:/SFX/Monster/idle_eyes_blink")
	var timer_wait_time = randi_range(eyes_timer_min, eyes_timer_max)
	eye_timer.wait_time = timer_wait_time


func _on_head_timer_timeout():
	head_sprite.play()
	FMODRuntime.play_one_shot_path("event:/SFX/Monster/idle_head_ears_wiggle")
	var timer_wait_time = randi_range(head_timer_min, head_timer_max)
	head_timer.wait_time = timer_wait_time


func _on_arm_timer_timeout():
	arm_sprite.play()
	FMODRuntime.play_one_shot_path("event:/SFX/Monster/idle_arms_scratch")
	var timer_wait_time = randi_range(arms_timer_min, arms_timer_max)
	arm_timer.wait_time = timer_wait_time
