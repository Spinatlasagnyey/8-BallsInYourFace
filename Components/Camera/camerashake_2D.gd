extends Camera2D

@export var decay:float = 0.7;
@export var max_offset:Vector2 = Vector2(50,20)
@export var max_roll:float = 0.1; 

var trauma: float = 0.0  
var trauma_power: float = 2 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalEventSystem.camerashake2D.connect(add_trauma)
	randomize()

func _process(delta: float) -> void:
	if trauma:
		trauma = max(trauma - decay * delta, 0)
		shake()

	
func add_trauma(amount) -> void:
	trauma = min(trauma + amount, 1)

func shake() -> void:
	var amount: float = pow(trauma, trauma_power)
	rotation = max_roll * randf_range(1, -1) * amount
	offset.x = max_offset.x * randf_range(1, -1) * amount
	offset.y = max_offset.y * randf_range(1, -1) * amount
