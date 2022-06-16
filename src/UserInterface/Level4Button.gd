tool
extends Button


export(String, FILE) var next_scene_path: = ""


func _on_button_up():
	LevelData.level4 = true
	HealthBar.enemy_counter = 0
	if TrackPlayer.flagEffects == 0:
		TrackPlayer.effect_track = load("res://assets/user interface/Bonus/click1.ogg")
		TrackPlayer.play_effect()
	PlayerData.score = 0
	TrackPlayer.settings_button_pressed = true
	get_tree().paused = false
	get_tree().change_scene(next_scene_path)


func _on_mouse_entered():
	if TrackPlayer.flagEffects == 0:
		TrackPlayer.effect_track = load("res://assets/user interface/Bonus/rollover1.ogg")
		TrackPlayer.play_effect()


func _get_configuration_warning():
	return "Next scene path must be set for the button to work" if next_scene_path == "" else ""
