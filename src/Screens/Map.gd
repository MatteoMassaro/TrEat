extends Node2D

onready var Star1Level1: TextureRect = get_node("CanvasLayer/Star1Level1")
onready var Star2Level1: TextureRect = get_node("CanvasLayer/Star2Level1")
onready var Star3Level1: TextureRect = get_node("CanvasLayer/Star3Level1")
onready var Star1Level2: TextureRect = get_node("CanvasLayer/Star1Level2")
onready var Star2Level2: TextureRect = get_node("CanvasLayer/Star2Level2")
onready var Star3Level2: TextureRect = get_node("CanvasLayer/Star3Level2")
onready var Star1Level3: TextureRect = get_node("CanvasLayer/Star1Level3")
onready var Star2Level3: TextureRect = get_node("CanvasLayer/Star2Level3")
onready var Star3Level3: TextureRect = get_node("CanvasLayer/Star3Level3")
onready var Star1Level4: TextureRect = get_node("CanvasLayer/Star1Level4")
onready var Star2Level4: TextureRect = get_node("CanvasLayer/Star2Level4")
onready var Star3Level4: TextureRect = get_node("CanvasLayer/Star3Level4")

onready var Star1Level1Empty: TextureRect = get_node("CanvasLayer/Star1Level1Empty")
onready var Star2Level1Empty: TextureRect = get_node("CanvasLayer/Star2Level1Empty")
onready var Star3Level1Empty: TextureRect = get_node("CanvasLayer/Star3Level1Empty")
onready var Star1Level2Empty: TextureRect = get_node("CanvasLayer/Star1Level2Empty")
onready var Star2Level2Empty: TextureRect = get_node("CanvasLayer/Star2Level2Empty")
onready var Star3Level2Empty: TextureRect = get_node("CanvasLayer/Star3Level2Empty")
onready var Star1Level3Empty: TextureRect = get_node("CanvasLayer/Star1Level3Empty")
onready var Star2Level3Empty: TextureRect = get_node("CanvasLayer/Star2Level3Empty")
onready var Star3Level3Empty: TextureRect = get_node("CanvasLayer/Star3Level3Empty")
onready var Star1Level4Empty: TextureRect = get_node("CanvasLayer/Star1Level4Empty")
onready var Star2Level4Empty: TextureRect = get_node("CanvasLayer/Star2Level4Empty")
onready var Star3Level4Empty: TextureRect = get_node("CanvasLayer/Star3Level4Empty")


func _ready():
	TrackPlayer.music_track = load ("res://assets/user interface/Music/ES_Glimmer - AGST.mp3")
	if TrackPlayer.flagMusic == 0 && TrackPlayer.is_playing_music == false:
		TrackPlayer.play_music()
	if LevelData.starsLevel1 == 0:
		Star1Level1Empty.visible = true
		Star2Level1Empty.visible = true
		Star3Level1Empty.visible = true
	if LevelData.starsLevel1 == 1:
		Star1Level1.visible = true
		Star2Level1Empty.visible = true
		Star3Level1Empty.visible = true
	if LevelData.starsLevel1 == 2:
		Star1Level1.visible = true
		Star2Level1.visible = true
		Star3Level1Empty.visible = true
	if LevelData.starsLevel1 == 3:
		Star1Level1.visible = true
		Star2Level1.visible = true
		Star3Level1.visible = true
	if LevelData.starsLevel2 == 0:
		Star1Level2Empty.visible = true
		Star2Level2Empty.visible = true
		Star3Level2Empty.visible = true
	if LevelData.starsLevel2 == 1:
		Star1Level2.visible = true
		Star2Level2Empty.visible = true
		Star3Level2Empty.visible = true
	if LevelData.starsLevel2 == 2:
		Star1Level2.visible = true
		Star2Level2.visible = true
		Star3Level2Empty.visible = true
	if LevelData.starsLevel2 == 3:
		Star1Level2.visible = true
		Star2Level2.visible = true
		Star3Level2.visible = true
	if LevelData.starsLevel3 == 0:
		Star1Level3Empty.visible = true
		Star2Level3Empty.visible = true
		Star3Level3Empty.visible = true
	if LevelData.starsLevel3 == 1:
		Star1Level3.visible = true
		Star2Level3Empty.visible = true
		Star3Level3Empty.visible = true
	if LevelData.starsLevel3 == 2:
		Star1Level3.visible = true
		Star2Level3.visible = true
		Star3Level3Empty.visible = true
	if LevelData.starsLevel3 == 3:
		Star1Level3.visible = true
		Star2Level3.visible = true
		Star3Level3.visible = true
	if LevelData.starsLevel4 == 0:
		Star1Level4Empty.visible = true
		Star2Level4Empty.visible = true
		Star3Level4Empty.visible = true
	if LevelData.starsLevel4 == 1:
		Star1Level4.visible = true
		Star2Level4Empty.visible = true
		Star3Level4Empty.visible = true
	if LevelData.starsLevel4 == 2:
		Star1Level4.visible = true
		Star2Level4.visible = true
		Star3Level4Empty.visible = true
	if LevelData.starsLevel4 == 3:
		Star1Level4.visible = true
		Star2Level4.visible = true
		Star3Level4.visible = true
