extends Node3D

@export var character: RigidBody3D
@export var level_node: Node3D
@export var level_parent: Node3D

var angle := 15.0

func _process(_delta: float) -> void:
	var _rotate_x := 0.0
	var _rotate_z := 0.0
	if Input.is_action_pressed("left"):
		_rotate_z = angle
	elif Input.is_action_pressed("right"):
		_rotate_z = -angle
	elif Input.is_action_pressed("back"):
		_rotate_x = angle
	elif Input.is_action_pressed("forward"):
		_rotate_x = -angle
	
	level_node.position = -character.global_position
	
	var rx := level_parent.rotation_degrees.x
	var rz := level_parent.rotation_degrees.z
	level_parent.rotation_degrees.x = lerpf(rx, _rotate_x, 0.10)
	level_parent.rotation_degrees.z = lerpf(rz, _rotate_z, 0.10)
	
	level_parent.position = character.global_position
