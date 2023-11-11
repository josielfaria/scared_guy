extends Node2D

@onready var record_label = $CanvasLayer/RecordLabel

var can_redirect_menu = false
var menu = "res://scenes/resources/Menu.tscn"

func _ready():
	record_label.text = RecordManager.record_score
	wait_timer_redirect()

func wait_timer_redirect():
	await get_tree().create_timer(2.0).timeout
	can_redirect_menu = true

func _process(delta):
	if can_redirect_menu:
		if Input.is_action_just_released("btn_action"):
			get_tree().change_scene_to_file(menu)
