extends PlayerBaseState

@export var stun_duration: float = 1
@export var animation_stun: AnimatedSprite2D


func on_state_start():
	entity.linear_damp = 2
	state_manager.start_state_timer(stun_duration)
	animation_stun.play()
	

func update(delta: float) -> void:
	if state_manager.check_state_timer_timeout():
		state_manager.change_state(run_state)

func fixed_update(delta: float) -> void:
	if check_for_stun():
		state_manager.change_state(stunned_state)

func on_state_end():
	animation_stun.stop()
	entity.linear_damp = 2
