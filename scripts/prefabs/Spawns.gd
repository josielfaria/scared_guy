extends Node2D

@onready var spawns_up = $Spawns_Up
@onready var spawns_down = $Spawns_Down
@onready var spawns_left = $Spawns_Left
@onready var spawns_right = $Spawns_Right
@onready var spawn_timer = $SpawnTimer

const COUNT_SPAWNS_UP = 4
const COUNT_SPAWNS_DOWN = 4
const COUNT_SPAWNS_LEFT = 2
const COUNT_SPAWNS_RIGHT = 2

var enemy = preload("res://scenes/characters/enemies/Rat.tscn")
var count_timer_spawn = 2.0

func _ready():
	spawn_timer.start()

func spawn_enemy():
	var spawn_point: Marker2D
	var enemy_instance = enemy.instantiate()
	var count_direction = get_range_directions()
	var count_range_spawn = 0 
	match count_direction: 
		Enums.DIRECTION.UP:
			count_range_spawn = get_range_number(COUNT_SPAWNS_UP)
			spawn_point = spawns_up.get_child(count_range_spawn)
			enemy_instance.direction = Enums.DIRECTION.DOWN
		Enums.DIRECTION.DOWN:
			count_range_spawn = get_range_number(COUNT_SPAWNS_DOWN)
			spawn_point = spawns_down.get_child(count_range_spawn)
			enemy_instance.direction = Enums.DIRECTION.UP
		Enums.DIRECTION.LEFT:
			count_range_spawn = get_range_number(COUNT_SPAWNS_LEFT)
			spawn_point = spawns_left.get_child(count_range_spawn)
			enemy_instance.direction = Enums.DIRECTION.RIGHT
		Enums.DIRECTION.RIGHT:
			count_range_spawn = get_range_number(COUNT_SPAWNS_RIGHT)
			spawn_point = spawns_right.get_child(count_range_spawn)
			enemy_instance.direction = Enums.DIRECTION.LEFT
	enemy_instance.position = spawn_point.position
	add_child(enemy_instance) 

func get_range_number(count) -> int:
	return randi_range(0, (count-1))

func get_range_directions() -> int:
	return randi_range(0, 3)

func decrement_timer():
	if count_timer_spawn >= 0.6:
		count_timer_spawn -= 0.01
		spawn_timer.wait_time = count_timer_spawn
	print(count_timer_spawn)

func _on_spawn_timer_timeout():
	spawn_enemy()
	decrement_timer()
