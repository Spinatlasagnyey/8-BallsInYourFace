extends CanvasLayer

@export var next_scene: String

func _ready() -> void:
	GlobalEventSystem.level_cleared.connect(appear)
	$TextureButton.scene = next_scene

func appear():
	self.visible = true
