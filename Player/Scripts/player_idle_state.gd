extends PlayerBaseState

@export var acceleration: float = 10000
@export var max_speed = 200

func on_state_start():
	pass

func update(delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		state_manager.change_state(charge_attack_state)

func fixed_update(delta: float) -> void:
	#var direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()
	#if entity.linear_velocity.length() < max_speed:
		#entity.apply_force(direction * acceleration)
	
	if check_for_stun():
		state_manager.change_state(stunned_state)

func on_state_end():
	pass
