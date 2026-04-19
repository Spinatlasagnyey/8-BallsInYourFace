extends EnemyState

@export var acceleration: float = 1000
@export var agent: NavigationAgent2D
@export var ray: RayCast2D

func on_state_start():
	agent.target_position = player.global_position

func update(delta: float) -> void:
	#agent.target_position = player.global_position
	pass

func fixed_update(delta: float) -> void:
	ray.look_at(player.position)
	if ray.get_collider() is Player:
		entity.linear_damp = 2
		state_manager.change_state(prepare_state)
	#var next_position = agent.get_next_path_position()
	#entity.look_at(global_position + next_position)
	#if(max_speed > entity.linear_velocity.length()): 
		#entity.apply_force((next_position - entity.position).normalized() * acceleration)
	if not entity.get_colliding_bodies().is_empty():
		state_manager.change_state(stunned_state)
	

func on_state_end():
	pass
