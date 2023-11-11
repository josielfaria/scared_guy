extends Node

signal life_signal
signal player_hurt_signal
signal player_died_signal

const MAX_LIFE = 3
const GAME_OVER = "res://scenes/resources/GameOver.tscn"

var life = MAX_LIFE

func reset_life():
	life = MAX_LIFE
	life_signal.emit(life)

func lost_life():
	life -= 1
	if life <= 0: 
		player_died_signal.emit()
		get_tree().change_scene_to_file(GAME_OVER)
	else:
		life_signal.emit(life)
		player_hurt_signal.emit()

func gain_life():
	life += 1
	life_signal.emit(life)
