extends Node3D

@export var character: RigidBody3D
@export var level_node: Node3D
@export var level_parent: Node3D

@export var mini_map_cam: Camera3D

var angle := 15.0
var spawn_position := Vector3.ZERO
var default_speed := 0.4

var rotaters: Array[Node3D] = []

func _ready() -> void:
	spawn_position = character.global_position
	GameEvents.reset_player_position.connect(on_reset_player_position)
	GameEvents.last_played_level = get_tree().current_scene.scene_file_path
	
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	GameEvents.level_completed.connect(level_completed)
	
	get_rotaters(level_node)
	
func _process(delta: float) -> void:
	controller_process()
	rotations_process(delta)
	
	if is_instance_valid(mini_map_cam):
		mini_map_cam.global_position.x = character.global_position.x
		mini_map_cam.global_position.z = character.global_position.z

var level_complete := false
func level_completed() -> void:
	level_complete = true

func controller_process() -> void:
	if level_complete: return
	
	var _rotate_x := 0.0
	var _rotate_z := 0.0
	var tilt_input := Vector2.ZERO
	var angle_factor := 1.0
	
	if Input.is_action_pressed("left"):
		_rotate_z = angle
		tilt_input.x = -1
		angle_factor = 0.0
	elif Input.is_action_pressed("right"):
		_rotate_z = -angle
		tilt_input.x = 1
		angle_factor = 0.0
	elif Input.is_action_pressed("back"):
		_rotate_x = angle
		tilt_input.y = -1
	elif Input.is_action_pressed("forward"):
		_rotate_x = -angle
		angle_factor = 1.5
		tilt_input.y = 1
	
	level_node.position = -character.global_position
	
	var char_y := character.global_rotation.y
	var rotated := tilt_input.rotated(char_y)
	var target_x := rotated.y * angle * angle_factor
	var target_z := rotated.x * angle * angle_factor
	level_parent.rotation_degrees.x = lerpf(level_parent.rotation_degrees.x, target_x, 0.1)
	level_parent.rotation_degrees.z = lerpf(level_parent.rotation_degrees.z, target_z, 0.1)
	
	level_parent.position = character.global_position


func get_rotaters(n: Node3D) -> void:
	for c in n.get_children():
		if c is Node3D:
			get_rotaters(c)
			if "Moving_Platform" in c.name and c is MeshInstance3D:
				rotaters.push_back(c)

func set_rotaters(n: Node3D, delta) -> void:
	for c in rotaters:
		var speed := default_speed
		if c.has_meta("extras"):
			var extras: Dictionary = c.get_meta("extras")
			if "speed" in extras: speed = extras["speed"]
		
		c.rotation.y += delta * speed

func rotations_process(delta: float) -> void:
	set_rotaters(level_node, delta)

func on_reset_player_position():
	character.global_position = spawn_position
	character.linear_velocity = Vector3.ZERO
