extends Node2D

@onready var lifebar = $"."

var life = 0

func _ready():
	PlayerManager.connect("life_signal", set_life)
	
func set_life(life_param):
	life = life_param
	hide_lifes()

func hide_lifes():
	for current_life in PlayerManager.MAX_LIFE:
		if current_life > life - 1:
			lifebar.get_child(current_life + 1).hide()

