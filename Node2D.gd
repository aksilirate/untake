extends Node2D



onready var animation_player = $AnimationPlayer
onready var dim_tween = $DimTween
onready var background_sprite = $BackgroundSprite


func _ready():
	background_sprite.modulate.a = 0.6
	animation_player.play("day_1")



func dialog_listener(string): 
	match string:
		"lighten_background":
			lighten_background()
		"day_2":
			animation_player.play("day_2")
		"dim_background":
			dim_background()
		"day_3":
			animation_player.play("day_3")
		"day_4":
			animation_player.play("day_4")
		"end":
			animation_player.play("end")
func dim_background():
	dim_tween.interpolate_property(background_sprite, "modulate", Color.white, Color.white - Color(0,0,0,0.4), 1.0,Tween.TRANS_SINE)
	dim_tween.start()



func lighten_background():
	dim_tween.interpolate_property(background_sprite, "modulate", Color.white - Color(0,0,0,0.4), Color.white,  1.0,Tween.TRANS_SINE)
	dim_tween.start()




func start_dialog(dialog_name):
	var dialog = Dialogic.start(dialog_name)
	dialog.connect("dialogic_signal", self, "dialog_listener")
	add_child(dialog)



func _on_AnimationPlayer_animation_finished(anim_name):
	match anim_name:
		"day_1":
			start_dialog("day_1")
