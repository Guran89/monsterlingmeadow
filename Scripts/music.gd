extends AudioStreamPlayer

func _ready():
	Events.time_changed.connect(_on_time_changed)
	stream = Data.times.DAY.sound
	play()

func _on_time_changed(time):
	stop()
	stream = time.sound
	play()
