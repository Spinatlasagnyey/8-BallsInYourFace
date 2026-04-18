extends Node

var current_score = 0
signal score_added(amount: int, position: Vector2)
signal char_on_char_collison(position: Vector2)

func _ready() -> void:
	char_on_char_collison.connect(add_score)

func add_score(amount: int, position: Vector2):
	current_score += amount
	score_added.emit(amount, position)
