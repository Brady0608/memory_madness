extends Node

var _levels: Dictionary = {
	1: LevelData.new(1, 2, 2),
	2: LevelData.new(2, 3, 4),
	3: LevelData.new(3, 4, 4),
	4: LevelData.new(4, 4, 6),
	5: LevelData.new(5, 6, 6),
	6: LevelData.new(6, 6, 7),
}

func get_level_data(level_number: int) -> LevelData:
	return _levels[level_number]

func get_level_count() -> int:
	return _levels.keys().size()

func get_level_selection(level_num: int) -> SelectedLevelData:
	var level_data: LevelData = get_level_data(level_num)
	var target_pairs: int = level_data.get_target_pairs()
	var num_cols: int = level_data.get_cols()
	var selected_level_image: Array[ItemImage] = []
	
	ImageManager.shuffle_images()
	
	for i in range(target_pairs):
		selected_level_image.append(ImageManager.get_image(i))
		selected_level_image.append(ImageManager.get_image(i))
	
	selected_level_image.shuffle()
	
	return SelectedLevelData.new(target_pairs, num_cols, selected_level_image)
