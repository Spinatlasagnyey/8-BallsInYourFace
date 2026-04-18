extends EnemyState

@export var time: float = 2
@export var effect: GPUParticles2D 

func on_state_start():
	effect.emitting = true
	state_manager.start_state_timer(time)


func update(delta: float) -> void:
	pass
	
func fixed_update(delta: float) -> void:
	if(true == state_manager.check_state_timer_timeout()):
		state_manager.change_state(dash_state)
	

func on_state_end():
	effect.emitting = false
	pass	
