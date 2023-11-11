extends Node2D

var level1 = "res://scenes/levels/Level1.tscn"
var records = "res://scenes/resources/Records.tscn"

func _on_start_button_released():
	get_tree().change_scene_to_file(level1)

func _on_record_button_released():
	get_tree().change_scene_to_file(records)

func _on_quit_button_released():
	get_tree().quit()
