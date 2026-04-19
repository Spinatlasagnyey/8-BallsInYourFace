extends PlayerBaseState

var charge: float = 0
@export var charge_particles: GPUParticles2D

func on_state_start():
	charge = 0
	charge_particles.emitting = true
	GlobalEventSfx.sfx_balls_power_up.emit(true)

func update(delta: float) -> void:
	charge += delta
	charge_particles.amount_ratio = charge/4
	if Input.is_action_just_released("attack"):
		GlobalEventSfx.sfx_balls_power_up.emit(false)
		state_manager.change_state(attack_state)

func fixed_update(delta: float) -> void:
	if check_for_stun():
		GlobalEventSfx.sfx_balls_power_up.emit(false)
		state_manager.change_state(stunned_state)

func on_state_end():
	charge_particles.emitting = false
	GlobalEventSfx.sfx_balls_shoot.emit(true)
