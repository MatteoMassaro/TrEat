extends Control

onready var game_over_title: RichTextLabel = get_node("GameOver")
onready var level_completed_title: RichTextLabel = get_node("LevelCompleted")
onready var score: Label = get_node("Score")
onready var text_lost: Label = get_node("YouLost")
onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")
onready var anim_player2: AnimationPlayer = get_node("AnimationPlayer2")
onready var anim_player3: AnimationPlayer = get_node("AnimationPlayer3")
onready var anim_player4: AnimationPlayer = get_node("AnimationPlayer4")
onready var anim_player5: AnimationPlayer = get_node("AnimationPlayer5")
onready var anim_player6: AnimationPlayer = get_node("AnimationPlayer6")
onready var star1_empty: TextureRect = get_node("Star1Empty")
onready var star2_empty: TextureRect = get_node("Star2Empty")
onready var star3_empty: TextureRect = get_node("Star3Empty")


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	score.text = score.text % [PlayerData.score]
	if HealthBar.enemy_counter < 3:
		game_over_title.visible = false
		level_completed_title.visible = true
		if TrackPlayer.flagMusic == 0:
			TrackPlayer.music_track = load("res://assets/user interface/Music/mixkit-game-level-completed-2059.wav")
			TrackPlayer.play_music()
		yield(get_tree().create_timer(0.5),"timeout")
		score.visible = true
		if PlayerData.score >= 8000:
			anim_player.play("star1_show")
			anim_player2.play("star2_show")
			anim_player3.play("star3_show")
			yield(get_tree().create_timer(0.6),"timeout")
			anim_player4.play("star1_pulse")
			anim_player5.play("star2_pulse")
			anim_player6.play("star3_pulse")
			if LevelData.level1 == true && LevelData.highScorelevel1 < PlayerData.score:
				LevelData.starsLevel1 = 3
				LevelData.highScorelevel1 = PlayerData.score
			elif LevelData.level2 == true && LevelData.highScorelevel2 < PlayerData.score:
				LevelData.starsLevel2 = 3
				LevelData.highScorelevel2 = PlayerData.score
			elif LevelData.level3 == true && LevelData.highScorelevel3 < PlayerData.score:
				LevelData.starsLevel3 = 3
				LevelData.highScorelevel3 = PlayerData.score
			elif LevelData.level4 == true && LevelData.highScorelevel4 < PlayerData.score:
				LevelData.starsLevel4 = 3
				LevelData.highScorelevel4 = PlayerData.score
		elif PlayerData.score >= 5000:
			anim_player.play("star1_show")
			anim_player2.play("star2_show")
			yield(get_tree().create_timer(0.8),"timeout")
			star3_empty.visible = true
			anim_player4.play("star1_pulse")
			anim_player5.play("star2_pulse")
			if LevelData.level1 == true && LevelData.highScorelevel1 < PlayerData.score:
				LevelData.starsLevel1 = 2
				LevelData.highScorelevel1 = PlayerData.score
			elif LevelData.level2 == true && LevelData.highScorelevel2 < PlayerData.score:
				LevelData.starsLevel2 = 2
				LevelData.highScorelevel2 = PlayerData.score
			elif LevelData.level3 == true && LevelData.highScorelevel3 < PlayerData.score:
				LevelData.starsLevel3 = 2
				LevelData.highScorelevel3 = PlayerData.score
			elif LevelData.level4 == true && LevelData.highScorelevel4 < PlayerData.score:
				LevelData.starsLevel4 = 2
				LevelData.highScorelevel4 = PlayerData.score
		elif PlayerData.score > 0:
			anim_player.play("star1_show")
			yield(get_tree().create_timer(0.8),"timeout")
			star2_empty.visible = true
			anim_player4.play("star1_pulse")
			yield(get_tree().create_timer(0.3),"timeout")
			star3_empty.visible = true
			if LevelData.level1 == true && LevelData.highScorelevel1 < PlayerData.score:
				LevelData.starsLevel1 = 1
				LevelData.highScorelevel1 = PlayerData.score
			elif LevelData.level2 == true && LevelData.highScorelevel2 < PlayerData.score:
				LevelData.starsLevel2 = 1
				LevelData.highScorelevel2 = PlayerData.score
			elif LevelData.level3 == true && LevelData.highScorelevel3 < PlayerData.score:
				LevelData.starsLevel3 = 1
				LevelData.highScorelevel3 = PlayerData.score
			elif LevelData.level4 == true && LevelData.highScorelevel4 < PlayerData.score:
				LevelData.starsLevel4 = 1
				LevelData.highScorelevel4 = PlayerData.score
		elif PlayerData.score == 0:
			yield(get_tree().create_timer(0.3),"timeout")
			star1_empty.visible = true
			yield(get_tree().create_timer(0.3),"timeout")
			star2_empty.visible = true
			yield(get_tree().create_timer(0.3),"timeout")
			star3_empty.visible = true
			if LevelData.level1 == true && LevelData.highScorelevel1 < PlayerData.score:
				LevelData.starsLevel1 = 0
				LevelData.highScorelevel1 = PlayerData.score
			elif LevelData.level2 == true && LevelData.highScorelevel2 < PlayerData.score:
				LevelData.starsLevel2 = 0
				LevelData.highScorelevel2 = PlayerData.score
			elif LevelData.level3 == true && LevelData.highScorelevel3 < PlayerData.score:
				LevelData.starsLevel3 = 0
				LevelData.highScorelevel3 = PlayerData.score
			elif LevelData.level4 == true && LevelData.highScorelevel4 < PlayerData.score:
				LevelData.starsLevel4 = 0
				LevelData.highScorelevel4 = PlayerData.score
	else:
		score.visible = false
		text_lost.visible = true
		yield(get_tree().create_timer(0.3),"timeout")
		star1_empty.visible = true
		yield(get_tree().create_timer(0.3),"timeout")
		star2_empty.visible = true
		yield(get_tree().create_timer(0.3),"timeout")
		star3_empty.visible = true
	TrackPlayer.is_playing_music = false
