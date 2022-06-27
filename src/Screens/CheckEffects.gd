extends CheckButton



func _on_button_up():
	if self.pressed == false:
		TrackPlayer.flagEffects = 1
		TrackPlayer.is_playing_effects = false
	elif self.pressed == true:
		TrackPlayer.flagEffects = 0
		TrackPlayer.is_playing_effects = true


func _on_mouse_entered():
	if self.pressed == false:
		if TrackPlayer.flagEffects == 0:
			TrackPlayer.effect_track = load("res://assets/user interface/Bonus/rollover1.ogg")
			TrackPlayer.play_effect()
