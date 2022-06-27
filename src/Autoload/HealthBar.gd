extends Node

signal food_picked
signal enemy_collided

var enemy_counter = 0

func food_picked():
	if(enemy_counter > 0):
		enemy_counter -= 1
	emit_signal("food_picked")


func enemy_collided():
	enemy_counter += 1
	emit_signal("enemy_collided")
