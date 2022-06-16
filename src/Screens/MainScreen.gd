extends Control

func _ready():
	TrackPlayer.music_track = load ("res://assets/user interface/Music/ES_Glimmer - AGST.mp3")
	if TrackPlayer.flagMusic == 0:
		if TrackPlayer.settings_button_pressed == false:
			TrackPlayer.play_music()
