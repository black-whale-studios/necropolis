extends CharacterBody3D

@onready var camera := $Camera3D

@export var speed := 5.0
@export var jump_force := 8.0
@export var sensitivity := 0.2

var pitch := 0.0              # To track vertical camera rotation (pitch)

func _ready():
	# Capture the mouse to keep it in the window
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event):
	# Toggle mouse capture with ESC
	if event is InputEventKey and event.keycode == KEY_ESCAPE and event.pressed:
		Input.mouse_mode = (
			Input.MOUSE_MODE_VISIBLE if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED
			else Input.MOUSE_MODE_CAPTURED
		)

func _process(delta):
	handle_movement(delta)
	handle_look_around()

func handle_movement(delta):

	var direction := Vector3.ZERO
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
	if Input.is_action_pressed("move_backward"):
		direction.z += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1


	direction = direction.normalized()
	var horizontal_velocity = direction * speed
	horizontal_velocity = transform.basis * horizontal_velocity

	if not is_on_floor():
		velocity.y -= 20.0 * delta
	else:
		velocity.y = 0
		if Input.is_action_just_pressed("jump"):
			velocity.y += jump_force

	# Combine horizontal and vertical movement
	velocity.x = horizontal_velocity.x
	velocity.z = horizontal_velocity.z


	move_and_slide()

func handle_look_around():
	# Capture mouse movement for look around
	var mouse_delta := Input.get_last_mouse_velocity()
	
	# Rotate horizontally based on yaw
	rotation.y -= mouse_delta.x * sensitivity * 0.01
	
	# Adjust pitch (up and down look) and clamp
	pitch -= mouse_delta.y * sensitivity * 0.01
	pitch = clamp(pitch, deg_to_rad(-89), deg_to_rad(89))
	
	# Apply pitch rotation to the camera
	camera.rotation.x = pitch
