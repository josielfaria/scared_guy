extends Node

class_name Enums

enum DIRECTION { UP, DOWN, LEFT, RIGHT }

const MOVEMENT = {
	INIT = Vector2(0, 0),
	UP = Vector2(0, -1),
	DOWN = Vector2(0, 1),
	LEFT = Vector2(-1, 0),
	RIGHT = Vector2(1, 0)
}
