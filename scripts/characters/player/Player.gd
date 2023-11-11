extends CharacterBody2D

@onready var animation_player = $AnimationPlayer
@onready var scared_damage_timer = $ScaredDamageTimer

const SPEED_RUN = 1000
const SPEED_WALK = 800

var speed = SPEED_WALK
var is_scared = false
var is_walk = false
var is_walk_scared = false

func _physics_process(_delta):
	verify_run()
	verify_move()
	verify_animation()

func verify_move():
	var direction = Input.get_vector("btn_left", "btn_right", "btn_up", "btn_down")
	velocity = direction * speed
	is_walk = direction
	verify_direction_sprite(direction)
	move_and_slide()

func verify_run():
	if is_scared: speed = SPEED_RUN
	else: speed = SPEED_WALK

func verify_direction_sprite(direction):
	if direction.x < 0 and direction.y < 0: rotation_degrees = 145 # up/left
	elif direction.x > 0 and direction.y < 0: rotation_degrees = -145 # up/right
	elif direction.x < 0 and direction.y > 0: rotation_degrees = 45 # down/left
	elif direction.x > 0 and direction.y > 0: rotation_degrees = -45 # down/right
	elif direction.y < 0: rotation_degrees = 180 # up
	elif direction.y > 0: rotation_degrees = 0 # down
	elif direction.x < 0: rotation_degrees = 90 # left
	elif direction.x > 0: rotation_degrees = -90 # right

func verify_animation():
	if is_walk and is_scared: set_animation("scared_walk")
	elif is_walk: set_animation("walk")
	elif is_scared: set_animation("scared")
	else: set_animation("idle")

func set_animation(anim):
	animation_player.play(anim)

func _on_scared_area_2d_area_entered(_area):
	scared_damage_timer.start()
	is_scared = true

func _on_scared_area_2d_area_exited(_area):
	scared_damage_timer.stop()
	is_scared = false

func _on_scared_damage_timer_timeout():
	PlayerManager.lost_life()
