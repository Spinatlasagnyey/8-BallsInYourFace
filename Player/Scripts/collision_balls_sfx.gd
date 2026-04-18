extends AudioStreamPlayer2D
@export var collision_sounds: Array[AudioStream]

func _ready() -> void:
	GlobalEventSfx.sfx_balls_collision_balls.connect(play_random_collision)

func play_random_collision():
	if collision_sounds.size() == 0:
		return
	
	stream = collision_sounds.pick_random()
	play()
