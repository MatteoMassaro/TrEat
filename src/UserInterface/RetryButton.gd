extends Button



func _on_button_up():
	HealthBar.enemy_counter = 0
	if TrackPlayer.flagEffects == 0:
		TrackPlayer.effect_track = load("res://assets/user interface/Bonus/click1.ogg")
		TrackPlayer.play_effect()
	PlayerData.score = 0
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_mouse_entered():
	if TrackPlayer.flagEffects == 0:
		TrackPlayer.effect_track = load("res://assets/user interface/Bonus/rollover1.ogg")
		TrackPlayer.play_effect()
