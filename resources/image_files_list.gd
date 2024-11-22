extends Resource

class_name ImageFilesList

@export var files_names: Array[String]

func add_filename(fn: String) -> void:
	files_names.append(fn)
	
func get_file_names() -> Array[String]:
	return files_names
