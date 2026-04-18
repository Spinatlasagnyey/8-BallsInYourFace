extends Node2D


var sfx_hole: AudioStreamPlayer2D;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sfx_hole = get_node("AudioStreamPlayer2D")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.is_in_group("enemies") or body.is_in_group("player")):
		sfx_hole.play()
		body.get_node("DeathBehaivor").on_death(self.global_position)
