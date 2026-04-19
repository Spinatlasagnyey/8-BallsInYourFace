class_name Smoketrail
extends Line2D

@export var limited_lifetime := false
@export var lifetime := [1.0, 2.0]
@export var wildness := 3.0
@export var min_spawn_distance := 1.0
@export var point_lifetime := 1.0
var gravity := Vector2.ZERO
var tick_speed := 0.05
var tick := 0.0
var wild_speed := 0.1
var point_age := [0.0]
@export var target_to_follow: Node2D

func _ready() -> void:
	clear_points()
	if limited_lifetime:
		var tween: Tween = get_tree().create_tween()
		tween.tween_property(self, "modulate:a", 0.0, randf_range(lifetime[0], lifetime[1]))
		tween.tween_callback(tween_finished)

func _process(delta: float) -> void:
	if target_to_follow:
		global_position = target_to_follow.global_position
	if tick > tick_speed:
		tick = 0
		for p in range(get_point_count()):
			var rand_vector := Vector2(randf_range(-wild_speed, wild_speed), randf_range(-wild_speed, wild_speed))
			points[p] += gravity + (rand_vector * wildness * point_age[p])
			if point_age[p] > point_lifetime:
				remove_point(p)
	else:
		tick += delta
	for age in point_age:
		age += delta

func maybe_add_point(point_pos: Vector2, at_pos := -1):
	if get_point_count() > 0 and point_pos.distance_to(points[get_point_count()-1]) < min_spawn_distance:
		return
	point_age.append(0.0)
	add_point(point_pos)

func tween_finished():
	queue_free()
