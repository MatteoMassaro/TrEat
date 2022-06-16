extends Node2D

onready var music_player: AudioStreamPlayer = get_node("GameMusic")


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	TrackPlayer.music_track = load ("res://assets/user interface/Music/QL004-CBA.mp3")
	if TrackPlayer.flagMusic == 0:
		TrackPlayer.play_music()
