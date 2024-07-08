extends Sprite2D

#FMOD
@export var dayMusic: EventAsset
@export var nightMusic: EventAsset
var dayMusicInstance: EventInstance
var nightMusicInstance: EventInstance

var fade_parameter: float

func _ready():
	Events.time_changed.connect(_on_time_changed)
	dayMusicInstance = FMODRuntime.create_instance(dayMusic)
	#dayMusicInstance.start()
	nightMusicInstance = FMODRuntime.create_instance(nightMusic)

# Start both music instances paused
	dayMusicInstance.start()
	dayMusicInstance.set_paused(true)
	nightMusicInstance.start()
	nightMusicInstance.set_paused(true)

func _on_time_changed(time):
	texture = time.texture

func _process(delta):
	if Data.time == 0:
		# Fade out night music, fade in day music
		fade_parameter = min(fade_parameter + delta, 1.0)
		dayMusicInstance.set_paused(false)
		nightMusicInstance.set_paused(false)
		dayMusicInstance.set_parameter_by_name("Fade", fade_parameter, false)
		nightMusicInstance.set_parameter_by_name("Fade", 1.0 - fade_parameter, false)
	else:
		# Fade out day music, fade in night music
		fade_parameter = max(fade_parameter - delta, 0.0)
		dayMusicInstance.set_paused(false)
		nightMusicInstance.set_paused(false)
		dayMusicInstance.set_parameter_by_name("Fade", fade_parameter, false)
		nightMusicInstance.set_parameter_by_name("Fade", 1.0 - fade_parameter, false)
