extends CharacterBody3D

# Exported variables
@export var speed: float = 5.0
@export var detection_range: float = 10.0
@export var vision_angle: float = 0  # Vision cone angle in degrees
@export var ray_count_horizontal: int = 5  # Number of rays across the horizontal plane
@export var ray_count_vertical: int = 3    # Number of rays across the vertical plane

# Node paths
@export var player_path: NodePath


@onready var raycast_container := $VisionRayContainer

# Variables for internal use
var player: CharacterBody3D = null
var raycasts: Array = []

func _ready():
	if player_path:
		player = get_node(player_path)
	else:
		print("Player node not assigned. Please set 'player_path'.")
	
	_setup_rays()


func _process(delta: float):
	if not player:
		return
	
	if not is_on_floor():
		velocity.y -= 20.0 * delta
		
	if _is_player_detected():
		_rotate_towards_player()
		
		# Move towards the player
		var direction = (player.global_transform.origin - global_transform.origin).normalized()
		velocity = direction * speed


	# Apply the movement
	move_and_slide()

func _is_player_detected() -> bool:
	for ray in raycasts:
		if ray.is_colliding() and ray.get_collider() == player:
			return true
	return false

func _rotate_towards_player():
	# Calculate direction to the player
	var to_player = player.global_transform.origin

	# Smoothly rotate towards the target


func _setup_rays():
	# Configure ray positions and directions
	var angle_step_horizontal = vision_angle / max(ray_count_horizontal - 1, 1)
	var angle_step_vertical = vision_angle / max(ray_count_vertical - 1, 1)
	
	for i in range(ray_count_horizontal):
		for j in range(ray_count_vertical):
			var horizontal_angle = deg_to_rad(-vision_angle / 2 + angle_step_horizontal * i)
			var vertical_angle = deg_to_rad(-vision_angle / 2 + angle_step_vertical * j)
			
			# Calculate the direction of the ray
			var direction = Vector3(
				cos(horizontal_angle) * cos(vertical_angle),
				sin(vertical_angle),
				sin(horizontal_angle) * cos(vertical_angle)
			)
			
			var ray = RayCast3D.new()
			raycast_container.add_child(ray)
			ray.target_position = direction * detection_range
			ray.enabled = true

			raycasts.append(ray)
