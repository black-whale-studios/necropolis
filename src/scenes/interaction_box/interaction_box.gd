class_name InteractionBox
extends Node3D

@export var interaction_descripion: String
@export var interaction_script: NodePath

var _interaction_script
var _node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_node = get_node(interaction_script)
	if !_node.has_method("interact"):
		assert(false, "interact method not present on script")
		pass
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func interact():
	_node.interact()
	pass
