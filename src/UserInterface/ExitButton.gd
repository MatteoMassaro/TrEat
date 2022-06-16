extends Button



func _on_button_up():
	if TrackPlayer.flagEffects == 0:
		TrackPlayer.effect_track = load("res://assets/user interface/Bonus/click1.ogg")
		TrackPlayer.play_effect()
	get_tree().quit()


func _on_mouse_entered():
	if TrackPlayer.flagEffects == 0:
		TrackPlayer.effect_track = load("res://assets/user interface/Bonus/rollover1.ogg")
		TrackPlayer.play_effect()
