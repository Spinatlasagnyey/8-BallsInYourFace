extends PlayerBaseState

@export var attack_duration: float = 0.3
var throw_strength: float = 1000
@export var anim: AnimationPlayer
@export var ball_rotation_point: Node2D
@export var ball: AnimatableBody2D

func on_state_start():
	var tween = self.get_tree().create_tween()
	state_manager.start_state_timer(attack_duration)
	ball_rotation_point.look_at(get_global_mouse_position())
	await tween.tween_property(ball, "position", Vector2(69, 0), 0.3/charge_attack_state.charge).finished
	ball.get_node("CollisionShape2D").disabled = true
	var tween2 = get_tree().create_tween()
	await tween2.tween_property(ball, "position", Vector2(0, 0), 0.3).finished
	ball.get_node("CollisionShape2D").disabled = false

func update(delta: float) -> void:
	if state_manager.check_state_timer_timeout():
		state_manager.change_state(run_state)

func fixed_update(delta: float) -> void:
	pass

func on_state_end():
	pass
