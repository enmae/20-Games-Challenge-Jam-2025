extends Node3D

@onready var second_warp_mesh: MeshInstance3D = $SecondWarp/SecondWarpMesh
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	$%FirstWarpArea3D.body_entered.connect(on_first_warp_body_entered)

var _body: Node3D
var initial_position := Vector3.ZERO
var warping := false
var warp_timer := 0.0
var warp_time := 3.0
func _process(delta: float) -> void:
	if warping:
		warp_timer += delta
		_body.global_position = initial_position.lerp($%SecondWarp.global_position, warp_timer / warp_time)
		_body.rotate_y(0.04)
		if warp_timer > warp_time:
			_body.freeze = false
			warping = false
			GameEvents.warping = false

func on_first_warp_body_entered(body: Node3D):
	if (body.is_in_group("player")):
		audio_stream_player.play()
		_body = body
		body.freeze = true
		body.linear_velocity = Vector3.ZERO
		initial_position = _body.global_position
		warping = true
		GameEvents.warping = true
		GameEvents.warp_count += 1
		GameEvents.warp_used = true
		second_warp_mesh.show()
