extends Area2D

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")
onready var anim_player2: AnimationPlayer = get_node("AnimationPlayer2")
onready var anim_player3: AnimationPlayer = get_node("AnimationPlayer3")
onready var sound_player: AudioStreamPlayer = get_node("PickSound")

export var score: = 100
var flag = 0


func _on_body_entered(body):
	picked()


func picked():
	HealthBar.food_picked()
	PlayerData.score += score
	anim_player.play("fade_out")
	anim_player2.play("points_up")
	if TrackPlayer.flagEffects == 0:
		if flag == 0:
			TrackPlayer.effect_track = load("res://assets/user interface/kenney_interfacesounds/Audio/maximize_007.ogg")
			TrackPlayer.play_effect()
	flag = 1
	anim_player3.play("fade_out 2")

