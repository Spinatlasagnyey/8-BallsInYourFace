extends DeathBehavior

@export var animation_stun: AnimatedSprite2D

func on_death(hole_position: Vector2):
	animation_stun.visible = false
	object.linear_damp = 1000
	
	
	var tween_scale: Tween = self.get_parent().create_tween()
	var tween_position: Tween = self.get_parent().create_tween()
	
	tween_position.tween_property(object.get_node("Sprite2D"), "global_position", hole_position, 0.5)
	await tween_scale.tween_property(object.get_node("Sprite2D"), "scale", Vector2.ZERO, 1).finished
	


	
