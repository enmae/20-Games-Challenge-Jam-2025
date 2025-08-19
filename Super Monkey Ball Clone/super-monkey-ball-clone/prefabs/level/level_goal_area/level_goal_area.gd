extends Area3D

func _on_body_entered(body: Node3D) -> void:
	if (body.is_in_group("player")):
		print("beat level!")
		# get_tree().paused = true
		body.linear_velocity = Vector3.ZERO
