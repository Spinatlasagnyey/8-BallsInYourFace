extends RigidBody2D

@onready var player: Node2D = self.get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
	if (player.position - position).length() < 10:
		apply_impulse((player.position - position).normalized() * 1000)
	else:
		apply_force((get_global_mouse_position()-position).normalized() * 100)
