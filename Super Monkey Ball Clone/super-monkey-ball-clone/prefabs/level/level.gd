extends Node3D

@export var character: RigidBody3D
@export var level_node: Node3D
@export var level_parent: Node3D

@export var character_height := 1.0

var angle := 15.0

func _process(delta: float) -> void:
	var rotate_x := 0.0
	var rotate_z := 0.0
	if Input.is_action_pressed("left"):
		rotate_z = angle
	elif Input.is_action_pressed("right"):
		rotate_z = -angle
	elif Input.is_action_pressed("back"):
		rotate_x = angle
	elif Input.is_action_pressed("forward"):
		rotate_x = -angle
	
	level_node.position = -character.global_position
	
	var rx := level_parent.rotation_degrees.x
	var rz := level_parent.rotation_degrees.z
	level_parent.rotation_degrees.x = lerpf(rx, rotate_x, 0.10)
	level_parent.rotation_degrees.z = lerpf(rz, rotate_z, 0.10)
	
	level_parent.position = character.global_position
