extends Node

var current_score = 0
signal score_added(amount: int, position: Vector2)

func add_score(amount: int, position: Vector2):
	current_score += amount
	score_added.emit(amount, position)
