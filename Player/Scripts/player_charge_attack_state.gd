extends PlayerBaseState

var charge: float = 1

func on_state_start():
	charge = 1

func update(delta: float) -> void:
	charge += delta
	if Input.is_action_just_released("attack"):
		state_manager.change_state(attack_state)

func fixed_update(delta: float) -> void:
	pass

func on_state_end():
	pass
