class_name Player
extends RigidBody2D

func _physics_process(delta: float) -> void:
	if not get_colliding_bodies().is_empty():
		print("collide")
		if get_colliding_bodies()[0].is_in_group("enemies"):
			GlobalEventSystem.camerashake2D.emit(1)
			GlobalEventSfx.sfx_balls_collision_balls.emit()
			
			print("enim_collide")
			GameState.add_score(100, self.position)
			Engine.time_scale = 0.1
			await get_tree().create_timer(0.1).timeout
			Engine.time_scale = 1
		else:
			GlobalEventSfx.sfx_balls_collision_walls.emit()
			
			
