class_name EnemyState
extends BaseState

@onready var idle_state: Node2D = $'../IdleState'
@onready var prepare_state: Node2D = $'../PrepareState'
@onready var dash_state: Node2D = $'../DashState'

@export var player2: Node2D
@onready var player = self.get_tree().get_first_node_in_group("player")

var max_speed: float = 50
var radius: float = 4
var linear_force: float = 5
var strength: float = 2000;
