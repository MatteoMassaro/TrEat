extends Control

onready var check_music: CheckButton = get_node("Menu/CheckMusic")
onready var check_effects: CheckButton = get_node("Menu/CheckEffects")



func _ready():
	if TrackPlayer.is_playing_music == true:
		check_music.pressed = true
	elif TrackPlayer.is_playing_music == false:
		check_music.pressed = false
	if TrackPlayer.is_playing_effects == true:
		check_effects.pressed = true
	elif TrackPlayer.is_playing_effects == false:
		check_effects.pressed = false
