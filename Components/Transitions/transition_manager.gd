class_name TransitionManager
extends CanvasLayer

@export var anim: AnimationPlayer
@onready var color_rect: ColorRect = $ColorRect

func _ready() -> void:
	GlobalEventSystem.change_scene.connect(change_scene)

func change_scene(scene: PackedScene):
	anim.play("ball_fade_out")
	await anim.animation_finished
	get_tree().change_scene_to_packed(scene)
	anim.play("ball_fade_in")

func increase_fade_seed():
	var seed = $ColorRect.material.get_shader_parameter("seed")
	color_rect.material.set_shader_parameter("seed", seed + 1.0)
