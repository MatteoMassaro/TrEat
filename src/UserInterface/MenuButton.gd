tool
extends Button


export(String, FILE) var next_scene_path: = ""


func _on_button_up():
	LevelData.level1 = false
	LevelData.level2 = false
	LevelData.level3 = false
	LevelData.level4 = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	TrackPlayer.settings_button_pressed = false
	if TrackPlayer.flagEffects == 0:
		TrackPlayer.effect_track = load("res://assets/user interface/Bonus/click1.ogg")
		TrackPlayer.play_effect()
	get_tree().paused = false
	get_tree().change_scene(next_scene_path)


func _on_mouse_entered():
	if TrackPlayer.flagEffects == 0:
		TrackPlayer.effect_track = load("res://assets/user interface/Bonus/rollover1.ogg")
		TrackPlayer.play_effect()


func _get_configuration_warning():
	return "Next scene path must be set for the button to work" if next_scene_path == "" else ""
