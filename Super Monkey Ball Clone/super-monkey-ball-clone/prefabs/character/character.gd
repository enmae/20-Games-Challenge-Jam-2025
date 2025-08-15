extends RigidBody3D

@onready var camera_pivot: Node3D = %CameraPivot
@onready var camera_3d: Camera3D = %Camera3D

var tilt_angle := 45.0

func _process(delta: float) -> void:
	tilt_process()

func tilt_process() -> void:

	var tilt_x := 0.0
	var tilt_z := 0.0
	if Input.is_action_pressed("forward"):
		tilt_x = tilt_angle
	elif Input.is_action_pressed("back"):
		tilt_x = -tilt_angle
	elif Input.is_action_pressed("left"):
		tilt_z = tilt_angle
	elif Input.is_action_pressed("right"):
		tilt_z = -tilt_angle
	
	var r_tilt_x := deg_to_rad(tilt_x)
	var r_tilt_z := deg_to_rad(tilt_z)
	camera_pivot.rotation.x = -r_tilt_x / 5.0
	camera_pivot.rotation.z = -r_tilt_z / 5.0
	
	var gravity_dir := Vector3.DOWN
	gravity_dir = gravity_dir.rotated(Vector3.RIGHT, r_tilt_x)
	gravity_dir = gravity_dir.rotated(Vector3.FORWARD, r_tilt_z)
	gravity_dir = gravity_dir.normalized()
	
	PhysicsServer3D.area_set_param(
		get_viewport().find_world_3d().space,
		PhysicsServer3D.AREA_PARAM_GRAVITY_VECTOR,
		gravity_dir
	)
