extends PlayerBaseState

@export var stun_duration: float = 1

func on_state_start():
	entity.linear_damp = 1
	state_manager.start_state_timer(stun_duration)

func update(delta: float) -> void:
	if state_manager.check_state_timer_timeout():
		state_manager.change_state(run_state)

func fixed_update(delta: float) -> void:
	if not entity.get_colliding_bodies().is_empty():
		state_manager.change_state(stunned_state)

func on_state_end():
	entity.linear_damp = 10
