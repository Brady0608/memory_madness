extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show_game(false)
	SignalManager.on_game_exit_pressed.connect(on_game_exit_pressed)
	SignalManager.on_level_selected.connect(on_level_selected)
	

func show_game(status: bool) -> void:
	$Game.visible = status
	$Main.visible = !status


func  on_game_exit_pressed() -> void:
	show_game(false)

func on_level_selected(level_num: int) -> void:
	show_game(true)
