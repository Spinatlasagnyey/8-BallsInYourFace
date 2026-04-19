extends TextureButton

@export var scene: String

func _on_pressed() -> void:
	GlobalEventSystem.change_scene.emit(scene)
	$"../AudioStreamPlayer2D".play()
