extends TextureButton


var _item_name: String
var _can_select_me: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func reveal_image(status: bool) -> void:
	$FrameImage.visible = status
	$ItemImage.visible = status


func setup(image: ItemImage, frame: Texture2D) -> void:
	$FrameImage.texture = frame
	$ItemImage.texture = image.get_item_texture()
	_item_name = image.get_item_name()
	
	reveal_image(false)


func _on_pressed() -> void:
	if _can_select_me == true:
		reveal_image(true)
