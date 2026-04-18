class_name PlayerBaseState
extends BaseState

@onready var run_state: Node2D = $'../RunState'
@onready var stunned_state: Node2D = $'../StunnedState'
@onready var charge_attack_state: Node2D = $'../ChargeAttackState'
@onready var attack_state: Node2D = $'../AttackState'
