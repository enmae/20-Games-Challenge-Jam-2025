extends RigidBody3D

@onready var camera_pivot: Node3D = %CameraPivot

var pause_menu_scene = preload("res://prefabs/ui/menus/pause_menu.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		add_child(pause_menu_scene.instantiate())
		get_tree().root.set_input_as_handled()

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("left"):
		camera_pivot.rotate_y(deg_to_rad(delta * 90.0))
	if Input.is_action_pressed("right"):
		camera_pivot.rotate_y(deg_to_rad(-delta * 90.0))
