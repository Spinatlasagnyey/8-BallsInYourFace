class_name PlayerBaseState
extends BaseState

@onready var run_state: Node2D = $'../RunState'
@onready var stunned_state: Node2D = $'../StunnedState'
@onready var charge_attack_state: Node2D = $'../ChargeAttackState'
@onready var attack_state: Node2D = $'../AttackState'

func check_for_stun():
	if not entity.get_colliding_bodies().is_empty():
		if entity.get_colliding_bodies()[0].is_in_group("enemies"):
			stunned_state.stun_duration = 1
		else:
			stunned_state.stun_duration = 0.2
		return true
	return false
