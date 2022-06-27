extends CheckButton


func _on_button_up():
	if self.pressed == false:
		TrackPlayer.stop_music()
		TrackPlayer.flagMusic = 1
	elif self.pressed == true:
			TrackPlayer.play_music()
			TrackPlayer.flagMusic = 0
			TrackPlayer.settings_button_pressed = true


func _on_mouse_entered():
	if self.pressed == false:
		if TrackPlayer.flagEffects == 0:
			TrackPlayer.effect_track = load("res://assets/user interface/Bonus/rollover1.ogg")
			TrackPlayer.play_effect()
