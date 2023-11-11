extends Node

const FILE_PATH = "user://database.cfg"
var config = ConfigFile.new()
var records = []

func _ready():
	load_data()

func load_data():
	var data_loaded = config.load(FILE_PATH)
	if data_loaded == OK:
		records = config.get_value("records_section", 'records')
		print("<---DB---> CARREGOU DATA: ", records)
	else: 
		print("<---DB---> NÃO CARREGOU DATA")
#		save_data("load_data")

func save_data(record):
	config_records_to_save(record)
	config.set_value("records_section", "records", records)
	config.save(FILE_PATH)
	print("<---DB---> SALVOU DATA: ", records)

func config_records_to_save(record):
	records.append(record)
	records.sort()
	records = records.slice(0, 10)
	print(records)
