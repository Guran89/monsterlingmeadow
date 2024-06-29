extends Timer

var _time = 1
var _max_time = Data.times.size()

func _ready():
	wait_time = Constants.DAY_LENGTH_SECONDS
	start()

func _on_timeout():
	_time = (_time + 1) % _max_time

	Events.time_changed.emit(Data.times.values()[_time])
