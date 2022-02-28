extends Button



func _ready():
	modulate.a = 0.0



func _process(delta):
	modulate.a += delta
	modulate.a = min(modulate.a, 1.0)
	if has_focus():
		if Input.is_action_pressed(get_meta('input_next')):
			emit_signal("button_down")
		if Input.is_action_just_released(get_meta('input_next')):
			emit_signal("button_up")
			emit_signal("pressed")
