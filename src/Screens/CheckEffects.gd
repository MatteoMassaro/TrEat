extends CheckButton



func _on_button_up():
	if self.pressed == false:
		TrackPlayer.flagEffects = 1
		TrackPlayer.is_playing_effects = false
	else:
		TrackPlayer.flagEffects = 0
		TrackPlayer.is_playing_effects = true
