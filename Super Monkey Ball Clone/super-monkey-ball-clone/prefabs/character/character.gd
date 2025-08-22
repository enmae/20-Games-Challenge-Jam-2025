extends RigidBody3D

var rotate_rate := 100.0

var pause_menu_scene = preload("res://prefabs/ui/menus/pause_menu.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		add_child(pause_menu_scene.instantiate())
		get_tree().root.set_input_as_handled()

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		rotate_y(deg_to_rad(delta * rotate_rate))
	if Input.is_action_pressed("right"):
		rotate_y(deg_to_rad(-delta * rotate_rate))
