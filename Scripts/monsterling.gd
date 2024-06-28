extends Node2D

var hunger = Globals.hunger

# Define the number of available animations for each body part
const NUM_ARMS = 4
const NUM_HEADS = 4
const NUM_LEGS = 1
const NUM_EYES = 4
const NUM_MOUTHS = 4
const NUM_TORSOS = 1

# References to the AnimatedSprite2D nodes
@onready var arm_sprite = $arms
@onready var head_sprite = $heads
@onready var leg_sprite = $legs
@onready var eye_sprite = $eyes
@onready var mouth_sprite = $mouths
@onready var torso_sprite = $torsos

func _ready():
	randomize()
	play_random_animation(arm_sprite, NUM_ARMS)
	play_random_animation(head_sprite, NUM_HEADS)
	play_random_animation(leg_sprite, NUM_LEGS)
	play_random_animation(eye_sprite, NUM_EYES)
	play_random_animation(mouth_sprite, NUM_MOUTHS)
	play_random_animation(torso_sprite, NUM_TORSOS)

func play_random_animation(animated_sprite: AnimatedSprite2D, num_animations: int) -> void:
	var random_index = randi() % num_animations + 1 # Random number between 1 and num_animations
	var animation_name = "idle" + str(random_index)
	
	var sprite_frames = animated_sprite.sprite_frames
	if sprite_frames and sprite_frames.has_animation(animation_name):
		animated_sprite.play(animation_name)





func _process(delta: float) -> void:
	if Input.is_action_just_pressed("eat"):
		$Mouth1Idle.play("eat")


func _on_head_timer_timeout() -> void:
	print("HeadAnimation")
	$Head1Idle.play("head1")


func _on_eye_timer_timeout() -> void:
	$Eyes1Blink.play("eye2")


func _on_arms_timer_timeout() -> void:
	$Arms3Idle.play("arms2")



#func _on_mouth_timer_timeout() -> void:
	#if eating == false:
		#$Mouth1Idle.play("idle")



func _on_mouth_1_idle_animation_finished() -> void:
	$Mouth1Idle.play("idle")


func _on_eat_timer_timeout() -> void:
	pass # Replace with function body.
