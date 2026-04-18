extends Node2D


@onready var camera_2D: Camera2D = self.get_node("Camera2D")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalEventSystem.camerashake2D.emit(10)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
