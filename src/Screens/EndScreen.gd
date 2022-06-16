extends Control

onready var game_over_title: RichTextLabel = get_node("GameOver")
onready var level_completed_title: RichTextLabel = get_node("LevelCompleted")
onready var score: Label = get_node("Score")


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	score.text = score.text % [PlayerData.score]
	if HealthBar.enemy_counter < 3:
		game_over_title.visible = false
		level_completed_title.visible = true
		if TrackPlayer.flagMusic == 0:
			TrackPlayer.music_track = load("res://assets/user interface/Music/mixkit-game-level-completed-2059.wav")
			TrackPlayer.play_music()
