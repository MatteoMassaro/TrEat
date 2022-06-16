extends Node

var music_track = load("")
var effect_track = load("")
var steps_track = load("")
var is_playing_music
var is_playing_effects 
var flagMusic = 0
var flagEffects = 0
var settings_button_pressed = false

onready var effects_player : AudioStreamPlayer = get_node("Steps")

func _ready():
	pass


func play_music():
	$Music.stream = music_track
	$Music.play()
	is_playing_music = true


func stop_music():
	$Music.stop()
	is_playing_music = false


func play_effect():
	$Effects.stream = effect_track
	$Effects.play()


func stop_effect():
	$Effects.stop()


func play_steps():
	$Steps.stream = steps_track
	$Steps.play()


func stop_steps():
	$Steps.stop()
