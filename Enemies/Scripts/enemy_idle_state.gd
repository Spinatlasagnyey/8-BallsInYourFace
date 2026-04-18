extends EnemyState

@export var acceleration: float = 1000
@export var agent: NavigationAgent2D

func on_state_start():
	agent.target_position = player.global_position

func update(delta: float) -> void:
	agent.target_position = player.global_position

func fixed_update(delta: float) -> void:
	var next_position = agent.get_next_path_position()
	entity.look_at(global_position + next_position)
	if(max_speed > entity.linear_velocity.length()): 
		entity.apply_force((next_position - entity.position).normalized() * acceleration)
	if not entity.get_colliding_bodies().is_empty():
		state_manager.change_state(stunned_state)

func on_state_end():
	pass
	
func _on_area_2d_body_entered(body: Node2D) -> void:  
	if body == player and state_manager.state != stunned_state: 
		entity.linear_damp = 10
		state_manager.change_state(prepare_state)
