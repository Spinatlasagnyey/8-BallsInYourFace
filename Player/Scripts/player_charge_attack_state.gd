extends PlayerBaseState

var charge: float = 1
@export var charge_particles: GPUParticles2D

func on_state_start():
	charge = 1
	charge_particles.emitting = true

func update(delta: float) -> void:
	charge += delta
	if Input.is_action_just_released("attack"):
		state_manager.change_state(attack_state)

func fixed_update(delta: float) -> void:
	if not entity.get_colliding_bodies().is_empty():
		state_manager.change_state(stunned_state)

func on_state_end():
	charge_particles.emitting = false
