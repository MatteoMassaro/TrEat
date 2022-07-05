tool
extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer
export var next_scene: PackedScene


func _on_body_entered(body):
	teleport()


func _get_configuration_warning():
	return "The next scene property can't be empty" if not next_scene else ""


func teleport() -> void:
	yield(get_tree().create_timer(0.2),"timeout")
	PlayerData.player_entered_portal = true
	anim_player.play("fade_in")
	yield(anim_player, "animation_finished")
	PlayerData.player_entered_portal = false
	get_tree().change_scene_to(next_scene)

