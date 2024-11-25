extends Control

const MEMORY_TILE = preload("res://scenes/memory_tile/memory_tile.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_level_selected.connect(on_level_selected)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func on_level_selected(level_num: int) -> void:
	print(level_num)


func _on_exit_button_pressed() -> void:
	SignalManager.on_game_exit_pressed.emit()
