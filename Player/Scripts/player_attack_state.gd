extends PlayerBaseState

@export var attack_duration: float = 0.6
var throw_strength: float = 1000
@export var attack_range = 169
@export var ball_rotation_point: Node2D
@export var ball: AnimatableBody2D

func on_state_start():
	#var tween = self.get_tree().create_tween()
	state_manager.start_state_timer(attack_duration)
	entity.linear_damp = 0
	entity.apply_impulse((get_global_mouse_position() - global_position).normalized() * min(300 + (charge_attack_state.charge * 200), 1800))
	ball_rotation_point.look_at(get_global_mouse_position())
	#await tween.tween_property(ball, "position", Vector2(attack_range, 0), 0.3/charge_attack_state.charge).finished
	#ball.get_node("CollisionShape2D").disabled = true
	#var tween2 = get_tree().create_tween()
	#await tween2.tween_property(ball, "position", Vector2(0, 0), 0.3).finished
	#ball.get_node("CollisionShape2D").disabled = false

func update(delta: float) -> void:
	if state_manager.check_state_timer_timeout():
		state_manager.change_state(run_state)
		GlobalEventSfx.sfx_balls_shoot.emit(false)

func fixed_update(delta: float) -> void:
	if check_for_stun():
		state_manager.change_state(stunned_state)
		

func on_state_end():
	entity.linear_damp = 10
