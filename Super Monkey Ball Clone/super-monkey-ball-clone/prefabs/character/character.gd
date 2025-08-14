extends RigidBody3D

var previous_position

func _process(delta: float) -> void:
	previous_position = position
	
	if Input.is_action_pressed("left"):
		PhysicsServer3D.area_set_param(get_viewport().find_world_3d().space,
			PhysicsServer3D.AREA_PARAM_GRAVITY_VECTOR, Vector3.RIGHT)
	else:
		PhysicsServer3D.area_set_param(get_viewport().find_world_3d().space,
			PhysicsServer3D.AREA_PARAM_GRAVITY_VECTOR, Vector3.DOWN)
