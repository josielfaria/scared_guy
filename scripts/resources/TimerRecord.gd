extends Control

@onready var timer_label = $TimerLabel

var timer_running = false
var elapsed_time = 0 # 59m55seg = 3595

func _ready():
	PlayerManager.connect("player_died_signal", save_record)
	update_clock_label()
	timer_running = true

func _process(delta):
	if timer_running:
		elapsed_time += delta
		update_clock_label()

func update_clock_label():
	var total_seconds = int(elapsed_time)
	var hours = int(total_seconds / 3600)
	var minutes = int((total_seconds % 3600) / 60)
	var seconds = total_seconds % 60

	var formatted_time = "%02d:%02d:%02d" % [hours, minutes, seconds]
	timer_label.text = formatted_time

func save_record():
	timer_running = false
	RecordManager.save_record(elapsed_time)

