class_name StateManager
extends Node2D

var entity: Node2D = null
var state:BaseState = null
var states:Array[BaseState] = []
var state_timer:float = 0
var is_state_timer_running := false
var state_timer_timeout := false

func _ready() -> void:
	for child in get_children():
		if child is BaseState:
			state = child
			state.on_state_start()
			break
	
	for child in get_children():
		if child is BaseState:
			states.append(child)
			child.entity = get_parent()
			child.state_manager = self

	for child in get_children():
		if child is BaseState:
			states.append(child)
			child.entity = get_parent()
			child.state_manager = self

func change_state(new_state):
	if state:
		state.on_state_end()
	state = new_state
	state.on_state_start()

func _process(delta: float) -> void:
	state.update(delta)
	if is_state_timer_running:
		state_timer -= delta
		if state_timer < 0:
			state_timer_timeout = true
			is_state_timer_running = false


func _physics_process(delta: float) -> void:
	state.fixed_update(delta)

func init(entity_refernece:Node2D, params: Dictionary = {}):
	entity = entity_refernece
	for child in get_children():
		if child is BaseState:
			states.append(child)
			child.entity = entity_refernece
			child.state_manager = self
			
			for key in params.keys():
				if key in child:
					child.set(key, params[key])
				else:
					print_debug("Warning: Child '%s' does not have a property '%s'" % [child.name, key])

func start_state_timer(time: float):
	state_timer = time
	is_state_timer_running = true

func check_state_timer_timeout():
	if state_timer_timeout:
		state_timer_timeout = false
		return true
	return false

	
