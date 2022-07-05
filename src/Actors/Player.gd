extends Actor

export var stomp_impulse: = 800.0
onready var _animated_sprite = $AnimatedSprite
onready var sound_player = $FootSound


func _on_EnemyDetector_area_entered(area):
	_velocity = calculate_stomp_velocity(_velocity, stomp_impulse)


func _on_EnemyDetector_body_entered(body):
	if TrackPlayer.flagEffects == 0:
		TrackPlayer.effect_track = load("res://assets/user interface/kenney_interfacesounds/Audio/error_006.ogg")
		TrackPlayer.play_effect()
	HealthBar.enemy_collided()
	if(HealthBar.enemy_counter == 3):
		die()


func _process(_delta):
	if Input.is_action_pressed("move_right"):
		if not TrackPlayer.effects_player.playing:
			if TrackPlayer.flagEffects == 0:
				TrackPlayer.steps_track = load("res://assets/user interface/kenney_impactsounds/Audio/footstep_grass.mp3")
				TrackPlayer.play_steps()
		_animated_sprite.flip_h = false
		_animated_sprite.play("run")
	elif Input.is_action_pressed("move_left"):
		if not TrackPlayer.effects_player.playing:
			if TrackPlayer.flagEffects == 0:
				TrackPlayer.steps_track = load("res://assets/user interface/kenney_impactsounds/Audio/footstep_grass.mp3")
				TrackPlayer.play_steps()
		_animated_sprite.flip_h = true
		_animated_sprite.play("run")
	elif Input.is_action_pressed("jump"):
		_animated_sprite.play("jump")
	else:
		TrackPlayer.stop_steps()
		_animated_sprite.stop()
		_animated_sprite.frame = 0


func _physics_process(delta):
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	if PlayerData.player_entered_portal == false:
		var direction: = get_direction()
		_velocity = calculate_and_move_velocity(_velocity, direction, speedPlayer, is_jump_interrupted)
		_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	else:
		TrackPlayer.stop_steps()
		_animated_sprite.stop()
		_animated_sprite.frame = 0


func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 0.0 
	)


func calculate_and_move_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	speed: Vector2,
	is_jump_interrupted: bool
	) -> Vector2:
	var out: = linear_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		out.y = speedPlayer.y * direction.y
	if is_jump_interrupted:
		out.y = 0.0
	return out


func calculate_stomp_velocity(linear_velocity: Vector2, impulse: float) -> Vector2:
	var out: = linear_velocity
	out.y = -impulse
	return out


func die():
	PlayerData.deaths += 1
	queue_free()
	TrackPlayer.stop_steps()
	TrackPlayer.stop_music()
	if TrackPlayer.flagMusic == 0:
		TrackPlayer.music_track = load("res://assets/user interface/Music/mixkit-funny-fail-low-tone-2876.wav")
		TrackPlayer.play_music()

