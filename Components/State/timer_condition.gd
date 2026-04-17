extends StateSwitchCondition

@export var delay_time: float = 1
var timer: float = 0;
var timer_running := false
var timeout := false

func check() -> bool:
	if not timer_running:
		timer_running = true
	if timeout:
		timeout = false
		return true
	return false

func _process(delta: float) -> void:
	if timer_running:
		timer -= delta
		if timer <= 0:
			timeout = true
			timer_running = false
			reset_timer()
	
func reset_timer():
	timer = delay_time
