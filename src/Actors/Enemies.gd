extends "res://src/Actors/Actor.gd"

export var score: = 100
var flag = 0

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")
onready var anim_player2: AnimationPlayer = get_node("AnimationPlayer2")
onready var anim_player3: AnimationPlayer = get_node("AnimationPlayer3")
onready var sound_player: AudioStreamPlayer = get_node("PickSound")

func _ready():
	set_physics_process(false)
	_velocity.x = -speedEnemy.x


func _on_StompDetector_body_entered(body):
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
	get_node("CollisionShape2D").queue_free()
	get_node("StompDetector/CollisionShape2D").queue_free()
	die()


func _physics_process(delta):
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y

func die():
	anim_player.play("fade_out")
	anim_player2.play("points_up")
	if TrackPlayer.flagEffects == 0:
		TrackPlayer.effect_track = load("res://assets/user interface/kenney_interfacesounds/Audio/minimize_008.ogg")
		TrackPlayer.play_enemie_effect()
	flag = 1
	anim_player3.play("fade_out2")
	PlayerData.score += score
