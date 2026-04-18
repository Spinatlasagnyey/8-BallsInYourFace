class_name GameManager
extends Node2D

@export var score_up_label: PackedScene

func _ready() -> void:
	GameState.score_added.connect(create_score_up_label)

func create_score_up_label(amount: int, collision_position: Vector2):
	var inst:RichTextLabel = score_up_label.instantiate()
	inst.global_position = collision_position
	inst.apply_score_text(str(amount))
	get_tree().current_scene.add_child(inst)
