extends Control

const MEMORY_TILE = preload("res://scenes/memory_tile/memory_tile.tscn")
# Called when the node enters the scene tree for the first time.
@onready var tiles_container: GridContainer = $HB/MarginContainer/TilesContainer
@onready var scorer = $Scorer
@onready var label_moves: Label = $HB/MarginContainer2/VBoxContainer/HBoxContainer/LabelMoves
@onready var label_pairs: Label = $HB/MarginContainer2/VBoxContainer/HBoxContainer2/LabelPairs


func _ready() -> void:
	SignalManager.on_level_selected.connect(on_level_selected)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label_moves.text = scorer.get_moves_made_string()
	label_pairs.text = scorer.get_pairs_made_string()
	
	
func add_memory_tile(item_image: ItemImage, frame: Texture2D) -> void:
	var new_tile: MemoryTile = MEMORY_TILE.instantiate()
	tiles_container.add_child(new_tile)
	new_tile.setup(item_image, frame)
	
	
	
func on_level_selected(level_num: int) -> void:
	var level_data: SelectedLevelData = GameManager.get_level_selection(level_num)
	var frame: Texture2D = ImageManager.get_random_frame_image()
	
	tiles_container.columns = level_data.get_num_cols()
	for image in level_data.get_selected_level_image():
		add_memory_tile(image, frame)
	scorer.clear_new_game(level_data.get_target_pairs())
	


func _on_exit_button_pressed() -> void:
	for tile in tiles_container.get_children():
		tile.queue_free()
	SignalManager.on_game_exit_pressed.emit()
