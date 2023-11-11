extends CanvasModulate

@onready var hurt_screen = $"."

func _ready():
	hurt_screen.hide()
	PlayerManager.connect("player_hurt_signal", show_effect)

func show_effect():
	hurt_screen.show()
	await get_tree().create_timer(.2).timeout
	hurt_screen.hide()
