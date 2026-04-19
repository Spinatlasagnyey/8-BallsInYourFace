extends EnemyState

@export var time: float = 2
@export var effect: GPUParticles2D 
@export var power_up: AudioStreamPlayer2D

func on_state_start():
	effect.emitting = true
	state_manager.start_state_timer(time)
	power_up.play()

func update(delta: float) -> void:
	pass

func fixed_update(delta: float) -> void:
	if(true == state_manager.check_state_timer_timeout()):
		state_manager.change_state(dash_state)
	if not entity.get_colliding_bodies().is_empty():
		state_manager.change_state(stunned_state)

func on_state_end():
	GlobalEventSfx.sfx_balls_power_up.emit(false)
	effect.emitting = false
	power_up.stop()
	pass	
