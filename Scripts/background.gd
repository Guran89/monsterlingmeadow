extends Sprite2D

#FMOD
@export var dayMusic: EventAsset
@export var nightMusic: EventAsset
var dayMusicInstance: EventInstance
var nightMusicInstance: EventInstance

var fade_parameter: float

func _ready():
	Events.time_changed.connect(_on_time_changed)
	#FMODRuntime.play_one_shot(event)
	#play day music
	dayMusicInstance = FMODRuntime.create_instance(dayMusic)
	dayMusicInstance.start()

func _on_time_changed(time):
	texture = time.texture
	
	#fade day music
	fade_parameter = 1.0 #set fade parameter to 1
	dayMusicInstance.set_parameter_by_name("Fade", fade_parameter, false)
	
	#play night music
	#nightMusicInstance = FMODRuntime.create_instance(nightMusic)
	#nightMusicInstance.start()
