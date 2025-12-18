extends Node2D

const FILE_NAME = "data.save"

var path : String
var second_path : String

var draggable = false
var dragging_start_position = Vector2()

func _ready():
	path = OS.get_user_data_dir()
	print(path)
	second_path = path.replace("GameB", "GameA/")
	print(second_path)
	
func _process(delta):
	if FileAccess.file_exists(second_path + FILE_NAME):
		var file = FileAccess.open(second_path + FILE_NAME, FileAccess.READ)
		var loaded_var = file.get_var()
		$GPUParticles2D.emitting = loaded_var

func _on_handle_bar_gui_input(event):
	if event is InputEventMouseButton:
		draggable = !draggable
		print(draggable)
		dragging_start_position = get_global_mouse_position()
	if draggable and event is InputEventMouseMotion:
		var mouse_position = get_global_mouse_position()
		var window_position = Vector2(DisplayServer.window_get_position())
		DisplayServer.window_set_position(window_position + (mouse_position - dragging_start_position))


