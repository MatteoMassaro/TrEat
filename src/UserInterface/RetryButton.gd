extends Button

export(String, FILE) var next_scene_path: = ""


func _on_button_up():
	HealthBar.enemy_counter = 0
	if TrackPlayer.flagEffects == 0:
		TrackPlayer.effect_track = load("res://assets/user interface/Bonus/click1.ogg")
		TrackPlayer.play_effect()
	PlayerData.score = 0
	if LevelData.level1 == true:
		next_scene_path = "res://src/Levels/Level1.tscn"
		get_tree().paused = false
		get_tree().change_scene(next_scene_path)
	elif LevelData.level2 == true:
		next_scene_path = "res://src/Levels/Level2.tscn"
		get_tree().paused = false
		get_tree().change_scene(next_scene_path)
	elif LevelData.level3 == true:
		next_scene_path = "res://src/Levels/Level3.tscn"
		get_tree().paused = false
		get_tree().change_scene(next_scene_path)
	elif LevelData.level4 == true:
		next_scene_path = "res://src/Levels/Level4.tscn"
		get_tree().paused = false
		get_tree().change_scene(next_scene_path)


func _on_mouse_entered():
	if TrackPlayer.flagEffects == 0:
		TrackPlayer.effect_track = load("res://assets/user interface/Bonus/rollover1.ogg")
		TrackPlayer.play_effect()
