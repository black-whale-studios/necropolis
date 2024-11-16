extends Node

@onready var _load_screen_scene = preload("res://src/loading_manager/loading_screen.tscn")

var _current_load_screen: Node
var _loaded_resource: PackedScene
var _request_scene: String
var _progress: Array[float]
var _is_loading: bool

func _process(_delta: float) -> void:
	if !_is_loading:
		return
	
	var status = ResourceLoader.load_threaded_get_status(_request_scene, _progress)
	match status:
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			_current_load_screen.update_progress_bar(_progress[0])# Change the ProgressBar value
		ResourceLoader.THREAD_LOAD_LOADED:
			_is_loading = false
			_current_load_screen.load_done()
			_loaded_resource = ResourceLoader.load_threaded_get(_request_scene)
			get_tree().change_scene_to_packed(_loaded_resource)
		ResourceLoader.THREAD_LOAD_FAILED:
			_is_loading = false
			print("Error. Could not load Resource")
	pass

func _ready() -> void:
	_is_loading = false
	pass



func load_scene(scene_path: String):
	_request_scene = scene_path
	_current_load_screen = _load_screen_scene.instantiate()
	get_tree().get_root().add_child(_current_load_screen)
	
	
	var state = ResourceLoader.load_threaded_request(_request_scene, "", false)
	if state == OK:
		_is_loading = true
	pass
