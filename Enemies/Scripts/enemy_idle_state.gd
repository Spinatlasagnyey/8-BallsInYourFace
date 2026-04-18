extends EnemyState

func on_state_start():
	pass

func update(delta: float) -> void:
	pass

func fixed_update(delta: float) -> void:
	entity.look_at(player.position)
	if(max_speed > entity.linear_velocity.length()): 
		entity.apply_force(player.position - entity.position)
		
func on_state_end():
	pass
	
func _on_area_2d_body_entered(body: Node2D) -> void:  
	if body == player: 
		entity.linear_damp = 10
		state_manager.change_state(prepare_state)
