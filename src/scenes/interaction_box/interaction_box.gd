extends Node3D

@export var interaction_descripion: String
@export var interaction_script: Script

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !interaction_script.has_method("interact"):
		assert(false, "interact method not present on script")
		pass
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():
	
	pass
