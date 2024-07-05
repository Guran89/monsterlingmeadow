extends Timer

var _time = 1
var _max_time = Data.times.size()

func _ready():
	print("Press N to change time of day.")
	print("Press R to randomize a new monsterling.")
	print("Press SPACE to start sample dialogue.")
	wait_time = Constants.DAY_LENGTH_SECONDS
	start()

#func _on_timeout():
	#_time = (_time + 1) % _max_time
#
	#Events.time_changed.emit(Data.times.values()[_time])

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ChangeTime"):
		_time = (_time + 1) % _max_time
		Events.time_changed.emit(Data.times.values()[_time])
