extends RigidBody3D

@onready var camera_pivot: Node3D = %CameraPivot

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("left"):
		camera_pivot.rotate_y(deg_to_rad(delta * 90.0))
	if Input.is_action_pressed("right"):
		camera_pivot.rotate_y(deg_to_rad(-delta * 90.0))
