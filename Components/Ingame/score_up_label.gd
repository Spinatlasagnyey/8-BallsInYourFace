extends RichTextLabel

func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", position + Vector2(0, -20), 0.6)
	tween.tween_property(self, "modulate:a", 0, 0.5)
	tween.tween_callback(queue_free)

func apply_score_text(txt: String):
	text = "[shake][rainbow freq=1.0 sat=0.8 val=0.8 speed=1.0]" + txt + "[/rainbow][/shake]"
