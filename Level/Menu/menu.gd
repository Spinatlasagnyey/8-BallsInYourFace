extends CanvasLayer

func _ready() -> void:
	if GameState.is_winner:
		$Control.visible = true
		$GPUParticles2D.visible = true
