class_name DeathBehavior
extends Node2D

@onready var object: RigidBody2D = get_parent()

func on_death(hole_position) -> void:
	print_debug("Death_behaviour not implemented")
	
