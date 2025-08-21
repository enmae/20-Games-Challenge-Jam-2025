extends Node3D

func _ready() -> void:
	$%FirstWarpArea3D.body_entered.connect(on_first_warp_body_entered)

func on_first_warp_body_entered(body: Node3D):
	if (body.is_in_group("player")):
		body.position = $%SecondWarp.global_position
		body.linear_velocity = Vector3.ZERO
		GameEvents.warp_count += 1
		GameEvents.warp_used = true
