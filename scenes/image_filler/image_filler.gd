@tool

extends Node

const PATH: String = "res://assets/glitch/"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var dir: DirAccess = DirAccess.open(PATH)
	var ifl = ImageFilesList.new()
	
	if dir:
		var files: PackedStringArray = dir.get_files()
		
		for fn in files:
			if !'.import' in fn:
				ifl.add_filename(PATH + fn)
		ResourceSaver.save(ifl,"res://resources/image_file_list.tres")
		
 
