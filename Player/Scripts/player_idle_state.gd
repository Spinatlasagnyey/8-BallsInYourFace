extends PlayerBaseState

func on_state_start():
	pass

func update(delta: float) -> void:
	if not entity.get_colliding_bodies().is_empty():
		state_manager.change_state(stunned_state)
	if Input.is_action_just_pressed("attack"):
		state_manager.change_state(charge_attack_state)

func fixed_update(delta: float) -> void:
	var direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()
	if entity.linear_velocity.length() < max_speed:
		entity.apply_force(direction * 1000)

func on_state_end():
	pass
