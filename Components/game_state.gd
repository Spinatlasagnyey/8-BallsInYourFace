extends Node

var current_score = 0
var enemies: = []
signal score_added(amount: int, position: Vector2)

func add_score(amount: int, position: Vector2):
	current_score += amount
	score_added.emit(amount, position)

func remove_enemy(enemy: Node2D):
	enemies.erase(enemy)
	if enemies.is_empty():
		GlobalEventSystem.level_cleared.emit()
