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
			var length = (self.linear_velocity.length() + get_colliding_bodies()[0].linear_velocity.length())/10000
			await get_tree().create_timer(length).timeout
			Engine.time_scale = 1
		else:
			GlobalEventSfx.sfx_balls_collision_walls.emit()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("reset"):
		GlobalEventSystem.reload_scene.emit()
	$Sprite2D2.look_at(get_global_mouse_position())
