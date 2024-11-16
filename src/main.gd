extends Control

@export var FirstLevelPath: PackedScene

@onready var LoadingManager := $"/root/LoadingManager"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	LoadingManager.load_scene(FirstLevelPath.resource_path)
	pass # Replace with function body.
