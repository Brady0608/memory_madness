extends Control
@onready var moves_lable: Label = $NinePatchRect/MarginContainer/VBoxContainer/MovesLable


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_game_over.connect(on_game_over)
	SignalManager.on_game_exit_pressed.connect(on_game_exit_pressed)
	
func on_game_over(moves: int) -> void:
	moves_lable.text = "You took %d moves" % moves
	show()

func  on_game_exit_pressed() -> void:
	hide()
