extends AudioStreamPlayer2D

func _ready() -> void:
	GlobalEventSfx.sfx_balls_shoot.connect(play_random_collision)
	
func play_random_collision(is_playing):
	if(is_playing):
		play()
	else:
		stop()
