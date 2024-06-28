extends Sprite2D

const DAY = preload("res://Backgrounds/day.png")
const NIGHT = preload("res://Backgrounds/night.png")

@onready var _day = true

func _ready():
	$Timer.start()

func _on_timer_timeout():
	print("timeout")
	texture = DAY if _day else NIGHT
