extends EnemyState

@export var acceleration: float = 1000

func on_state_start():
	pass

func update(delta: float) -> void:
	pass

func fixed_update(delta: float) -> void:
	entity.look_at(player.position)
	if(max_speed > entity.linear_velocity.length()): 
		entity.apply_force((player.position - entity.position).normalized() * acceleration)
	if not entity.get_colliding_bodies().is_empty():
		state_manager.change_state(stunned_state)

func on_state_end():
	pass
	
func _on_area_2d_body_entered(body: Node2D) -> void:  
	if body == player and state_manager.state != stunned_state: 
		entity.linear_damp = 10
		state_manager.change_state(prepare_state)
