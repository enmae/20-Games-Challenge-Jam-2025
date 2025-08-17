extends Node3D

@export var character: RigidBody3D
@export var level_node: Node3D
@export var level_parent: Node3D

var angle := 15.0

func _process(_delta: float) -> void:
	var _rotate_x := 0.0
	var _rotate_z := 0.0
	var tilt_input := Vector2.ZERO
	if Input.is_action_pressed("left"):
		_rotate_z = angle
		tilt_input.x = -1
	elif Input.is_action_pressed("right"):
		_rotate_z = -angle
		tilt_input.x = 1
	elif Input.is_action_pressed("back"):
		_rotate_x = angle
		tilt_input.y = -1
	elif Input.is_action_pressed("forward"):
		_rotate_x = -angle
		tilt_input.y = 1
	
	level_node.position = -character.global_position
	
	var rx := level_parent.rotation_degrees.x
	var rz := level_parent.rotation_degrees.z
	
	var char_y := character.global_rotation.y
	var rotated := tilt_input.rotated(char_y)
	var target_x := rotated.y * angle
	var target_z := rotated.x * angle
	level_parent.rotation_degrees.x = lerpf(level_parent.rotation_degrees.x, target_x, 0.1)
	level_parent.rotation_degrees.z = lerpf(level_parent.rotation_degrees.z, target_z, 0.1)
	
	level_parent.position = character.global_position
