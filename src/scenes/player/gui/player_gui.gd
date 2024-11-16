extends Control

@onready var interaction_description_label := $InteractionDescriptionLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_interaction_description(description: String):
	interaction_description_label.text = "Press E to " + description
	pass
	
func show_interaction_description():
	
	pass
