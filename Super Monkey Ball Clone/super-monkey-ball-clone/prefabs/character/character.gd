extends RigidBody3D

var rotate_rate := 120.0

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		rotate_y(deg_to_rad(delta * rotate_rate))
	if Input.is_action_pressed("right"):
		rotate_y(deg_to_rad(-delta * rotate_rate))
