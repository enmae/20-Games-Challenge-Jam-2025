extends RigidBody3D

var rotate_rate := 100.0

var pause_menu_scene = preload("res://prefabs/ui/menus/pause_menu.tscn")

@onready var audio_stream_player: AudioStreamPlayer = %AudioStreamPlayer
@onready var area_3d: Area3D = $Area3D
@onready var animation_player: AnimationPlayer = $cat2/AnimationPlayer
@onready var ball: MeshInstance3D = $Ball

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		add_child(pause_menu_scene.instantiate())
		get_tree().root.set_input_as_handled()

func _process(delta: float) -> void:
	var on_floor := len(area_3d.get_overlapping_bodies()) > 1
	var v := linear_velocity.length()
	if not on_floor: v = 0.0
	audio_stream_player.volume_linear = smoothstep(0.0, 5.0, v)
	
	var anim := "sitting"
	animation_player.speed_scale = 1.0
	if v > 0.1:
		anim = "running"
		animation_player.speed_scale = 0.5 + smoothstep(0.0, 3.0, v) * 1.5
	
	if animation_player.current_animation != anim:
		animation_player.play(anim)
	
	var forward_speed := linear_velocity.dot(global_basis.z.normalized())
	ball.rotation_degrees.x += forward_speed

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		rotate_y(deg_to_rad(delta * rotate_rate))
	if Input.is_action_pressed("right"):
		rotate_y(deg_to_rad(-delta * rotate_rate))
