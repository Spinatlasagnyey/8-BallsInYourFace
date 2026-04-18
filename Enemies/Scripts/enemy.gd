class_name Enemy
extends RigidBody2D

func _ready() -> void:
	call_deferred("add_to_game_state")

func add_to_game_state():
	GameState.enemies.append(self)
	tree_exiting.connect(remove_from_game_state)

func remove_from_game_state():
	GameState.enemies.erase(self)
