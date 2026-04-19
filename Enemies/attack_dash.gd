extends EnemyState

@export var time: float = 5.0
@export var effect_dash: GPUParticles2D;
@export var sfx_dash: AudioStreamPlayer2D

func on_state_start():
	effect_dash.emitting = true
	entity.linear_damp = 2.0
	entity.apply_impulse((player.position - entity.position).normalized() * strength)
	state_manager.start_state_timer(time)
	sfx_dash.play()
	
func update(delta: float) -> void:
	if(true == state_manager.check_state_timer_timeout()):
		state_manager.change_state(idle_state)

func fixed_update(delta: float) -> void:
	if not entity.get_colliding_bodies().is_empty():
		state_manager.change_state(stunned_state)

func on_state_end():
	GlobalEventSfx.sfx_balls_shoot.emit(false)
	effect_dash.emitting = false
	entity.linear_damp = 2
	sfx_dash.stop()
