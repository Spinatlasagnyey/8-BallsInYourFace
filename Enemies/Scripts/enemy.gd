class_name Enemy
extends RigidBody2D

@export var textures: Array[CompressedTexture2D] 
@export var sprite: Sprite2D

func _ready() -> void:
	call_deferred("add_to_game_state")
	sprite.texture = textures[randi_range(0, textures.size() - 1)]


func add_to_game_state():
	GameState.enemies.append(self)
	tree_exiting.connect(remove_from_game_state)

func remove_from_game_state():
	GameState.enemies.erase(self)
	
	
func apply_random_color():
	print("elo")
	
