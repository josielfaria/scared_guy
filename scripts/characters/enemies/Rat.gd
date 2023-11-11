extends CharacterBody2D

@export var direction: Enums.DIRECTION = Enums.DIRECTION.LEFT
@export var stay_on_map = false

@onready var animation_enemy = $AnimationEnemy
@onready var collision_shape_2d = $CollisionShape2D

const SPEED = 600

var direction_movement = Vector2(0, 0)
var is_walk = false

func _ready():
	config_direction()
	config_collision()

func _physics_process(_delta):
	verify_movement()

func config_collision():
	if not stay_on_map:
		collision_shape_2d.queue_free()

func config_direction():
	match direction:
		Enums.DIRECTION.UP: 
			rotation_degrees = 180
			direction_movement.y = -1
		Enums.DIRECTION.DOWN: 
			rotation_degrees = 0
			direction_movement.y = 1
		Enums.DIRECTION.LEFT: 
			rotation_degrees = 90
			direction_movement.x = -1
		Enums.DIRECTION.RIGHT: 
			rotation_degrees = -90
			direction_movement.x = 1

func verify_movement():
		velocity = direction_movement * SPEED
		if stay_on_map:
			if is_on_wall():
				if direction == Enums.DIRECTION.LEFT:
					position.x += 10
					direction = Enums.DIRECTION.RIGHT
				else: 
					position.x -= 10
					direction = Enums.DIRECTION.LEFT
			elif is_on_ceiling():
				direction = Enums.DIRECTION.DOWN
			elif is_on_floor():
				direction = Enums.DIRECTION.UP
			config_direction()
		move_and_slide()


func _on_deadly_line_area_2d_area_entered(_area):
	queue_free()
