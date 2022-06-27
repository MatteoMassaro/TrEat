extends Area2D

onready var scene_tree: = get_tree()
onready var timer: Timer = get_node("Timer")
onready var dialog_rect: TextEdit = get_node("Dialog")
onready var text: RichTextLabel = get_node("Dialog/Text")
onready var press_space: RichTextLabel = get_node("Dialog/NextDialog")

export var dialogPath = ""
export (float) var textSpeed = 0.05

var dialog
var phraseNum = 0
var finished = false
var no_more_text = false


func _process(delta):
	press_space.visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		if finished:
			nextPhrase()
			if no_more_text == false && TrackPlayer.flagEffects == 0:
				TrackPlayer.effect_track = load("res://assets/user interface/kenney_interfacesounds/Audio/ES_Keyboard Typing 34 - SFX Producer.mp3")
				TrackPlayer.play_effect()
		else:
			text.visible_characters = len(text.text)


func getDialog():
	var f = File.new()
	assert(f.file_exists(dialogPath), "File path does not exist")
	f.open(dialogPath, File.READ)
	var json = f.get_as_text()
	var output = parse_json(json)
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return[]


func nextPhrase():
	if phraseNum >= len(dialog):
		no_more_text = true
		dialog_rect.visible = false
		return
	
	finished = false
	text.bbcode_text = dialog[phraseNum]["Text"]
	text.visible_characters = 0
	
	while text.visible_characters < len(text.text):
		text.visible_characters += 1
		timer.start()
		yield(timer, "timeout")

	finished = true
	TrackPlayer.stop_effect()
	phraseNum += 1
	return

func _on_body_entered(body):
	no_more_text = false
	if TrackPlayer.flagEffects == 0:
		TrackPlayer.effect_track = load("res://assets/user interface/kenney_interfacesounds/Audio/ES_Keyboard Typing 34 - SFX Producer.mp3")
		TrackPlayer.play_effect()
	phraseNum = 0
	dialog_rect.visible = true
	timer.wait_time = textSpeed
	dialog = getDialog()
	assert(dialog, "Dialog not found")
	nextPhrase()


func _on_body_exited(body):
	dialog_rect.visible = false
	TrackPlayer.stop_effect()
