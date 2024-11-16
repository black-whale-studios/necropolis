extends Control


@onready var progress_bar: ProgressBar = $Panel/ProgressBar

signal loading_screen_ready

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loading_screen_ready.emit()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	pass

func update_progress_bar(progress: int):
	progress_bar.set_value_no_signal(progress * 100)
	pass

func load_done():
	self.queue_free()
	pass
