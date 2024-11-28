extends Control

# Theme colors
var neon_blue = Color("#00f3ff")
var dark_bg = Color("#0a0a12")
var accent_color = Color("#ff00dd")
var text_color = Color("#ffffff")

func _ready():
	# Create theme
	var theme = Theme.new()
	
	# Style for panels
	var panel_style = StyleBoxFlat.new()
	panel_style.set_bg_color(dark_bg)
	panel_style.set_border_width_all(2)
	panel_style.set_border_color(neon_blue)
	panel_style.set_corner_radius_all(5)
	panel_style.set_shadow_size(10)
	panel_style.set_shadow_color(Color(neon_blue.r, neon_blue.g, neon_blue.b, 0.3))
	theme.set_stylebox("panel", "Panel", panel_style)
	
	# Style for buttons
	var button_normal = StyleBoxFlat.new()
	button_normal.set_bg_color(dark_bg)
	button_normal.set_border_width_all(2)
	button_normal.set_border_color(neon_blue)
	button_normal.set_corner_radius_all(3)
	theme.set_stylebox("normal", "Button", button_normal)
	
	var button_hover = button_normal.duplicate()
	button_hover.set_bg_color(neon_blue.darkened(0.8))
	theme.set_stylebox("hover", "Button", button_hover)
	
	var button_pressed = button_normal.duplicate()
	button_pressed.set_bg_color(neon_blue.darkened(0.6))
	theme.set_stylebox("pressed", "Button", button_pressed)
	
	# Style for progress bars
	var progress_bg = StyleBoxFlat.new()
	progress_bg.set_bg_color(dark_bg)
	progress_bg.set_border_width_all(1)
	progress_bg.set_border_color(neon_blue)
	theme.set_stylebox("background", "ProgressBar", progress_bg)
	
	var progress_fill = StyleBoxFlat.new()
	progress_fill.set_bg_color(neon_blue)
	theme.set_stylebox("fill", "ProgressBar", progress_fill)
	
	# Font settings
	var default_font = ThemeDB.fallback_font
	theme.set_font_size("font_size", "Label", 16)
	theme.set_color("font_color", "Label", text_color)
	
	# Apply theme to the root control
	self.theme = theme
	
	# Create the UI after setting the theme
	create_sample_ui()

# Example UI elements
func create_sample_ui():
	# Main container
	var container = VBoxContainer.new()
	add_child(container)
	container.set_anchors_and_offsets_preset(PRESET_FULL_RECT)
	
	# Header panel
	var header = Panel.new()
	container.add_child(header)
	header.custom_minimum_size = Vector2(0, 60)
	
	var header_label = Label.new()
	header.add_child(header_label)
	header_label.text = "FUTURISTIC INTERFACE"
	header_label.set_anchors_and_offsets_preset(PRESET_CENTER)
	
	# Content panel
	var content = Panel.new()
	container.add_child(content)
	content.size_flags_vertical = Control.SIZE_EXPAND_FILL
	
	# Button container
	var button_container = HBoxContainer.new()
	content.add_child(button_container)
	button_container.set_anchors_and_offsets_preset(PRESET_BOTTOM_RIGHT)
	button_container.position = Vector2(20, -60)  # Positioned from bottom
	button_container.custom_minimum_size = Vector2(0, 40)
	
	# Add buttons
	var button1 = Button.new()
	button1.text = "INITIALIZE"
	button_container.add_child(button1)
	
	var button2 = Button.new()
	button2.text = "EXECUTE"
	button_container.add_child(button2)
	
	# Progress bar
	var progress = ProgressBar.new()
	content.add_child(progress)
	progress.set_anchors_and_offsets_preset(PRESET_CENTER)
	progress.position = Vector2(-150, 0)  # Center offset
	progress.custom_minimum_size = Vector2(300, 20)
	progress.value = 75
