extends Sprite2D

func _ready():
	Events.time_changed.connect(_on_time_changed)

func _on_time_changed(time):
	texture = time.texture
