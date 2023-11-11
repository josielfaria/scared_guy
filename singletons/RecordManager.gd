extends Node

var record_score = 0

func save_record(record):
	config_clock_label(record)
	Database.save_data(record)
# TODO: criar metodo para salvar record

func config_clock_label(record_time):
	var total_seconds = int(record_time)
	var hours = int(total_seconds / 3600)
	var minutes = int((total_seconds % 3600) / 60)
	var seconds = total_seconds % 60
	var formatted_time = "%02d:%02d:%02d" % [hours, minutes, seconds]
	record_score = formatted_time
