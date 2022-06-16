extends CheckButton


func _on_button_up():
	if self.pressed == false:
		TrackPlayer.stop_music()
		TrackPlayer.flagMusic = 1
	else:
		TrackPlayer.play_music()
		TrackPlayer.flagMusic = 0
		TrackPlayer.settings_button_pressed = true
