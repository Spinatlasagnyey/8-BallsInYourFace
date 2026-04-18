extends TextureButton

@export var scene: PackedScene

func _on_pressed() -> void:
	GlobalEventSystem.change_scene.emit(scene)
