class_name BaseState
extends Node2D

var entity:CharacterBody2D
var state_manager:StateManager

func on_state_start():
	pass

func update(delta: float) -> void:
	pass

func fixed_update(delta: float) -> void:
	pass

func on_state_end():
	pass
