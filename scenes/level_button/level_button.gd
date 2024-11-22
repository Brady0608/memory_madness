extends TextureButton

@export var level_number: int = 1

@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var level_data: LevelData = GameManager.get_level_data(level_number)
	label.text = "%dx%d" %[
		level_data.get_cols(),
		level_data.get_rows()
	]
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
