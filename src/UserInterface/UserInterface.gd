extends Control

onready var scene_tree: = get_tree()
onready var pause_overlay: ColorRect = get_node("PauseOverlay")
onready var score: Label = get_node("Score")
onready var health: Label = get_node("Health")
onready var health_bar: ProgressBar = get_node("HealthBar")
onready var pause_title: RichTextLabel = get_node("PauseOverlay/PauseTitle")
onready var check_music: CheckButton = get_node("PauseOverlay/HBoxContainer/VBoxContainer/CheckMusic")
onready var check_effects: CheckButton = get_node("PauseOverlay/HBoxContainer/VBoxContainer/CheckEffects")

const DIED_MESSAGE: = "GAME OVER"

var paused: = false setget set_paused
var pause_counter = 0


func _ready():
	if TrackPlayer.is_playing_music == true:
		check_music.pressed = true
	elif TrackPlayer.is_playing_music == false:
		check_music.pressed = false
	if TrackPlayer.is_playing_effects == true:
		check_effects.pressed = true
	elif TrackPlayer.is_playing_effects == false:
		check_effects.pressed = false
	health.text = "SALUTE:"
	PlayerData.connect("score_updated", self, "update_interface")
	PlayerData.connect("player_died", self, "_on_PlayerData_player_died")
	PlayerData.connect("game_resumed", self, "on_game_resumed")
	HealthBar.connect("food_picked", self, "increase_health_bar")
	HealthBar.connect("enemy_collided", self, "decrease_health_bar")
	update_interface()


func _on_PlayerData_player_died():
	get_tree().change_scene_to(load('res://src/Screens/EndScreen.tscn'))


func _unhandled_input(event):
	if event.is_action_pressed("pause") and  pause_title.text != DIED_MESSAGE:
		pause_counter += 1
		if pause_counter % 2 == 0:
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		self.paused = not paused
		scene_tree.set_input_as_handled()


func update_interface():
	score.text = "PUNTEGGIO: %s" % PlayerData.score
	if(health_bar.value == 33):
		health_bar.get("custom_styles/fg").bg_color = Color(255, 0, 0)
	if(health_bar.value == 66):
		health_bar.get("custom_styles/fg").bg_color = Color(255, 255, 0)
	elif(health_bar.value == 100):
		health_bar.get("custom_styles/fg").bg_color = Color(0, 255, 0)


func on_game_resumed():
	pause_counter -= 1
	self.paused = not paused
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func increase_health_bar():
	if HealthBar.enemy_counter == 0:
		health_bar.value = 100
	elif HealthBar.enemy_counter == 1:
		health_bar.value = 66
	elif HealthBar.enemy_counter == 2:
		health_bar.value = 33
	update_interface()


func decrease_health_bar():
	if HealthBar.enemy_counter == 1:
		health_bar.value = 66
	elif HealthBar.enemy_counter == 2:
		health_bar.value = 33
	update_interface()

func set_paused(value: bool):
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
